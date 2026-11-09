import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/Bloc/LocationBloc/LocationBloc.dart';
import '../../core/Bloc/ShopBloc/ShopBloc.dart';
import '../../core/Routes/route.dart';
import '../../core/Services/ApiUtils.dart';
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
  String? city;
  bool _requestInFlight = false;

  int calculateDistanceKm(LatLng dest) {
    final state = context.read<LocationBloc>().state;
    final double distanceInMeters = state.status == LocationStatus.completed
        ? Geolocator.distanceBetween(
            state.model?.lat ?? 0.0,
            state.model?.long ?? 0.0,
            dest.latitude,
            dest.longitude,
          )
        : 0.0;
    return (distanceInMeters / 1000).floor();
  }

  String? _resolveCity() {
    final addresses = context.read<LocationBloc>().state.model?.currentAddress;
    if (addresses == null || addresses.isEmpty) return null;
    return addresses.first.locality;
  }

  void _loadShops({bool reset = false}) {
    if (_requestInFlight) return;
    final resolvedCity = _resolveCity();
    if (resolvedCity == null || resolvedCity.trim().isEmpty) return;

    city = resolvedCity;
    if (reset) page = 1;
    _requestInFlight = true;
    context.read<ShopBloc>().add(
      SearchNearByCityEvent(page: page, city: city!),
    );
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.pixels < position.maxScrollExtent - 200) return;

    final state = context.read<ShopBloc>().state;
    if (_requestInFlight ||
        state.status != ShopStatus.completed ||
        !state.hasMore) {
      return;
    }

    page++;
    _requestInFlight = true;
    context.read<ShopBloc>().add(
      SearchNearByCityEvent(page: page, city: city ?? ''),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    final location = context.read<LocationBloc>().state;
    if (location.status == LocationStatus.completed) {
      _loadShops();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationBloc, LocationState>(
      listenWhen: (previous, current) =>
          previous.status != LocationStatus.completed &&
          current.status == LocationStatus.completed,
      listener: (context, state) {
        if (city == null) _loadShops();
      },
      child: BlocConsumer<ShopBloc, ShopState>(
        listener: (context, state) {
          if (state.status == ShopStatus.completed ||
              state.status == ShopStatus.error) {
            _requestInFlight = false;
          }
        },
        builder: (context, state) {
          switch (state.status) {
            case ShopStatus.loading:
              return LoadingIndicator();
            case ShopStatus.completed:
              final serviceItem = state.model ?? [];
              if (serviceItem.isEmpty) {
                return NoDataFoundScreen(
                  message: 'No nearby service center found',
                  buttonText: 'Retry',
                  onRetry: () => _loadShops(reset: true),
                );
              }
              return ListView.builder(
                controller: _scrollController,
                scrollDirection: .vertical,
                itemCount: serviceItem.length + (state.hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index >= serviceItem.length) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: LoadingIndicator(),
                    );
                  }

                  final item = serviceItem[index];
                  final destination = LatLng(item.lat ?? 0.0, item.long ?? 0.0);
                  final photoUrl = imageUrl(item.shopphoto);
                  return GestureDetector(
                    onTap: () {
                      context.push(
                        AppRoute.trackerScreen,
                        arguments: {
                          'title': item.shopname ?? '',
                          'phone': item.phone ?? '',
                          'city': item.city ?? '',
                          'shopTime': item.shoptime ?? '',
                          'destination': destination,
                        },
                      );
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
                                image: photoUrl == null
                                    ? AssetImage(splashIcon)
                                    : NetworkImage(photoUrl),
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
                                        item.status == true
                                            ? 'Open Service'
                                            : 'Closed Service',
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
                                item.shopname ?? '',
                                style: TextStyle(
                                  fontWeight: .bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: TranslateText(item.city ?? ''),
                              trailing: Text(
                                '${calculateDistanceKm(destination)} Km',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: .bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );

            case ShopStatus.error:
              return NoDataFoundScreen(
                message: state.msg.toString(),
                buttonText: 'Retry',
                onRetry: () => _loadShops(reset: true),
              );
            default:
              return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
