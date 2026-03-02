import 'dart:developer';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:vehicle_repair_service/Bloc/PhoneAuthBloc/PhoneAuthBloc.dart';
import 'package:vehicle_repair_service/Widget/CustomHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_repair_service/Widget/LoadingIndicator.dart';
import '../../Bloc/AuthBloc/AuthBloc.dart';
import '../../Routes/route.dart';
import '../../Widget/CustomInputText.dart';
import '../../Widget/Storage.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with CustomHelperMixin,TickerProviderStateMixin{
  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController pass;
  bool visiblePass=true;
  final GlobalKey<FormState> registerKey=GlobalKey<FormState>();
  late AnimationController _opacityController;
  late Animation<double> _opacityAnimation;
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;


  late AnimationController rotateController;
  late Animation<double> rotateAnimation;

  late AnimationController bounceController;
  late Animation<Offset> leftSlideAnimation;
  late Animation<Offset> rightSlideAnimation;

  @override
  void initState() {
    super.initState();

    name = TextEditingController();
    phone = TextEditingController();
    pass = TextEditingController();

    _opacityController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
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
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: Curves.easeInOut,
      ),
    );
    _slideController.forward();

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
  }

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    pass.dispose();

    _opacityController.dispose();
    _slideController.dispose();
    rotateController.dispose();
    bounceController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Form(
        key: registerKey,
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
            FadeTransition(opacity: _opacityAnimation,child:  RotationTransition(
              turns: rotateAnimation,
              child: RippleAnimation(
                color: Colors.red,
                duration: Duration(seconds: 2),
                repeat: true,
                ripplesCount: 5,
                child: Card(
                  color: Colors.white,
                  shape: CircleBorder(),
                  child: Padding(padding: EdgeInsetsGeometry.all(4),child: customImage(
                      path: logoIcon,
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                      radius: 10
                  )),
                ),
              ),
            )),
            SlideTransition(position: _slideAnimation,child: Padding(padding: .all(8),child: Card(
              color: Colors.white,
              child:  Column(
                mainAxisSize: .min,
                children: [
                  Padding(padding: .all(10),child: Text("Register",style: TextStyle(fontWeight: .bold,fontSize: 24,color: Colors.black))),
                  Padding(padding: .symmetric(horizontal:20,vertical:10),child: CustomInputText(
                      controller: name,
                      prefixIcon: Icon(Icons.person,color: Colors.black),
                      textInputType: TextInputType.text,
                      validator: (v){
                        if(v!.isEmpty){
                          return "Enter your name";
                        }
                        return null;
                      },
                      hintText: 'Enter name',
                      onChanged: (v){},
                      inputFormatter: [

                      ])),
                  Padding(padding: .symmetric(horizontal:20,vertical:10),child: CustomInputText(
                      controller: phone,
                      prefixIcon: Icon(Icons.phone,color: Colors.black),
                      textInputType: TextInputType.phone,
                      validator: (v){
                        if(v!.isEmpty){
                          return "Enter Phone Number";
                        }
                        else if(v.length!=10){
                          return "Mobile Number Should be 10 digit";
                        }
                        return null;
                      },
                      hintText: 'Enter Phone',
                      maxLength: 10,

                      onChanged: (v){},
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly
                      ])),
                  Padding(padding: .symmetric(horizontal:20,vertical:10),child: CustomInputText(
                      controller: pass,
                      obscureText: visiblePass,
                      textInputType: TextInputType.visiblePassword,
                      prefixIcon: Icon(Icons.lock,color: Colors.black),
                      validator: (v){
                        if(v!.isEmpty){
                          return "Enter password";
                        }
                        else if(v.length<6){
                          return "Password at least 6 digit,character";
                        }
                        return null;
                      },
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          visiblePass=!visiblePass;
                        });
                      }, icon: Icon(visiblePass?Icons.visibility_off:Icons.visibility,color: Colors.black)),
                      hintText: 'Enter Pass',
                      onChanged: (v){
                      },
                      inputFormatter: [])),

                  BlocConsumer<AuthBloc,AuthState>(builder: (context,state){
                    switch(state.status){
                      case AuthStatus.loading:
                        return LoadingIndicator();
                      default:
                        return Padding(padding: .symmetric(horizontal:10,vertical:5),child: SizedBox(
                          width: context.width,
                          height: 45,
                          child:  ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: .circular(10)
                                  ),
                                  backgroundColor: Colors.amber
                              ),
                              onPressed: () async{
                                if(registerKey.currentState!.validate()){
                                  context.read<AuthBloc>().add(RegisterEvent(name: name.text, phone: phone.text, pass: pass.text));
                                }
                              }, child: Text("Submit",style: TextStyle(color: Colors.black,fontWeight: .bold,fontSize: 18))),
                        ));
                    }
                  }, listener: (context,state){
                    switch(state.status){
                      case AuthStatus.register:
                        Storage.instance.setUId('${state.result?.result?.id}');
                        Storage.instance.setToken('${state.result?.token}');
                        context.pushAndRemoveUntil(AppRoute.dashboard);
                        break;
                      default:
                        break;
                    }
                  }),

                  Padding(padding: .all(2),child: Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text("Already have an account",style: TextStyle(fontWeight: .bold,color: Colors.black)),
                      TextButton(onPressed: (){
                        context.pushReplace(AppRoute.login);
                      }, child: Text("Login",
                          style:TextStyle(decoration: TextDecoration.underline,decorationColor: Colors.blue,color: Colors.blue,fontWeight: .bold)))
                    ],
                  ))
                ],
              ),
            ),
            )),
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
