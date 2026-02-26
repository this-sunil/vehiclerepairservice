import 'dart:developer';
import 'dart:math' as math;
import 'package:vehicle_repair_service/Routes/route.dart';
import 'package:vehicle_repair_service/Widget/CustomHelper.dart';
import 'package:vehicle_repair_service/Widget/Storage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin, CustomHelperMixin {
  late AnimationController _controller, _opacityController;
  late Animation<double> _animation, _opacityAnimation;

  Future<void> fetchUser() async {
    String? id = await Storage.instance.getUID();
    String? token = await Storage.instance.getToken();
    log("User id=>$id Token=>$token");
    if (id == null) {
      context.pushAndRemoveUntil(AppRoute.overView);
    } else {
      context.pushAndRemoveUntil(AppRoute.dashboard);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _opacityController = AnimationController(
      vsync: this,
      duration: Duration(microseconds: 1000),
    );
    _animation = Tween(
      begin: -2 * math.pi,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _opacityController, curve: Curves.easeInOut),
    );
    _controller.forward();
    _opacityController.forward();

    _controller.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.completed:
          log("message=>$status");
          fetchUser();
        default:
          break;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.removeListener((){});
    _controller.dispose();
    _opacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: customImage(
        path: splashIcon,
        width: context.width,
        height: context.height,
        fit: .cover,
        child: Stack(
          children: [
            Align(
              alignment: .center,
              child: RotationTransition(
                turns: _animation,
                child: Card(
                  color: Colors.white,
                  shape: CircleBorder(),
                  child: Padding(
                    padding: .all(3),
                    child: customImage(
                      path: logoIcon,
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                      radius: 10,
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: context.height / 3,
              left: 0,
              right: 0,
              child: Padding(
                padding: .all(12),
                child: Align(
                  alignment: .center,
                  child: FadeTransition(
                    opacity: _opacityAnimation,
                    child: Text(
                      appName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // overridden by gradient
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
