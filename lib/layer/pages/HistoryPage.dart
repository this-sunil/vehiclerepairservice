import 'dart:developer';

import 'package:vehicle_repair_service/layer/Widget/NoDataFoundScreen.dart';

import '../../core/Bloc/BookBloc/BookBloc.dart';
import '../../core/Routes/route.dart';
import '../../core/Services/ApiUtils.dart';
import '../../layer/Widget/CustomHelper.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layer/Widget/LoadingIndicator.dart';
import '../Widget/TranslateText.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> with CustomHelperMixin {
  late ScrollController _scrollController;
  late int page;

  void _onScroll() {
    final bloc = context.read<BookBloc>();
    final state = bloc.state;

    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        state.hasMore == true) {
      page++;
      log('Pagination Page => $page');
      bloc.add(FetchSlotHistoryEvent(page: page));
    }
  }

  @override
  void initState() {
    page = 1;
    log("Pages=>$page");
    context.read<BookBloc>().add(FetchSlotHistoryEvent(page: page));
    _scrollController = ScrollController();
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    page = 0;
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          switch (state.status) {
            case BookStatus.loading:
              return LoadingIndicator();
            case BookStatus.error:
              return NoDataFoundScreen(
                message: "${state.msg}",
                onRetry: () {
                  context.read<BookBloc>().add(
                    FetchSlotHistoryEvent(page: page),
                  );
                },
                buttonText: "Retry",
              );
            case BookStatus.completed:
              final items = state.model ?? [];
              if (items.isEmpty) {
                return NoDataFoundScreen(
                  message: 'No booking history found',
                  onRetry: () {
                    page = 1;
                    context.read<BookBloc>().add(
                      FetchSlotHistoryEvent(page: page),
                    );
                  },
                  buttonText: "Retry",
                );
              }
              return ListView.builder(
                controller: _scrollController,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final photoUrl = imageUrl(item.vehiclePhoto);
                  return Card(
                    child: ListTile(
                      onTap: () {
                        context.push(
                          AppRoute.historyViews,
                          arguments: {
                            "bookId": item.bookId,
                            "vehicleName": item.vehicleName ?? '',
                            'registrationNo': item.registrationNo ?? '',
                            "vehiclePhoto": item.vehiclePhoto ?? '',
                            "vehicleType": item.vehicleType ?? '',
                            "slotDate": item.slotDate ?? '',
                            "slotTime": item.slotTime ?? '',
                            "serviceName": item.serviceName ?? '',
                          },
                        );
                      },
                      leading: Hero(
                        tag: item.bookId.toString(),
                        child: CircleAvatar(
                          maxRadius: 30,
                          backgroundImage: photoUrl == null
                              ? AssetImage(splashIcon)
                              : NetworkImage(photoUrl),
                        ),
                      ),
                      title: TranslateText(item.vehicleName ?? ''),
                      subtitle: Text(
                        '${item.slotDate ?? ''}, ${item.slotTime ?? ''}',
                      ),
                    ),
                  );
                },
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
