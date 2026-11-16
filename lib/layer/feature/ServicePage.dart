import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/Bloc/ServiceBloc/ServiceBloc.dart';
import '../../core/Routes/route.dart';
import '../../core/Services/ApiUtils.dart';
import '../Widget/CustomHelper.dart';
import '../Widget/LoadingIndicator.dart';
import '../Widget/NoDataFoundScreen.dart';
import '../Widget/TranslateText.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage>
    with SingleTickerProviderStateMixin, CustomHelperMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late int page;
  late ScrollController scrollController;

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
    super.initState();
    page = 1;
    context.read<ServiceBloc>().add(FetchServiceEvent(page: page));

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
  }

  @override
  void dispose() {
    _controller.dispose();
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TranslateText('Vehicle Service')),
      body: BlocBuilder<ServiceBloc, ServiceState>(
        builder: (context, state) {
          switch (state.status) {
            case ServiceStatus.loading:
              return LoadingIndicator();
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
                    controller: scrollController,
                    padding: .zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount:
                        productItem.length + (state.hasMore == true ? 1 : 0),
                    scrollDirection: .vertical,
                    itemBuilder: (context, index) {
                      if (index >= productItem.length) {
                        return const Padding(
                          padding: EdgeInsets.all(12),
                          child: LoadingIndicator(),
                        );
                      }

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
    );
  }
}
