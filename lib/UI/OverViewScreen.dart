import 'package:vehicle_repair_service/Widget/CustomHelper.dart';
import 'package:flutter/material.dart';
import '../Model/ItemModel.dart';
import '../Routes/route.dart';

class OverViewScreen extends StatefulWidget {
  const OverViewScreen({super.key});

  @override
  State<OverViewScreen> createState() => _OverViewScreenState();
}

class _OverViewScreenState extends State<OverViewScreen>
    with TickerProviderStateMixin, CustomHelperMixin {
  late PageController _pageController;
  late AnimationController _controller;

  List<ItemModel> list = [];
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    list = [
      ItemModel(
        id: '1',
        name: 'Car Service',
        imgUrl: carServiceIcon,
        description:
            'Mechanical inspection, fluid replacement, and system calibration for optimal performance.',
      ),
      ItemModel(
        id: '2',
        name: 'Battery Diagnostics',

        imgUrl: batteryIcon,
        description:
            'Voltage, CCA, and charging-system diagnostics to evaluate battery condition.',
      ),
      ItemModel(
        id: '3',
        name: 'Car Wash Service',
        imgUrl: carWashIcon,
        description:
            'Exterior wash process including pre-rinse, foam application, and surface treatment.',
      ),
    ];
    _pageController = PageController(initialPage: currentIndex);
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _controller.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.completed:
          if (currentIndex < list.length - 1) {
            currentIndex++;
            _pageController.animateToPage(
              currentIndex,
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
            );
            _controller
              ..reset()
              ..forward();
          } else {
            context.pushAndRemoveUntil(AppRoute.login);
          }
          break;

        default:
          break;
      }
    });

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
     list.clear();
     _controller.removeListener((){});
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: list.length,
        controller: _pageController,
        itemBuilder: (context, index) {
          final item = list[index];
          return Stack(
            children: [
              Positioned.fill(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      item.imgUrl,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black45],
                          stops: [0.6, 1.0],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black45],
                          stops: [0.6, 1.0],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black45],
                          stops: [0.6, 1.0],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black45],
                          stops: [0.6, 1.0],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black45],
                          stops: [0.6, 1.0],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black45],
                          stops: [0.6, 1.0],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black45],
                          stops: [0.6, 1.0],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black45],
                          stops: [0.6, 1.0],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black45],
                          stops: [0.6, 1.0],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 50,
                left: 10,
                right: 10,
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Padding(
                      padding: .all(5),
                      child: Text(
                        item.name,
                        textAlign: .left,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: .bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        item.description,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: .bold
                        ),
                        textAlign: .justify
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
