// import 'package:vehicle_repair_service/Bloc/InternetBloc/InternetBloc.dart';
// import 'package:vehicle_repair_service/Widget/CustomHelper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class NoInternetScreen extends StatelessWidget{
//   const NoInternetScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: .center,
//         crossAxisAlignment: .center,
//         children: [
//           Center(child: Image.asset(CustomHelperMixin.noInternetIcon, width: 250,height: 250,fit: .cover)),
//           Center(child: Text("No Internet Connection !!!",style: TextStyle(fontSize: 18,fontWeight: .bold))),
//           SizedBox(height: 30),
//           BlocBuilder<InternetBloc,InternetState>(builder: (context,state){
//             switch(state.status){
//               case InternetStatus.loading:
//                 return Center(child: CircularProgressIndicator());
//
//               default:
//                 return Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: SizedBox(
//                     width: 250,
//                     height: 40,
//                     child: ElevatedButton.icon(
//                         icon: Icon(Icons.wifi,color: Colors.white),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.orange.shade700
//                         ),
//                         onPressed: (){
//                           context.read<InternetBloc>().add(FetchInternetEvent());
//                         }, label: Text("Retry",style: TextStyle(color: Colors.white))),
//                   ),
//                 );
//             }
//           }),
//         ],
//       ),
//     );
//   }
// }
