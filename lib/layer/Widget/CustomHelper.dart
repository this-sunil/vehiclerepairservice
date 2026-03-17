import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

import '../../core/Routes/route.dart';
import 'Storage.dart';
import 'TranslateText.dart';

mixin CustomHelperMixin{

  //TODO : Set Picture
  static const basePic='assets/icons';
  String appName='Vehicle Repair Service';
  String logoIcon='$basePic/logo.png';
  String splashIcon='$basePic/splash.jpg';
  static String noInternetIcon='$basePic/no-internet.gif';

  String carServiceIcon='$basePic/car-service.jpg';
  String carWashIcon='$basePic/car-wash.jpg';
  String oilIcon='$basePic/oil.jpg';
  String tyreIcon='$basePic/tyres.jpg';
  String brakeIcon='$basePic/brake-service.jpg';
  String batteryIcon='$basePic/battery-service.jpg';
  String transmissionIcon='$basePic/transmission-service.jpg';
  Widget customImage({required String path,double? width,double? height,BoxFit? fit,double? radius,Widget? child}){
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: .circular(radius??0.0),
        image: DecorationImage(
            fit: fit??BoxFit.contain,
            image: AssetImage(path)
        )
      ),
      child: child,
    );
  }


  Future<void> logout(BuildContext context) async{
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: .circular(10),
          ),
          insetPadding: .zero,
          contentPadding: .all(10),
          content: Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            mainAxisSize: .min,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsetsGeometry.all(12),
                child: CircleAvatar(
                  maxRadius: 50,
                  backgroundColor: Colors.pinkAccent.shade100,
                  child: Icon(
                    HeroiconsOutline.arrowLeftEndOnRectangle,
                    size: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TranslateText("Do you want to logout?",style: TextStyle(fontWeight: .bold,fontSize: 18)),
              ),
              Padding(
                padding: .symmetric(horizontal:10,vertical:8),
                child: Row(
                  mainAxisAlignment: .spaceAround,
                  children: [
                    Expanded(
                      flex:4,
                      child: ElevatedButton(
                        style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                                borderRadius: .circular(10)
                            )
                        ),
                        onPressed: () {
                          context.pop();
                        },
                        child: TranslateText("Cancel",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: .bold)),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                        flex:4,
                        child: ElevatedButton(
                          style:ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: .circular(10)
                              )
                          ),
                          onPressed: () async {
                            await Storage.instance
                                .resetToken()
                                .whenComplete(() {
                              context.pushAndRemoveUntil(AppRoute.login);
                            });
                          },
                          child: TranslateText("Ok",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: .bold)),
                        )),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
extension MediaQueryExtension on BuildContext {
  Size get size=>MediaQuery.of(this).size;
  double get width => size.width;
  double get height => size.height;
}

