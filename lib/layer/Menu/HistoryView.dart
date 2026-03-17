import 'package:flutter/material.dart';
import 'package:flutter_timeline_plus/flutter_timeline.dart';
import '../../layer/Widget/CustomImage.dart';
import '../../layer/Widget/TranslateText.dart';


class HistoryView extends StatelessWidget {
  final int bookId;
  final String vehicleName;
  final String registrationNo;
  final String vehiclePhoto;
  final String vehicleType;
  final String slotDate;
  final String slotTime;
  final String serviceName;

  const HistoryView({
    super.key,
    required this.bookId,
    required this.vehicleName,
    required this.registrationNo,
    required this.vehiclePhoto,
    required this.vehicleType,
    required this.slotDate,
    required this.slotTime,
    required this.serviceName,
  });

  @override
  Widget build(BuildContext context) {

    final List<TimelineEventDisplay> events=[

        TimelineEventDisplay(
          indicator: const Icon(Icons.check, color: Colors.white, size: 14),

          child: const Text(
            "Transaction Created",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        TimelineEventDisplay(
          indicator: const Icon(Icons.sync, color: Colors.white, size: 14),
          child: const Text("Processing"),
        ),
        TimelineEventDisplay(
          indicator: const Icon(Icons.done_all, color: Colors.white, size: 14),
          child: const Text("Completed"),
        ),

    ];
    return Scaffold(
      appBar: AppBar(title: TranslateText(vehicleName)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            _customHeader(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TranslateText("Booking Details",style: TextStyle(fontWeight: .bold,fontSize: 18)),
            ),
            _customCard(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TranslateText("Booking Timeline",style: TextStyle(fontWeight: .bold,fontSize: 18)),
            ),
            Timeline(events: events)

          ],
        ),
      ),
    );
  }

  Widget _customHeader(){
    return Hero(
        tag: '$bookId',
        child: CustomImage(imgPath: vehiclePhoto,width: .infinity, height: 250,fit: .cover,radius: 0));
  }
  Widget _customCard(){
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            Padding(padding: .all(10),child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Flexible(child: TranslateText('Vehicle Name',style: TextStyle(fontSize: 14,fontWeight: .bold))),
                Flexible(child: TranslateText(vehicleName,style: TextStyle(fontSize: 14,fontWeight: .bold))),
              ],
            )),
            Divider(height: 0),

            Padding(padding: .all(16),child: Row(
              mainAxisAlignment: .spaceBetween,

              children: [
                Flexible(child: TranslateText('Service',style: TextStyle(fontSize: 14,fontWeight: .bold))),
                Flexible(
                    flex: 3,
                    child: TranslateText(serviceName,style: TextStyle(fontSize: 14,fontWeight: .bold))),
              ],
            )),
            Divider(height: 0),
            Padding(padding: .all(16),child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Flexible(child: TranslateText('Vehicle Type',style: TextStyle(fontSize: 14,fontWeight: .bold))),
                Flexible(child: TranslateText(vehicleType,style: TextStyle(fontSize: 14,fontWeight: .bold))),
              ],
            )),
            Divider(height: 0),
            Padding(padding: .all(16),child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Flexible(child: TranslateText('Slot Time',style: TextStyle(fontSize: 14,fontWeight: .bold))),
                Flexible(child: TranslateText(slotTime,style: TextStyle(fontSize: 14,fontWeight: .bold))),
              ],
            )),
            Divider(height: 0),
            Padding(padding: .all(16),child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Flexible(child: TranslateText('Slot Date',style: TextStyle(fontSize: 14,fontWeight: .bold))),
                Flexible(child: TranslateText(slotDate,style: TextStyle(fontSize: 14,fontWeight: .bold))),
              ],
            )),

          ],
        ),
      ),
    );

  }


}
