import 'dart:math';
import 'dart:math' as math;

import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:vehicle_repair_service/Bloc/ForgotPassBloc/ForgotPassBloc.dart';
import 'package:vehicle_repair_service/Widget/CustomHelper.dart';
import 'package:vehicle_repair_service/Widget/CustomInputText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_repair_service/Widget/LoadingIndicator.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen>
    with CustomHelperMixin, TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController phone, otp, pass;
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Offset> _sliderAnimation;
  late AnimationController _slideController;
  late Animation<Offset> leftSlideAnimation;
  late Animation<Offset> rightSlideAnimation;
  late AnimationController rotateController;
  late Animation<double> rotateAnimation;


  bool flag = true;

  @override
  void initState() {
    // TODO: implement initState
    phone = TextEditingController();
    pass = TextEditingController();
    otp = TextEditingController();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
    );

    _slideController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    rotateController=AnimationController(vsync: this,duration: Duration(seconds: 3));
    rotateAnimation=Tween<double>(begin: -2*math.pi, end: 0.0).animate(CurvedAnimation(parent: rotateController, curve: Curves.easeInOut));

    leftSlideAnimation = Tween<Offset>(
      begin: const Offset(-10.0, -10.0),
      end: Offset(40,40),
    ).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: Curves.fastOutSlowIn
      ),
    );



    rightSlideAnimation = Tween<Offset>(
      begin: const Offset(10.0, 10.0), // full screen right
      end: Offset(-40,-40),
    ).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _sliderAnimation = Tween<Offset>(begin: Offset(-5.0, 5.0), end: .zero)
        .animate(
          CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
    );

    _controller.forward();
    _slideController.repeat(reverse: true);
    rotateController.repeat(reverse: true);
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    phone.dispose();
    pass.dispose();
    otp.dispose();
    _controller.dispose();
    _slideController.dispose();
    _slideController.removeListener((){});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: .center,
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
                    opacity: _animation,
                    child: ScaleTransition(
                      scale: _animation,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsetsGeometry.all(4),
                          child: RippleAnimation(
                            color: Colors.red,
                            duration: Duration(seconds: 2),
                            repeat: true,
                            ripplesCount: 5,
                            child: Card(
                              shape: CircleBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: RotationTransition(
                                  turns: rotateAnimation,
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
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: _sliderAnimation,
                    child: FadeTransition(
                      opacity: _animation,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: .min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Forgot Password",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: .bold,
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomInputText(
                                    controller: phone,
                                    textInputType: .phone,
                                    prefixIcon: Icon(Icons.phone),
                                    hintText: 'Enter Phone Number',
                                    inputFormatter: [
                                      FilteringTextInputFormatter
                                          .singleLineFormatter,
                                    ],
                                    radius: 10,
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return "Enter phone no.";
                                      } else if (v.length != 10) {
                                        return "mobile no. should be 10 digit";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                BlocBuilder<ForgotPassBloc, ForgotPassState>(
                                  builder: (context, state) {
                                    switch (state.status) {
                                      case ForgotStatus.send ||
                                      ForgotStatus.loading:
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CustomInputText(
                                            controller: otp,
                                            textInputType: .text,
                                            hintText: 'Enter Otp',
                                            inputFormatter: [
                                              FilteringTextInputFormatter
                                                  .singleLineFormatter,
                                            ],
                                            radius: 10,
                                            validator: (v) {
                                              if (v!.isEmpty) {
                                                return "Enter Otp";
                                              }
                                              return null;
                                            },
                                          ),
                                        );
                                      case ForgotStatus.verify ||
                                      ForgotStatus.loading:
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CustomInputText(
                                            controller: pass,
                                            textInputType: .text,
                                            obscureText: flag,
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  flag = !flag;
                                                });
                                              },
                                              icon: Icon(
                                                flag
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                              ),
                                            ),
                                            prefixIcon: Icon(Icons.lock),
                                            hintText: 'Enter password',
                                            inputFormatter: [
                                              FilteringTextInputFormatter
                                                  .singleLineFormatter,
                                            ],
                                            radius: 10,
                                            validator: (v) {
                                              if (v!.isEmpty) {
                                                return "Enter Password";
                                              }
                                              return null;
                                            },
                                          ),
                                        );
                                      default:
                                        return Container();
                                    }
                                  },
                                ),

                                BlocBuilder<ForgotPassBloc, ForgotPassState>(
                                  builder: (context, state) {
                                    switch (state.status) {
                                      case ForgotStatus.loading:
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: LoadingIndicator(),
                                        );
                                      case ForgotStatus.initial:
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 300,
                                            height: 40,
                                            child: ElevatedButton.icon(
                                              onPressed: () {
                                                context.read<ForgotPassBloc>().add(
                                                  SendOtpEvent(),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                side: BorderSide(
                                                  color: Colors.white,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: .circular(10),
                                                ),
                                                backgroundColor:
                                                Colors.deepPurpleAccent,
                                              ),
                                              icon: Icon(
                                                Icons.security,
                                                color: Colors.white,
                                              ),
                                              label: Text(
                                                "Send Otp",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: .bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      case ForgotStatus.send:
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 300,
                                            height: 40,
                                            child: ElevatedButton.icon(
                                              onPressed: () {
                                                context.read<ForgotPassBloc>().add(
                                                  VerifyOtpEvent(),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                side: BorderSide(
                                                  color: Colors.white,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: .circular(10),
                                                ),
                                                backgroundColor:
                                                Colors.deepPurpleAccent,
                                              ),
                                              icon: Icon(
                                                Icons.security,
                                                color: Colors.white,
                                              ),
                                              label: Text(
                                                "Verify Otp",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: .bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      case ForgotStatus.verify:
                                        return ElevatedButton.icon(
                                          onPressed: () {
                                            context.read<ForgotPassBloc>().add(
                                              SetForgotPassEvent(),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            side: BorderSide(color: Colors.white),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: .circular(10),
                                            ),
                                            backgroundColor:
                                            Colors.deepPurpleAccent,
                                          ),
                                          icon: Icon(
                                            Icons.security,
                                            color: Colors.white,
                                          ),
                                          label: Text(
                                            "Set Password",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: .bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        );
                                      default:
                                        return Container();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
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
          ),
        );
  }
}
