

import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:vehicle_repair_service/layer/Widget/LoadingButtonIndicator.dart';
import '../../core/Bloc/AuthBloc/AuthBloc.dart';
import '../../core/Routes/route.dart';
import '../../layer/Widget/CustomHelper.dart';
import '../../layer/Widget/CustomInputText.dart';
import '../../layer/Widget/LoadingIndicator.dart';
import '../../layer/Widget/Storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with CustomHelperMixin, TickerProviderStateMixin {
  late TextEditingController phone;
  late TextEditingController pass;
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  late AnimationController _opacityController;
  late Animation<double> _opacityAnimation;
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  late AnimationController rotateController;
  late Animation<double> rotateAnimation;
  late AnimationController bounceController;
  late Animation<Offset> leftSlideAnimation;
  late Animation<Offset> rightSlideAnimation;
  bool visiblePass = true;
  @override
  void initState() {
    super.initState();

    phone = TextEditingController();
    pass = TextEditingController();

    _opacityController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _opacityController,
        curve: Curves.easeInOut,
      ),
    );
    _opacityController.forward();

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: Curves.easeInOut,
      ),
    );
    _slideController.forward();

    rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    rotateAnimation = Tween<double>(
      begin: -2 * 3.14,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: rotateController,
        curve: Curves.easeInCubic,
      ),
    );

    bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )..repeat(reverse: true);

    leftSlideAnimation = Tween<Offset>(
      begin: const Offset(-10.0, -10.0),
      end: const Offset(40, 40),
    ).animate(
      CurvedAnimation(
        parent: bounceController,
        curve: Curves.easeInCubic,
      ),
    );

    rightSlideAnimation = Tween<Offset>(
      begin: const Offset(10.0, 10.0),
      end: const Offset(-40, -40),
    ).animate(
      CurvedAnimation(
        parent: bounceController,
        curve: Curves.easeInCubic,
      ),
    );
  }


  @override
  void dispose() {
    phone.dispose();
    pass.dispose();
    _opacityController.dispose();
    _slideController.dispose();
    bounceController.dispose();
    rotateController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: loginKey,
        child: Column(
          mainAxisAlignment: .center,
          children: [
            SlideTransition(
              position: leftSlideAnimation,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: .circle,
                  gradient: LinearGradient(
                    tileMode: .mirror,
                    colors: [Colors.deepPurpleAccent, Colors.deepOrange],
                  ),
                ),
              ),
            ),
            FadeTransition(
              opacity: _opacityAnimation,
              child: RotationTransition(
                turns: rotateAnimation,
                child: RippleAnimation(
                  color: Colors.red,
                  duration: Duration(seconds: 2),
                  repeat: true,
                  ripplesCount: 5,
                  child: Card(
                    color: Colors.white,
                    shape: CircleBorder(),
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(4),
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
            ),
            SlideTransition(
              position: _slideAnimation,
              child: Padding(
                padding: .all(8),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: .min,
                    children: [
                      Padding(
                        padding: .all(10),
                        child: Text(
                          "Login",
                          style: TextStyle(fontWeight: .bold, fontSize: 24,color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: .symmetric(horizontal: 20, vertical: 10),
                        child: CustomInputText(
                          controller: phone,
                          textInputType: TextInputType.phone,
                          prefixIcon: Icon(Icons.phone, color: Colors.black),
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Enter Phone Number";
                            } else if (v.length != 10) {
                              return "Mobile Number Should be 10 digit";
                            }
                            return null;
                          },
                          hintText: 'Enter Phone',
                          onChanged: (v) {},
                          inputFormatter: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      Padding(
                        padding: .symmetric(horizontal: 20, vertical: 10),
                        child: CustomInputText(
                          controller: pass,
                          obscureText: visiblePass,
                          textInputType: TextInputType.visiblePassword,
                          prefixIcon: Icon(Icons.lock, color: Colors.black),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visiblePass = !visiblePass;
                              });
                            },
                            icon: Icon(
                              visiblePass
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black,
                            ),
                          ),
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Enter Password";
                            } else if (v.length < 6) {
                              return "Password at least 6 digit,character";
                            }
                            return null;
                          },
                          hintText: 'Enter Pass',
                          onChanged: (v) {},
                          inputFormatter: [],
                        ),
                      ),

                      BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          switch (state.status) {
                            case AuthStatus.login:
                              Storage.instance.setToken(
                                '${state.result?.token.toString()}',
                              );
                              Storage.instance.setUId(
                                '${state.result?.result?.id.toString()}',
                              );
                              context.pushAndRemoveUntil(AppRoute.dashboard);
                            default:
                              break;
                          }
                        },
                        builder: (context, state) {
                          switch (state.status) {
                            case AuthStatus.loading:
                              return LoadingButtonIndicator();
                            default:
                              return Padding(
                                padding: .symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: SizedBox(
                                  width: context.width,
                                  height: 45,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: .circular(10),
                                      ),
                                      backgroundColor: Colors.amber,
                                    ),
                                    onPressed: () {
                                      if (loginKey.currentState!.validate()) {
                                        context.read<AuthBloc>().add(
                                          LoginEvent(
                                            phone: phone.text,
                                            pass: pass.text,
                                          ),
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: .bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                          }
                        },
                      ),

                      // Todo: Forgot Password implement after later .....
                      /* TextButton(
                        onPressed: () {
                          context.pushReplace(AppRoute.forgotPass);
                        },
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            color: Colors.blue,
                            fontWeight: .bold,
                          ),
                        ),
                      ),*/
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: ElevatedButton.icon(
                      //     icon: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: customImage(
                      //         path: 'assets/icons/google.png',
                      //         width: 30,
                      //         height: 30,
                      //       ),
                      //     ),
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: Colors.white,
                      //       elevation: 5,
                      //       shape: RoundedRectangleBorder(
                      //         side: BorderSide(color: Colors.grey.shade300),
                      //         borderRadius: .circular(10),
                      //       ),
                      //     ),
                      //     onPressed: () async {
                      //       final user= await FirebaseService.instance
                      //           .signInGoogle();
                      //       log("Email=>${user?.user?.email}");
                      //
                      //
                      //     },
                      //     label: Text(
                      //       "Sign In Google",
                      //       style: TextStyle(
                      //         color: Colors.black,
                      //         fontWeight: .bold,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: .all(2),
                        child: Row(
                          mainAxisAlignment: .center,
                          children: [
                            Text(
                              "Create an account",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: .bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context.pushReplace(AppRoute.register);
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.blue,
                                  color: Colors.blue,

                                  fontWeight: .bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SlideTransition(
              position: rightSlideAnimation,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: .circle,
                  gradient: LinearGradient(
                    tileMode: .mirror,
                    colors: [Colors.deepPurpleAccent, Colors.deepOrange],
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
