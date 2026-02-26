import 'dart:developer';
import 'dart:io';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:vehicle_repair_service/Bloc/BookBloc/BookBloc.dart';
import 'package:vehicle_repair_service/Widget/TranslateText.dart';
import 'package:intl/intl.dart';
import 'package:vehicle_repair_service/Bloc/CategoryBloc/CategoryBloc.dart';
import 'package:vehicle_repair_service/Model/ServiceModel.dart';
import 'package:vehicle_repair_service/Widget/CustomHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:time_slot/model/time_slot_Interval.dart';
import 'package:time_slot/time_slot_from_interval.dart';
import '../../Routes/route.dart';

class BookingScreen extends StatefulWidget {
  final String serviceId;
  final String serviceName;
  final String type;
  const BookingScreen({super.key, required this.type, required this.serviceId, required this.serviceName});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> with CustomHelperMixin {
   final GlobalKey<ScaffoldMessengerState> scaffoldKey=GlobalKey<ScaffoldMessengerState>();
   TextEditingController vehicleNameController = TextEditingController();
   TextEditingController plateNumberController = TextEditingController();
   TextEditingController vehicleTypeController=TextEditingController();
   TextEditingController serviceController=TextEditingController();
   late final ObjectDetector objectDetector;

   // Slot Date & Time
  DateTime? selectedDate;
  final GlobalKey<FormState> formKey=GlobalKey<FormState>();

  String? selectedVehicleType;
  List<Result> selectedServices = [];

   XFile? file;
  ImagePicker imagePicker=ImagePicker();
   Future<XFile?> pickImage(ImageSource source) async {
     final ImagePicker imagePicker = ImagePicker();
     final picker = await imagePicker.pickImage(source: source);

     if (picker == null) {
       log("message=>No Image Found !!!");
       return null;
     }

     final inputImage = InputImage.fromFilePath(picker.path);


     log("message=>${objectDetector.id}");
     final List<DetectedObject> objects = await objectDetector.processImage(inputImage);
     vehicleNameController.clear();

     if (objects.isNotEmpty) {
       final labels = objects.first.labels;
       if (labels.isNotEmpty) {
         final detectedName = labels.first.text;
         log("message $detectedName");
         vehicleNameController.text = detectedName.toString();
       }
     }
     else{
       log("Object Empty !!!");
     }
       setState(() {
         file = XFile(picker.path);
       });


     return file;
   }

   String formatTimeOfDay(TimeOfDay time) {
     final hour = time.hour.toString().padLeft(2, '0');
     final minute = time.minute.toString().padLeft(2, '0');
     return "$hour:$minute:00";
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
   List<DateTime> selectTime = [];
  @override
  void initState() {
    // TODO: implement initState
    context.read<CategoryBloc>().add(FetchCatEvent());
    vehicleTypeController.text=widget.type;
    serviceController.text=widget.serviceName;
    super.initState();
    objectDetector = ObjectDetector(
      options: ObjectDetectorOptions(
        mode: DetectionMode.single,
        classifyObjects: true,
        multipleObjects: false,
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    vehicleNameController.dispose();
    plateNumberController.dispose();
    vehicleTypeController.dispose();
    serviceController.dispose();
    objectDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: TranslateText('Vehicle Repair Booking',style: TextStyle(color: Colors.white)),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: Card(
                  elevation: 2,
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: CircleAvatar(
                      maxRadius: 80,
                      backgroundImage: file != null
                          ? FileImage(File(file!.path))
                          : AssetImage(splashIcon),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Card(
                          shape: const CircleBorder(),
                          child: IconButton(
                            onPressed: () => popup(context),
                            icon: const Icon(
                              HeroiconsOutline.pencil,

                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Vehicle Name

              _sectionTitle('Vehicle Name'),
              _textInputField(controller: vehicleNameController, hint: 'Enter vehicle name'),

              SizedBox(height: 16),

              // Plate Number
              _sectionTitle('Registration Number'),
              _textInputField(controller: plateNumberController, hint: 'Enter Registration number'),

              SizedBox(height: 16),

              _sectionTitle('Vehicle Type'),
              _textInputField(controller: vehicleTypeController, readOnly: true,hint: 'Enter Vehicle Type'),


              SizedBox(height: 16),
              // Slot Date
              _sectionTitle('Select Slot Date'),
              _pickerCard(
                icon: Icons.calendar_today,
                text: selectedDate == null
                    ? 'Pick a date'
                    : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                onTap: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                  );
                  if (date != null) setState(() => selectedDate = date);
                },
              ),

              SizedBox(height: 16),

              // Slot Time
              _sectionTitle('Select Slot Time'),

              TimesSlotGridViewFromInterval(
                locale: "en",
                initTime: selectTime,
                borderRadius: .circular(10),
                crossAxisCount: 4,
                selectedColor: Colors.black,
                unSelectedColor: Colors.white,
                childAspectRatio: 2,
                timeSlotInterval:  TimeSlotInterval(
                  start: TimeOfDay.now(),
                  end: TimeOfDay(hour: 30,minute: 20),
                  interval: Duration(hours: 1, minutes: 0),
                ),
                onChange: (value) {
                  setState(() {
                    selectTime = value;
                  });
                },
              ),



              SizedBox(height: 16),

              _sectionTitle('Service Type'),
              _textInputField(controller: serviceController,readOnly: true, hint: 'Enter Service Type'),

              SizedBox(height: 16),
              BlocConsumer<BookBloc,BookState>(
                  listener: (context,state){
                    switch(state.status){
                      case BookStatus.completed:
                        context.pushAndRemoveUntil(AppRoute.dashboard);
                        break;
                      default:
                        break;
                    }
                  },
                  builder: (context,state){

                switch(state.status){

                  case BookStatus.loading:
                    return Center(child: CircularProgressIndicator());

                  default:
                    print("Book=>${state.status}");
                    return SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          //startTransaction(100);

                          if(formKey.currentState!.validate()){
                            if(file==null){
                              scaffoldKey.currentState?.showSnackBar(SnackBar(content: TranslateText("Please Upload Vehicle Photo")));
                            }
                            else if(selectTime.isNotEmpty){

                              context.read<BookBloc>().add(BookAppointEvent(
                                  vehicleName: vehicleNameController.text,
                                  photo:XFile(file!.path),
                                  registerNo: plateNumberController.text,
                                  serviceName: serviceController.text,
                                  slotDate: DateFormat('dd/MM/yyyy').format(selectedDate??DateTime.now()),
                                  slotTime: DateFormat('hh:mm a').format(selectTime.first),
                                  vehicleType: vehicleTypeController.text
                              ));
                            }
                            else{
                              scaffoldKey.currentState?.showSnackBar(SnackBar(content: TranslateText("Please Select Time")));
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.all(0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Colors.deepPurple, Colors.purpleAccent]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          child: TranslateText(
                            'Confirm Booking',
                            style: TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: TranslateText(
          title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }
  Widget _textInputField({required TextEditingController controller, required String hint,bool? readOnly}) {

    return TextField(
      controller: controller,
      readOnly: readOnly ?? false,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        hint: TranslateText(hint,style: TextStyle(color: Colors.black)),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
      ),
    );
  }

  Widget _pickerCard({required IconData icon, required String text, required VoidCallback onTap}) => GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.deepPurple),
          SizedBox(width: 16),
          Text(text,style: TextStyle(color: Colors.black)),
        ],
      ),
    ),
  );



}
