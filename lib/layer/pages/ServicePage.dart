import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/Bloc/LocationBloc/LocationBloc.dart';
import '../../core/Bloc/ShopBloc/ShopBloc.dart';
import '../../core/Routes/route.dart';
import '../../layer/Widget/CustomHelper.dart';
import 'package:flutter/material.dart';
import '../../layer/Widget/LoadingIndicator.dart';
import '../../layer/Widget/TranslateText.dart';
import '../Widget/NoDataFoundScreen.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> with CustomHelperMixin {
  final ScrollController _scrollController = ScrollController();
  int page = 1;
  int calculateDistanceKm(LatLng dest) {
    final state = context.read<LocationBloc>().state;
    final double distanceInMeters =
    state.status == LocationStatus.completed
        ? Geolocator.distanceBetween(
      state.model?.lat ?? 0.0,
      state.model?.long ?? 0.0,
      dest.latitude,
      dest.longitude,
    ): 0.0;
    return (distanceInMeters / 1000).floor();
  }

   String? city;
  @override
  void initState() {
    // TODO: implement initState
    final state = context.read<LocationBloc>().state;
    String city="${state.model?.currentAddress?[0].locality}";
    context.read<ShopBloc>().add(
      SearchNearByCityEvent(
        page: page,
        city: city.toString(),
      ),
    );

    _scrollController.addListener(() {
      final states = context.read<ShopBloc>().state;
      bool hasMore=states.status==ShopStatus.completed? states.hasMore:false;
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && hasMore) {
        page++;
        context.read<ShopBloc>().add(
          SearchNearByCityEvent(
            page: page,
            city: city.toString(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ShopBloc, ShopState>(
        builder: (context, state) {
          switch (state.status) {
            case ShopStatus.loading:
              return LoadingIndicator();
            case ShopStatus.completed:
              final serviceItem = state.model ?? [];
              return ListView.builder(
                controller: _scrollController,
                scrollDirection: .vertical,
                itemCount: serviceItem.length,
                itemBuilder: (context, index) {
                  final item = serviceItem[index];
                  if (index < serviceItem.length) {
                    return GestureDetector(
                      onTap: (){
                        context.push(AppRoute.trackerScreen,arguments: {
                          'title':item.shopName,
                          'phone':item.phone,
                          'city':item.city,
                          'shopTime':item.shopTime,
                          'destination':LatLng(item.lat??0.0,item.long??0.0)
                        });
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              width: context.width,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: .only(
                                  topLeft: .circular(10),
                                  topRight: .circular(10),
                                ),
                                image: DecorationImage(
                                  fit: .cover,
                                  image: AssetImage(splashIcon),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: .topRight,
                                    child: Card(
                                      color: Colors.deepPurpleAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: .circular(10),
                                      ),
                                      child: Padding(
                                        padding: .all(8),
                                        child: TranslateText(
                                          item.status==true ? 'Open Service' : 'Closed Service',
                                          style: TextStyle(
                                            fontWeight: .bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: .all(8),
                              child: ListTile(
                                title: TranslateText(
                                  "${item.shopName}",
                                  style: TextStyle(

                                    fontWeight: .bold,
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: TranslateText('${item.city}'),
                                //trailing: Text('${calculateDistanceKm(LatLng(item.lat??0.0,item.long??0.0))} Km',style: TextStyle(fontSize: 16,fontWeight: .bold)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LoadingIndicator(),
                  );
                },
              );

            case ShopStatus.error:
              return NoDataFoundScreen(message: state.msg.toString(),buttonText: 'Retry',onRetry: (){
                context.read<ShopBloc>().add(
                  SearchNearByCityEvent(
                    page: page,
                    city: city.toString(),
                  ),
                );
              });
            default:
              return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
