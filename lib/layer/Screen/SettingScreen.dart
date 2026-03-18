import '../../core/Bloc/AuthBloc/AuthBloc.dart';
import '../../core/Bloc/ThemeBloc/ThemeBloc.dart';
import '../../layer/Widget/CustomHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
//import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import '../../core/Bloc/SettingBloc/SettingBloc.dart';
import '../../core/Routes/route.dart';
import '../../layer/Widget/TranslateText.dart';

class SettingScreen extends StatefulWidget {
  final bool flag;
  const SettingScreen({super.key, required this.flag});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with CustomHelperMixin {


  // final languages = [
  //   {'code': TranslateLanguage.english.bcpCode, 'label': 'English'},
  //   {'code': TranslateLanguage.hindi.bcpCode, 'label': 'Hindi'},
  //   {'code': TranslateLanguage.marathi.bcpCode, 'label': 'Marathi'},
  //   {'code': TranslateLanguage.gujarati.bcpCode, 'label': 'Gujarati'},
  //   {'code': TranslateLanguage.bengali.bcpCode, 'label': 'Bengali'},
  //   {'code': TranslateLanguage.telugu.bcpCode, 'label': 'Telugu'},
  //   {'code': TranslateLanguage.tamil.bcpCode, 'label': 'Tamil'},
  // ];
  String? selectedCode;
  // Future<String?> fetchData() async {
  //   selectedCode =
  //       await Storage.instance.getLanguage() ??
  //       TranslateLanguage.english.bcpCode;
  //   return selectedCode;
  // }

  @override
  void initState() {
    // TODO: implement initState
    //fetchData();
    context.read<AuthBloc>().add(FetchProfileEvent());
    context.read<SettingBloc>().add(FetchSetting());

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  // void showLanguageDialog() async {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return StatefulBuilder(
  //         builder: (context, setState) {
  //           return AlertDialog(
  //             insetPadding: .zero,
  //             contentPadding: .zero,
  //             title: TranslateText("Change App Language"),
  //             content: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: languages.map((lang) {
  //                 return RadioListTile<String>(
  //                   value: lang['code'].toString(),
  //                   groupValue: selectedCode,
  //                   title: TranslateText(lang['label'].toString()),
  //                   onChanged: (value) async {
  //
  //                     setState(() {
  //                       selectedCode = value;
  //                     });
  //                     await Storage.instance.setLanguage(
  //                       selectedCode.toString(),
  //                     ).whenComplete((){
  //                       if(mounted) {
  //                         context.pushAndRemoveUntil(AppRoute.dashboard);
  //                       }
  //                     });
  //
  //                   },
  //                 );
  //               }).toList(),
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.flag == true
          ? AppBar(title: TranslateText("Setting"))
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                switch (state.status) {
                  case AuthStatus.fetchProfile:
                    final item = state.result?.result;
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
                              child: CircleAvatar(
                                maxRadius: 80,
                                backgroundImage:
                                    item != null &&
                                        item.photo!.toString().isEmpty
                                    ? AssetImage(splashIcon)
                                    : NetworkImage(
                                        '${dotenv.env['BASE_URL']}/upload/${state.result?.result?.photo}',
                                      ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TranslateText(
                          "${state.result?.result?.name}",
                          style: TextStyle(fontWeight: .bold),
                        ),
                        TranslateText(
                          "${state.result?.result?.phone}",
                          style: TextStyle(fontWeight: .bold),
                        ),
                      ],
                    );
                  default:
                    return Container();
                }
              },
            ),

            Card(
              elevation: 5,
              child: ListTile(
                onTap: () {
                  context.push(AppRoute.updateProfile);
                },
                leading: Icon(HeroiconsOutline.pencilSquare),
                title: TranslateText(
                  "Update Profile",
                  style: TextStyle(fontSize: 16, fontWeight: .bold),
                ),
              ),
            ),
            // Card(
            //   elevation: 5,
            //   child: ListTile(
            //    // onTap: () => showLanguageDialog(),
            //     leading: Icon(HeroiconsOutline.language),
            //     title: TranslateText(
            //       "App Language",
            //       style: TextStyle(fontSize: 16, fontWeight: .bold),
            //     ),
            //   ),
            // ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.brightness_4),
                title: TranslateText(
                  "Change Theme",
                  style: TextStyle(fontSize: 16, fontWeight: .bold),
                ),
                onTap: () {
                  context.read<ThemeBloc>().add(ToggleThemeEvent());
                },
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                onTap: () {
                  context.push(AppRoute.chatAdmin);
                },
                leading: Icon(Icons.message),
                title: TranslateText(
                  "Chat with Admin",
                  style: TextStyle(fontSize: 16, fontWeight: .bold),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.currency_rupee_rounded),
                title: TranslateText(
                  "Subscription Plan",
                  style: TextStyle(fontSize: 16, fontWeight: .bold),
                ),
                onTap: () {
                  context.push(AppRoute.subscription);
                },
              ),
            ),
            BlocBuilder<SettingBloc, SettingState>(
              builder: (context, state) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    onTap: () async {
                      context.push(AppRoute.privacy);
                    },
                    leading: Icon(HeroiconsOutline.shieldCheck),
                    title: TranslateText(
                      "Privacy Policy",
                      style: TextStyle(fontSize: 16, fontWeight: .bold),
                    ),
                  ),
                );
              },
            ),
            Card(
              elevation: 5,
              child: ListTile(
                onTap: () {
                  context.push(AppRoute.terms);
                },
                leading: Icon(HeroiconsOutline.documentCheck),
                title: TranslateText(
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
                title: TranslateText(
                  "Emergency Contact",
                  style: TextStyle(fontSize: 16, fontWeight: .bold),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                onTap: () {
                  context.push(AppRoute.about);
                },
                leading: Icon(HeroiconsOutline.informationCircle),
                title: TranslateText(
                  "About Us",
                  style: TextStyle(fontSize: 16, fontWeight: .bold),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                onTap: () {
                  logout(context);
                },
                leading: Icon(HeroiconsOutline.arrowRightStartOnRectangle),
                title: TranslateText(
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
