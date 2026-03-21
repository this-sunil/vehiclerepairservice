import 'dart:developer';

import 'package:vehicle_repair_service/layer/Widget/NoDataFoundScreen.dart';

import '../../core/Bloc/BookBloc/BookBloc.dart';
import '../../core/Routes/route.dart';
import '../../layer/Widget/CustomHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
              return NoDataFoundScreen(message: "${state.msg}",onRetry: (){
                context.read<BookBloc>().add(FetchSlotHistoryEvent(page: page));

              },buttonText: "Retry");
            case BookStatus.completed:
              final items = state.model ?? [];
              return ListView.builder(
                controller: _scrollController,
                itemCount:items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  if (items.isEmpty) {
                    return const Center(child: Text('No data found'));
                  } else if (index < items.length) {
                    return Card(
                      child: ListTile(
                        onTap: (){
                            context.push(AppRoute.historyViews,arguments: {
                              "bookId": item.bookId,
                              "vehicleName": item.vehicleName,
                              'registrationNo': item.registrationNo,
                              "vehiclePhoto":'${dotenv.env['BASE_URL']}/upload/${item.vehiclePhoto.toString()}',
                              "vehicleType": item.vehicleType,
                              "slotDate": item.slotDate,
                              "slotTime": item.slotTime,
                              "serviceName": item.serviceName,

                            });
                        },
                        leading: Hero(
                          tag: item.bookId.toString(),
                          child: CircleAvatar(
                            maxRadius: 30,
                            backgroundImage: NetworkImage(
                              '${dotenv.env['BASE_URL']}/upload/${item.vehiclePhoto.toString()}',
                            ),
                          ),
                        ),
                        title: TranslateText(item.vehicleName.toString()),
                        subtitle: Text(
                          '${item.slotDate.toString()},${item.slotTime.toString()}',
                        ),
                      ),
                    );
                  }
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: LoadingIndicator(),
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
