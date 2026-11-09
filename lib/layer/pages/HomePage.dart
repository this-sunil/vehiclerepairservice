import 'dart:async';

import 'package:heroicons/heroicons.dart';
import 'package:vehicle_repair_service/layer/Widget/NoDataFoundScreen.dart';

import '../../core/Bloc/CategoryBloc/CategoryBloc.dart';
import '../../core/Bloc/ServiceBloc/ServiceBloc.dart';
import '../../core/Routes/route.dart';
import '../../core/Services/ApiUtils.dart';
import '../../layer/Widget/CustomHelper.dart';
import '../../layer/Widget/CustomInputText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layer/Widget/LoadingIndicator.dart';
import '../../layer/Widget/TranslateText.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, CustomHelperMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  String hintText = 'Search Service';

  late int page;
  late ScrollController scrollController;
  TextEditingController searchController = TextEditingController();

  Timer? _debounce;

  void onSearchChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      if (!mounted) return;
      page = 1;
      final search = query.trim().toLowerCase();
      if (search.isEmpty) {
        context.read<ServiceBloc>().add(FetchServiceEvent(page: page));
      } else {
        context.read<ServiceBloc>().add(
          SearchEvent(searchText: search, page: page),
        );
      }
    });
  }

  void _onScroll() {
    if (!scrollController.hasClients) return;
    final position = scrollController.position;
    if (position.pixels < position.maxScrollExtent - 200) return;

    final state = context.read<ServiceBloc>().state;
    if (state.status != ServiceStatus.completed || state.hasMore != true) {
      return;
    }

    page++;
    context.read<ServiceBloc>().add(FetchServiceEvent(page: page));
  }

  @override
  void initState() {
    // TODO: implement initState
    page = 1;
    context.read<ServiceBloc>().add(FetchServiceEvent(page: page));
    context.read<CategoryBloc>().add(FetchCatEvent());
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<Offset>(begin: Offset(0.0, 1.0), end: .zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
    );
    _controller.forward();
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    _controller.dispose();
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Padding(
              padding: .all(4),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: .circular(10)),
                child: CustomInputText(
                  controller: searchController,
                  primaryColor: Colors.white,
                  onChanged: (v) => onSearchChanged(v),
                  prefixIcon: HeroIcon(
                    HeroIcons.magnifyingGlass,
                    color: Colors.black,
                  ),
                  hintText: 'Search Service',
                  inputFormatter: [],
                ),
              ),
            ),

            BlocBuilder<ServiceBloc, ServiceState>(
              builder: (context, state) {
                switch (state.status) {
                  case ServiceStatus.completed:
                    return Padding(
                      padding: .all(8),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          TranslateText(
                            'Vehicle Services',
                            style: TextStyle(fontSize: 16, fontWeight: .w600),
                          ),
                          TextButton(
                            onPressed: () {
                              context.push(AppRoute.servicePage);
                            },
                            child: TranslateText('See All', style: TextStyle()),
                          ),
                        ],
                      ),
                    );
                  default:
                    return SizedBox();
                }
              },
            ),

            BlocBuilder<ServiceBloc, ServiceState>(
              builder: (context, state) {
                switch (state.status) {
                  case ServiceStatus.loading:
                    return SizedBox(
                      height: context.height * .6,
                      child: LoadingIndicator(),
                    );
                  case ServiceStatus.completed:
                    final productItem = state.result ?? [];
                    if (productItem.isEmpty) {
                      return NoDataFoundScreen(
                        message: 'No services found',
                        buttonText: 'Retry',
                        onRetry: () {
                          page = 1;
                          context.read<ServiceBloc>().add(
                            FetchServiceEvent(page: page),
                          );
                        },
                      );
                    }
                    return AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return GridView.builder(
                          padding: .zero,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                          itemCount: productItem.length,
                          scrollDirection: .vertical,
                          itemBuilder: (context, index) {
                            final items = productItem[index];
                            final photoUrl = imageUrl(items.photo);
                            return GestureDetector(
                              onTap: () {
                                context.push(
                                  AppRoute.vehicleCategory,
                                  arguments: {
                                    "serviceId": items.id?.toString() ?? '',
                                    "serviceName": items.title ?? '',
                                  },
                                );
                              },
                              child: AnimatedSlide(
                                duration: Duration(seconds: index),
                                offset: Offset(
                                  _animation.value.dx,
                                  _animation.value.dy,
                                ),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: .spaceAround,
                                    crossAxisAlignment: .center,
                                    children: [
                                      CircleAvatar(
                                        maxRadius: 60,
                                        backgroundColor: Colors.amber,
                                        backgroundImage: photoUrl == null
                                            ? AssetImage(splashIcon)
                                            : NetworkImage(photoUrl),
                                      ),
                                      Padding(
                                        padding: .all(8),
                                        child: TranslateText(
                                          items.title.toString(),
                                          textAlign: .center,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: .w900,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  case ServiceStatus.error:
                    return NoDataFoundScreen(
                      message: '${state.msg}',
                      buttonText: 'Retry',
                      onRetry: () {
                        page = 1;
                        context.read<ServiceBloc>().add(
                          FetchServiceEvent(page: page),
                        );
                      },
                    );
                  default:
                    return SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
