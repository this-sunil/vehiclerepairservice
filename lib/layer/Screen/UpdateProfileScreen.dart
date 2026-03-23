import 'dart:developer';
import 'dart:io';

import '../../core/Bloc/AuthBloc/AuthBloc.dart';
import '../../layer/Widget/CustomInputText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../../layer/Widget/LoadingIndicator.dart';
import '../../layer/Widget/TranslateText.dart';
import '../../core/Routes/route.dart';
import '../Widget/CustomHelper.dart';
import '../Widget/LoadingButtonIndicator.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen>
    with CustomHelperMixin {
  XFile? file;
  ImagePicker imagePicker = ImagePicker();
  String? image;

  late TextEditingController name, phone;
  Future<XFile?> pickImage(ImageSource source) async {
    final picker = await imagePicker.pickImage(source: source);
    if (picker == null) {
      log("message=>No Image Found !!!");
    }
    setState(() {
      file = XFile(picker!.path);
    });
    return file;
  }

  Future<void> popup(BuildContext context) async {
    return showDialog(
      useSafeArea: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
          contentPadding: .zero,
          insetPadding: .zero,
          title: Text(
            "Choose Photo",
            style: TextStyle(

              fontSize: 18,
              fontWeight: .bold,
            ),
          ),
          content: Column(
            mainAxisSize: .min,
            children: [
              ListTile(
                onTap: () {
                  context.pop();
                  pickImage(ImageSource.camera);
                },
                leading: Icon(HeroiconsOutline.camera),
                title: Text("Camera"),
              ),
              ListTile(
                onTap: () {
                  context.pop();
                  pickImage(ImageSource.gallery);
                },
                leading: Icon(HeroiconsOutline.photo),
                title: Text("Gallery"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    context.read<AuthBloc>().add(FetchProfileEvent());
    name = TextEditingController();
    phone = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    name.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TranslateText("Update Profile",style: TextStyle(color: Colors.white))),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          switch (state.status) {
            case AuthStatus.fetchProfile:
              name.text = state.result?.result?.name ?? '';
              phone.text = state.result?.result?.phone ?? '';
              image = '${state.result?.result?.photo}';
              log("Show Image =>$image");
            default:
              break;
          }
        },
        child: Column(

          children: [
            SizedBox(height: 20),
            Center(
              child: Card(
                elevation: 2,
                shape: CircleBorder(
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: BlocBuilder<AuthBloc,AuthState>(builder: (context,state){
                    return CircleAvatar(
                      maxRadius: 80,
                      backgroundImage: file != null
                          ? FileImage(File(file!.path))
                          :state.status==AuthStatus.fetchProfile?NetworkImage(
                        '${dotenv.env['STORE_URL']}/upload/${state.result?.result?.photo}',
                      )
                          : AssetImage(splashIcon),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Card(
                          shape: const CircleBorder(),
                          color: Colors.white,
                          child: IconButton(
                            onPressed: () => popup(context),
                            icon: const Icon(
                              HeroiconsOutline.pencil,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomInputText(
                controller: name,
                textInputType: TextInputType.text,
                primaryColor: Colors.grey.shade300,
                inputFormatter: [
                  FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
                ],
                hintText: 'Enter your name',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomInputText(
                controller: phone,
                maxLength: 10,
                inputFormatter:[
                  FilteringTextInputFormatter.digitsOnly
                ],
                textInputType: TextInputType.phone,
                primaryColor: Colors.grey.shade300,
                hintText: 'Enter phone number',
              ),
            ),

            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                switch (state.status) {
                  case AuthStatus.error:
                    log("Error =>${state.msg.toString()}");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.msg.toString())),
                    );
                    break;
                  case AuthStatus.update:
                    log("Update Profile");

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.msg.toString())),
                    );
                    context.pop();
                    break;
                  default:
                    break;
                }
              },
              builder: (context, state) {
                switch (state.status) {
                  case AuthStatus.updateLoading:
                    return LoadingButtonIndicator();
                  default:
                    return Container(
                      width: context.width,
                      height: 50,
                      margin: EdgeInsetsGeometry.all(8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: .circular(10),
                          ),
                        ),
                        onPressed: () {
                          context.read<AuthBloc>().add(
                            file==null?UpdateProfileEvent(
                              name: name.text,
                              phone: phone.text,
                            ):UpdateProfileEvent(
                              file: File(file!.path.toString()),
                              name: name.text,
                              phone: phone.text,
                            ),
                          );
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: .bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
