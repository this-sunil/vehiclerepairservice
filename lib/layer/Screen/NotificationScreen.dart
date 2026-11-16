import 'dart:developer';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:vehicle_repair_service/layer/Widget/NoDataFoundScreen.dart';

import '../../core/Bloc/NotificationBloc/NotificationBloc.dart';
import '../../core/Services/ApiUtils.dart';
import '../../layer/Widget/CustomHelper.dart';
import '../../layer/Widget/LoadingIndicator.dart';
import '../../layer/Widget/TranslateText.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with CustomHelperMixin {
  final ScrollController _scrollController = ScrollController();
  final DateFormat _dateFormat = DateFormat('dd MMM yyyy, hh:mm a');

  int _currentPage = 1;
  bool _requestInFlight = false;

  void _scrollListener() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.pixels < position.maxScrollExtent - 200) return;

    final state = context.read<NotificationBloc>().state;
    if (_requestInFlight ||
        state.status != NotificationStatus.completed ||
        !state.hasMore) {
      return;
    }

    _requestInFlight = true;
    _currentPage++;
    log('Page=>$_currentPage');
    context.read<NotificationBloc>().add(
      FetchNotificationEvent(page: _currentPage),
    );
  }

  @override
  void initState() {
    super.initState();
    _requestInFlight = true;
    context.read<NotificationBloc>().add(
      FetchNotificationEvent(page: _currentPage),
    );
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TranslateText("Notification")),
      body: BlocConsumer<NotificationBloc, NotificationState>(
        listener: (context, state) {
          if (state.status == NotificationStatus.completed ||
              state.status == NotificationStatus.error) {
            _requestInFlight = false;
          }
        },
        builder: (context, state) {
          switch (state.status) {
            case NotificationStatus.completed:
              final model = state.model ?? [];
              if (model.isEmpty) {
                return NoDataFoundScreen(
                  message: 'No notifications found',
                  buttonText: 'Retry',
                  onRetry: () {
                    _requestInFlight = true;
                    _currentPage = 1;
                    context.read<NotificationBloc>().add(
                      FetchNotificationEvent(page: _currentPage),
                    );
                  },
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  _currentPage = 1;
                  _requestInFlight = true;
                  context.read<NotificationBloc>().add(
                    FetchNotificationEvent(page: _currentPage),
                  );
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: model.length + (state.hasMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index >= model.length) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: LoadingIndicator(),
                      );
                    }

                    final item = model[index];
                    final photoUrl = imageUrl(item.photo);
                    return Card(
                      child: Column(
                        children: [
                          if (photoUrl != null)
                            Container(
                              width: context.width,
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: .cover,
                                  image: NetworkImage(photoUrl),
                                ),
                              ),
                            ),
                          Padding(
                            padding: .all(8),
                            child: ListTile(
                              title: Text(
                                item.title ?? '',
                                style: TextStyle(
                                  fontWeight: .bold,
                                  fontSize: 18,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: .start,
                                mainAxisAlignment: .start,
                                children: [
                                  Text(
                                    item.description ?? '',
                                    style: TextStyle(fontSize: 12),
                                    textAlign: .justify,
                                    overflow: .ellipsis,
                                  ),
                                  Text(
                                    item.createdAt == null
                                        ? ''
                                        : _dateFormat.format(item.createdAt!),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            case NotificationStatus.loading:
              return LoadingIndicator();
            case NotificationStatus.error:
              return NoDataFoundScreen(
                message: '${state.msg}',
                buttonText: 'Retry',
                onRetry: () {
                  _requestInFlight = true;
                  context.read<NotificationBloc>().add(
                    FetchNotificationEvent(page: _currentPage),
                  );
                },
              );
            default:
              return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
