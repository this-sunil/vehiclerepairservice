
import '../../core/Bloc/InternetBloc/InternetBloc.dart';
import '../../core/Bloc/LocationBloc/LocationBloc.dart';
import '../../core/Routes/route.dart';
import '../pages/SettingScreen.dart';
import '../../layer/pages/HistoryPage.dart';
import '../../layer/pages/ServicePage.dart';
import '../../layer/pages/HomePage.dart';
import '../../layer/Widget/CustomHelper.dart';
import '../../layer/Widget/NoInternetScreen.dart';
import '../../layer/Widget/TranslateText.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

import '../../layer/Widget/RotateAnimation.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with CustomHelperMixin {
  int currentIndex = 0;
  late Widget currentPage;
  List<Widget> pages = [];
  HomePage homePage = HomePage();
  HistoryPage historyPage = HistoryPage();

  ServicePage servicePage = ServicePage();
  SettingScreen settingScreen = SettingScreen(flag: false);
  @override
  void initState() {
    // TODO: implement initState
    context.read<InternetBloc>().add(FetchInternetEvent());
    pages = [homePage, servicePage, historyPage, settingScreen];
    currentPage = pages[currentIndex];
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<InternetBloc, InternetState>(
      builder: (context, state) {
        switch (state.status) {
          case InternetStatus.error:
            return NoInternetScreen();
          default:
            return Scaffold(
              appBar: AppBar(
                centerTitle: false,
                leading: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    elevation: 5,
                    shape: CircleBorder(),
                    child: RotateAnimation(),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: .start,
                  children: [
                    TranslateText(
                      currentIndex == 0
                          ? "Vehicle Repair Service"
                          : currentIndex == 1
                          ? "Nearby Service Center"
                          : currentIndex == 2
                          ? "Slot Book History"
                          : "My Account",
                      style: TextStyle(

                        fontWeight: .w600,
                        fontSize: 18,
                        color: Colors.white
                      ),
                    ),
                    BlocBuilder<LocationBloc, LocationState>(
                      builder: (context, state) {
                        switch (state.status) {
                          case LocationStatus.completed:
                            return TranslateText(
                              '${state.model?.currentAddress?[0].locality}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white

                              ),
                            );
                          default:
                            return Container();
                        }
                      },
                    ),
                  ],
                ),

                actions: [
                  IconButton(
                    onPressed: () {
                      context.push(AppRoute.notification);
                    },
                    icon: Icon(HeroiconsOutline.bell),
                  ),
                  IconButton(
                    onPressed: () {
                      context.push(AppRoute.settings);
                    },
                    icon: Icon(HeroiconsOutline.cog6Tooth),
                  ),
                ],
              ),
              body: currentPage,
             /* floatingActionButton: FloatingActionButton(onPressed: (){
                context.push(AppRoute.generatePdf);
              },child: Icon(Icons.file_download)),*/
              bottomNavigationBar: CircleNavBar(
                height: 90,
                gradient: LinearGradient(
                  begin: AlignmentGeometry.topLeft,
                  end: AlignmentGeometry.bottomRight,
                  colors: [Colors.orangeAccent, Colors.redAccent],
                ),
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                    currentPage = pages[currentIndex];
                  });
                },
                cornerRadius: BorderRadius.circular(10),
                tabCurve: Curves.fastOutSlowIn,
                activeIndex: currentIndex,
                activeIcons: [
                  Icon(HeroiconsSolid.home, color: Colors.white),
                  Icon(HeroiconsOutline.square3Stack3d, color: Colors.white),
                  Icon(HeroiconsOutline.archiveBox, color: Colors.white),
                  Icon(Icons.menu, color: Colors.white),
                ],
                inactiveIcons: [
                  Icon(HeroiconsSolid.home, color: Colors.grey.shade300),
                  Icon(
                    HeroiconsSolid.square3Stack3d,
                    color: Colors.grey.shade300,
                  ),
                  Icon(HeroiconsSolid.archiveBox, color: Colors.grey.shade300),
                  Icon(Icons.menu, color: Colors.grey.shade300),
                ],
                color: Colors.deepOrangeAccent,
              ),
              // floatingActionButton: FloatingActionButton.extended(onPressed: (){
              //   context.push(AppRoute.player);
              // },label: Text("Work Preview")),
            );
        }
      },
    );
  }
}
