// import 'dart:collection';
// import 'package:vehicle_repair_service/Bloc/AuthBloc/AuthBloc.dart';
// import 'package:vehicle_repair_service/Bloc/SubscriptionBloc/SubscriptionBloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:vehicle_repair_service/Widget/LoadingIndicator.dart';
// import '../../Widget/TranslateText.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
//
// class SubscriptionScreen extends StatefulWidget {
//   const SubscriptionScreen({super.key});
//
//   @override
//   State<SubscriptionScreen> createState() => _SubscriptionScreenState();
// }
//
// class _SubscriptionScreenState extends State<SubscriptionScreen> {
//   HashSet<String> selectItem = HashSet<String>();
//   String? phone;
//   void selectCard(String item) {
//     selectItem.clear();
//     selectItem.add(item);
//     setState(() {});
//   }
//
//
//   // Future<void> startTransaction() async {
//   //
//   //   final response = await post(
//   //     Uri.parse('${dotenv.env['BASE_URL']}/api/initiate-payment'),
//   //     body: jsonEncode({
//   //       "amount": "100.00",
//   //       "orderId": "ORDER_${DateTime.now().millisecondsSinceEpoch}",
//   //       "customerId": "CUST_${DateTime.now().microsecondsSinceEpoch}"
//   //     }),
//   //     headers: {"Content-Type": "application/json"},
//   //   );
//   //
//   //   final data = jsonDecode(response.body);
//   //   String txnToken = data['token'];
//   //   String orderId = data['orderId'];
//   //   String mid = data['mid'];
//   //
//   //   // 2. Start Transaction using Paytm SDK
//   //
//   //   try {
//   //     var response = await AllInOneSdk.startTransaction(
//   //       mid,
//   //       orderId,
//   //       "100.00",
//   //       txnToken,
//   //       "https://securegw-stage.paytm.in/theia/paytmCallback?ORDER_ID=$orderId", // Standard Callback
//   //       true,
//   //       false,
//   //     );
//   //
//   //     log("Transaction Response: $response");
//   //     _showSnackBar(response.toString());
//   //     // Handle success or failure based on the response Map
//   //   } catch (err) {
//   //     log("Transaction Failed: $err");
//   //     _showSnackBar(response.toString());
//   //   }
//   // }
//
//
//
//   final Razorpay _razorPay=Razorpay();
//
//   Future<void> startTransaction(String title,String planType,String planPrice,String phone) async{
//     Map<String,dynamic> options={
//       'key': '',
//       'amount': double.parse(planPrice).toInt(),
//       'name': title,
//       'description': planType.toString(),
//       'prefill': {
//         'contact': phone.toString(),
//       }
//     };
//     _razorPay.open(options);
//
//   }
//
//   Future<void> showToast(String val) async{
//     SnackBar snackBar=SnackBar(content: Text(val));
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
//
//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     showToast("Payment Successfully !!!");
//   }
//
//   void _handlePaymentError(PaymentFailureResponse response) {
//     showToast("Payment Failure !!!");
//   }
//
//   void _handleExternalWallet(ExternalWalletResponse response) {
//     showToast("Wallet Payment Successfully !!!");
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     context.read<SubscriptionBloc>().add(FetchSubscriptionEvent());
//     super.initState();
//     context.read<AuthBloc>().add(FetchProfileEvent());
//     _razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _razorPay.clear();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: TranslateText("Subscription Plan")),
//       body: Column(
//         crossAxisAlignment: .start,
//         children: [
//
//
//
//           BlocListener<AuthBloc,AuthState>(listener: (context,state){
//             switch(state.status){
//               case AuthStatus.fetchProfile:
//                 phone=state.result?.result?.phone??'';
//                 break;
//               default:
//                 break;
//             }
//           },child:BlocBuilder<SubscriptionBloc,SubscriptionState>(builder: (context,state){
//             switch(state.status){
//               case SubscriptionStatus.loading:
//                 return LoadingIndicator();
//               case SubscriptionStatus.completed:
//                 final model=state.model?.result??[];
//                 return ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: model.length,
//                   itemBuilder: (context, index) {
//                     final item = model[index];
//                     return GestureDetector(
//                       onTap: () {
//                         selectCard(item.pid.toString());
//
//                         startTransaction(item.planTitle.toString(),item.planType.toString(),item.planPrice.toString(),phone.toString());
//                       },
//                       child: Card(
//                         color: selectItem.contains(item.pid.toString())?Colors.deepPurple.shade700:Colors.white,
//                         child: ListTile(
//                           leading: selectItem.contains(item.pid.toString())
//                               ? Icon(
//                             Icons.radio_button_checked,
//                             size: 30,
//                             color: selectItem.contains(item.pid.toString())?Colors.white:Colors.black,
//                           )
//                               : Icon(
//                             Icons.circle_outlined,
//                             size: 30,
//                             color: selectItem.contains(item.pid.toString())?Colors.white:Colors.black,
//                           ),
//                           title: TranslateText(item.planTitle.toString(),style: TextStyle(color: selectItem.contains(item.pid.toString())?Colors.white:Colors.black,fontWeight: .bold)),
//                           subtitle: TranslateText(item.planType.toString(),style: TextStyle(color: selectItem.contains(item.pid.toString())?Colors.white:Colors.black,fontWeight: .bold)),
//                           trailing: TranslateText(
//                               '\u{20b9} ${item.planPrice.toString()}',
//                               style: TextStyle(color: selectItem.contains(item.pid.toString())?Colors.white:Colors.black,fontWeight: .bold,fontSize: 18)
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               default:
//                 return SizedBox.shrink();
//             }
//           })),
//         ],
//       ),
//     );
//   }
//
// }
//
