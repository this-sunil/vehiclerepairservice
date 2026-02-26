import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:vehicle_repair_service/Bloc/PhoneAuthBloc/PhoneAuthBloc.dart';
import 'package:vehicle_repair_service/Routes/route.dart';
import 'package:vehicle_repair_service/Widget/CustomHelper.dart';
import 'package:vehicle_repair_service/Widget/LoadingIndicator.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String name;
  final String phone;
  final String pass;
  const VerifyOtpScreen({super.key, required this.name,required this.phone,required this.pass});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen>
    with TickerProviderStateMixin, CustomHelperMixin {
  late AnimationController _rotateController;
  late Animation<double> _rotateAnimation;

  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  late TextEditingController _otp;
  final GlobalKey<FormState> _verify=GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    _rotateController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat(reverse: true);
    _rotateAnimation = Tween<double>(begin: -2 * pi, end: 0).animate(
      CurvedAnimation(parent: _rotateController, curve: Curves.easeInOut),
    );
    _scaleController=AnimationController(vsync: this,duration: Duration(seconds: 2))..forward();
    _scaleAnimation=Tween<double>(begin: .2,end: 1.0).animate(CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut));
    _otp=TextEditingController();
    context.read<PhoneAuthBloc>().add(SendOtpEvent(phone: widget.phone));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _rotateController.dispose();
    _otp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _verify,
        child: Column(

          mainAxisAlignment: .center,
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RotationTransition(
                turns: _rotateAnimation,
                child: RippleAnimation(
                  color: Colors.pink,
                  repeat: true,
                  ripplesCount: 5,
                  child: Center(
                    child: Card(
                      shape: CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: customImage(
                          path: logoIcon,
                          width: 160,
                          height: 160,
                          fit: .cover,
                          radius: 60,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            BlocBuilder<PhoneAuthBloc,PhoneAuthState>(builder: (context,state){
              switch(state.status){
                case PhoneAuthStatus.loading:
                  return LoadingIndicator();

                default:
                  return ScaleTransition(scale: _scaleAnimation,child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Verify OTP",style: TextStyle(fontSize: 18,fontWeight: .bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Pinput(
                              controller:_otp,
                              length: 4,
                              closeKeyboardWhenCompleted: true,
                              keyboardType: .phone,
                              pinputAutovalidateMode: .onSubmit,
                              textInputAction:.send,
                              cursor:Container(
                                width: 2,
                                height: 25,
                                color: Colors.black
                              ),
                              defaultPinTheme: PinTheme(
                                width: 60,
                                height: 60,
                                textStyle:TextStyle(fontSize: 18,fontWeight: .bold),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: .circular(10)
                                )
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              autofocus:true,
                              validator: (v){
                                if(v!.isEmpty){
                                  return "Please enter otp";
                                }
                                else if(v.length<4){
                                  return "Otp Should be 4 digit";
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: .symmetric(
                              horizontal: 10,
                              vertical: 15,
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
                                  if(_verify.currentState!.validate()){
                                    context.read<PhoneAuthBloc>().add(VerifyOtpEvent(otp: _otp.text));
                                  }
                                },
                                child: Text(
                                  "Send OTP",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: .bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: .symmetric(
                              horizontal: 10,
                              vertical: 15,
                            ),
                            child: SizedBox(
                              width: context.width,
                              height: 45,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: .circular(10),
                                  ),
                                  backgroundColor: Colors.black,
                                ),
                                onPressed: () {
                                  context.pop();
                                },
                                icon:Icon(Icons.keyboard_backspace_sharp,color: Colors.white),
                                label: Text(
                                  "Back",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: .bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
              }
            })
          ],
        ),
      ),
    );
  }
}
