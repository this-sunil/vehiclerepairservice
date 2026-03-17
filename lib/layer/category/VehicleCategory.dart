import 'dart:collection';
import 'dart:developer';

import '../../core/Bloc/CategoryBloc/CategoryBloc.dart';
import '../../core/Routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../Widget/CustomImage.dart';
import '../Widget/TranslateText.dart';


class VehicleCategory extends StatefulWidget {
  final String serviceId;
  final String serviceName;

  const VehicleCategory({super.key, required this.serviceId, required this.serviceName});

  @override
  State<VehicleCategory> createState() => _VehicleCategoryState();
}

class _VehicleCategoryState extends State<VehicleCategory> {
  HashSet<String> selectedItem=HashSet<String>();
  void multiSelect(String catId,String title){
    log("message=>$title");
      selectedItem.clear();
      selectedItem.add(title);

      setState(() {});
      Future.delayed(Duration(seconds: 1),(){
        if(mounted){
          context.push(AppRoute.booking,arguments: {
            "serviceId":widget.serviceId,
            "serviceName":widget.serviceName,
            "catId":catId,
            "type":title
          });
        }
      });

  }
  @override
  void initState() {
    // TODO: implement initState
    context.read<CategoryBloc>().add(FetchCatEvent());
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
      appBar: AppBar(
        title: TranslateText("Choose Vehicle",style: TextStyle(color: Colors.white)),
      ),
      body:BlocBuilder<CategoryBloc,CategoryState>(builder: (context,state){
        switch(state.status){
          case CatStatus.completed:
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 2.0,
                  crossAxisCount: 3,childAspectRatio: .8),
                scrollDirection: Axis.vertical,
                itemCount:state.result?.length??0,
                itemBuilder: (context,index){
                  final item=state.result?[index];
                  return GestureDetector(
                    onTap: (){
                      multiSelect('${item?.cid.toString()}','${item?.title.toString()}');
                    },
                    child: Column(
                      children: [
                        Padding(padding: .all(5),child:
                        Card(
                          elevation:8,
                          shape:CircleBorder(),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Stack(
                              children: [
                                 Align(
                                   alignment: .center,
                                   child: AnimatedOpacity(
                                     duration: Duration(seconds: 1),
                                     opacity: selectedItem.contains('${item?.title}')?0.8:1.0,
                                     child: CustomImage(
                                         radius: 60,
                                         imgPath:'${dotenv.env['BASE_URL']}/upload/${item?.photo}',width: 100, height: 100,fit: .cover),
                                   ),
                                 ),
                                selectedItem.contains('${item?.title}')?Positioned(
                                  top: 30,
                                  left: 0,
                                   right: 0,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.check,color: Colors.black),
                                  ),
                                ):Container()
                              ],
                            ),
                          ),
                        )),
                        Flexible(child: Padding(padding: .all(2),child: TranslateText('${item?.title}',style: TextStyle(fontSize: 12,fontWeight: .bold))))
                      ],
                    ),
                  );
                });
          default:
           return Container();
        }
      }),
    );
  }
}
