import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../Bloc/ServiceBloc/ServiceBloc.dart';
import '../../Routes/route.dart';
import '../../Widget/TranslateText.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late int page;
  late ScrollController scrollController;
  @override
  void initState() {
    // TODO: implement initState
    page=1;
    context.read<ServiceBloc>().add(FetchServiceEvent(page: page));

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<Offset>(begin: Offset(0.0, 1.0), end: .zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
    );
    _controller.forward();
    scrollController=ScrollController();
    scrollController.addListener((){
      final state=context.read<ServiceBloc>().state;
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent && state.hasMore==true){
        page++;
        context.read<ServiceBloc>().add(FetchServiceEvent(page: page));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TranslateText('Vehicle Service'),
      ),
      body: BlocBuilder<ServiceBloc, ServiceState>(
        builder: (context, state) {
          switch (state.status) {
            case ServiceStatus.completed:
              final productItem = state.result ?? [];
              return  AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return GridView.builder(
                    controller: scrollController,
                    padding: .zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: productItem.length,
                    scrollDirection: .vertical,
                    itemBuilder: (context, index) {
                      final items = productItem[index];
                      if(index<productItem.length){
                        return GestureDetector(
                          onTap: () {

                            context.push(
                                AppRoute.vehicleCategory,
                                arguments: {
                                  "serviceId": items.id.toString(),
                                  "serviceName":items.title.toString(),
                                }
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
                                    backgroundImage: NetworkImage(
                                      '${dotenv.env['BASE_URL']}/upload/${items.photo.toString()}',
                                    ),
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
                      }
                      return Padding(padding: EdgeInsetsGeometry.all(12),child: Center(child: CircularProgressIndicator()));
                    },
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
