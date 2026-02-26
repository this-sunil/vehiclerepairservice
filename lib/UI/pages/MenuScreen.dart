import 'package:vehicle_repair_service/Bloc/AuthBloc/AuthBloc.dart';
import 'package:vehicle_repair_service/Bloc/SettingBloc/SettingBloc.dart';
import 'package:vehicle_repair_service/Routes/route.dart';
import 'package:vehicle_repair_service/Widget/CustomHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with CustomHelperMixin {
  @override
  void initState() {
    // TODO: implement initState
    context.read<AuthBloc>().add(FetchProfileEvent());
    context.read<SettingBloc>().add(FetchSetting());
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            SizedBox(height: 20),
            BlocBuilder<AuthBloc,AuthState>(builder: (context,state){
              switch(state.status){
                case AuthStatus.fetchProfile:
                  final item=state.result?.result;
                  return Column(
                    mainAxisSize: .min,
                    children: [
                      Center(
                        child: Card(
                          elevation: 2,
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.grey.shade300),
                          ),
                          child: Padding(
                            padding: .all(4),
                            child:CircleAvatar(
                              maxRadius: 80,
                              backgroundImage:  item!=null && item.photo!.toString().isEmpty?AssetImage(splashIcon):NetworkImage('${dotenv.env['BASE_URL']}/upload/${state.result?.result?.photo}'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "${state.result?.result?.name}",
                        style: TextStyle(color: Colors.black, fontWeight: .bold),
                      ),
                      Text(
                        "${state.result?.result?.phone}",
                        style: TextStyle(color: Colors.black, fontWeight: .bold),
                      ),
                    ],
                  );
                default:
                  return Container();
              }
            }),
            Card(
              elevation: 5,
              child: ListTile(
                onTap: () {
                  context.push(AppRoute.updateProfile);
                },
                leading: Icon(HeroiconsOutline.pencilSquare),
                title: Text(
                  "Update Profile",
                  style: TextStyle(fontSize: 16, fontWeight: .bold),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(HeroiconsOutline.language),
                title: Text(
                  "App Language",
                  style: TextStyle(fontSize: 16, fontWeight: .bold),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                onTap: () {
                  context.push(AppRoute.subscription);
                },
                leading: Icon(HeroiconsOutline.currencyRupee),
                title: Text(
                  "Subscription Plan",
                  style: TextStyle(fontSize: 16, fontWeight: .bold),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                onTap: (){
                  context.read<SettingBloc>().add(FetchSetting());
                  var state=context.read<SettingBloc>().state;
                  if(state.status==SettingStatus.completed){
                    launchUrl(Uri.parse('${state.result?.result?.privacyPolicyUrl.toString()}'));
                  }
                },
                leading: Icon(HeroiconsOutline.shieldCheck),
                title: Text(
                  "Privacy Policy",
                  style: TextStyle(fontSize: 16, fontWeight: .bold),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(HeroiconsOutline.documentCheck),
                title: Text(
                  "Terms & Condition",
                  style: TextStyle(fontSize: 16, fontWeight: .bold),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                onTap: () {
                  context.push(AppRoute.emergency);
                },
                leading: Icon(HeroiconsOutline.shieldExclamation),
                title: Text(
                  "Emergency Contact",
                  style: TextStyle(fontSize: 16, fontWeight: .bold),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(HeroiconsOutline.informationCircle),
                title: Text(
                  "About Us",
                  style: TextStyle(fontSize: 16, fontWeight: .bold),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                onTap: ()  {
                  logout(context);
                },
                leading: Icon(HeroiconsOutline.arrowRightStartOnRectangle),
                title: Text(
                  "Log Out",
                  style: TextStyle(fontSize: 16, fontWeight: .bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
