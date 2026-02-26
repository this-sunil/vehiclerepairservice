import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vehicle_repair_service/Widget/CustomHelper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vehicle_repair_service/Widget/LoadingIndicator.dart';
import 'package:vehicle_repair_service/Widget/TranslateText.dart';

import '../../Bloc/NotificationBloc/NotificationBloc.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with CustomHelperMixin {
   ScrollController scrollController=ScrollController();
  int currentIndex = 1;
  bool isLoadingMore = false;
  void _scrollListener() {

    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent - 200) {

        currentIndex++;
        log("Page=>$currentIndex");

        context.read<NotificationBloc>().add(
          FetchNotificationEvent(page: currentIndex),
        );

    }

  }

  @override
  void initState() {
    // TODO: implement initState
    log("Notification Started");
    context.read<NotificationBloc>().add(
      FetchNotificationEvent(page: currentIndex),
    );
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.removeListener(() {});
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TranslateText("Notification")),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          switch (state.status) {
            case NotificationStatus.completed:
              final model = state.model ?? [];
              isLoadingMore = false;
              return ListView.builder(
                controller: scrollController,
                itemCount: model.length,
                itemBuilder: (context, index) {
                  final item = model[index];
                  if (index < model.length) {
                    return Card(
                      child: Column(
                        children: [
                          Container(

                            width: context.width,
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: .cover,
                                  image: NetworkImage('${dotenv.env['BASE_URL']}/upload/${item.photo.toString()}'))
                            ),
                          ),
                          Padding(
                            padding: .all(8),
                            child: ListTile(
                              title: Text(
                                '${item.title}',
                                style: TextStyle(
                                  fontWeight: .bold,
                                  fontSize: 18,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: .start,
                                mainAxisAlignment: .start,
                                children: [
                                  Text('${item.subtitle}',style: TextStyle(fontSize: 12),textAlign: .justify,overflow: .ellipsis,),
                                  Text(
                                    DateFormat(
                                      "${item.createdAt}",
                                    ).format(DateTime.now()),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return LoadingIndicator();
                },
              );
            case NotificationStatus.loading:
              return LoadingIndicator();
            default:
              return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
