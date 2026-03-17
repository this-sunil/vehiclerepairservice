import 'package:flutter/cupertino.dart';
enum ScreenSize { mobile, tablet, desktop }

ScreenSize getSize(double width) {
  if (width < 600) return ScreenSize.mobile;
  if (width < 1200) return ScreenSize.tablet;
  return ScreenSize.desktop;
}

class Responsive extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;
  const Responsive({super.key, required this.mobile, this.tablet, this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constraint){
      switch(getSize(constraint.maxWidth)){
        case ScreenSize.mobile:
          return mobile??SizedBox();
        case ScreenSize.tablet:
          return tablet??SizedBox();
        default:
          return desktop??SizedBox();
      }
    });
  }
}
