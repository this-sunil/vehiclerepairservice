import '../../core/Bloc/CategoryBloc/CategoryBloc.dart';
import '../../core/Bloc/ServiceBloc/ServiceBloc.dart';
import '../../core/Routes/route.dart';
import '../../layer/Widget/CustomHelper.dart';
import '../../layer/Widget/CustomInputText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import '../../layer/Widget/LoadingIndicator.dart';
import '../../layer/Widget/TranslateText.dart';
import '../../data/Model/ServiceModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, CustomHelperMixin {

  late AnimationController _controller;
  late Animation<Offset> _animation;
  String hintText='Search Service';

  late int page;
  late ScrollController scrollController;
  TextEditingController searchController=TextEditingController();
  List<Result> filteredList=[];
  @override
  void initState() {
    // TODO: implement initState
    page=1;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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

                    onChanged: (v){
                      context.read<ServiceBloc>().add(SearchEvent(searchText: v.toString().toLowerCase(), page: page));
                    },
                    prefixIcon: Icon(HeroiconsOutline.magnifyingGlass,color: Colors.black),
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
                              style: TextStyle(

                                fontSize: 16,
                                fontWeight: .w600,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                  context.push(AppRoute.servicePage);
                              },
                              child: TranslateText('See All',style: TextStyle()),
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
                    case ServiceStatus.completed:
                      final productItem = state.result ?? [];
                      return AnimatedBuilder(
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
                              return Padding(padding: EdgeInsetsGeometry.all(12),child: LoadingIndicator());
                            },
                          );
                        },
                      );
                    case ServiceStatus.error:
                      return Padding(padding: EdgeInsetsGeometry.all(10),child: Center(child: TranslateText('${state.msg}')));
                    default:
                      return SizedBox();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

}
