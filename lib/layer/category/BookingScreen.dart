import 'dart:developer';
import 'dart:io';

import 'package:heroicons/heroicons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart' hide TimeOfDay;

// ignore: deprecated_member_use
import 'package:flutter/material.dart' show TimeOfDay;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_slot/model/time_slot_Interval.dart';
import 'package:time_slot/time_slot_from_interval.dart';

import '../../core/Bloc/BookBloc/BookBloc.dart';
import '../../core/Routes/route.dart';
import '../../layer/Widget/TranslateText.dart';
import '../../core/Bloc/CategoryBloc/CategoryBloc.dart';
import '../../layer/Widget/CustomHelper.dart';

class BookingScreen extends StatefulWidget {
  final String serviceId;
  final String serviceName;
  final String type;

  const BookingScreen({
    super.key,
    required this.type,
    required this.serviceId,
    required this.serviceName,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> with CustomHelperMixin {
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController vehicleNameController = TextEditingController();

  final TextEditingController plateNumberController = TextEditingController();

  final TextEditingController vehicleTypeController = TextEditingController();

  final TextEditingController serviceController = TextEditingController();

  final ImagePicker imagePicker = ImagePicker();

  // Vehicle image
  XFile? file;

  // Booking date and time
  DateTime? selectedDate;

  List<DateTime> selectTime = [];

  // Booking configuration
  static const int bookingStartHour = 9;
  static const int bookingEndHour = 18;
  TimeOfDay endTime = TimeOfDay(hour: bookingEndHour, minute: 0);

  // Check whether selected date is today
  bool get isToday {
    if (selectedDate == null) return false;

    final now = DateTime.now();

    return selectedDate!.year == now.year &&
        selectedDate!.month == now.month &&
        selectedDate!.day == now.day;
  }

  // Get first available booking slot
  DateTime getFirstAvailableSlot() {
    final now = DateTime.now();

    if (!isToday) {
      return DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        bookingStartHour,
      );
    }

    // Round up to the next complete hour.
    final nextHour = DateTime(
      now.year,
      now.month,
      now.day,
      now.hour,
    ).add(const Duration(hours: 1));

    final firstSlot = DateTime(now.year, now.month, now.day, bookingStartHour);

    return nextHour.isAfter(firstSlot) ? nextHour : firstSlot;
  }

  // Check available slots
  bool get hasAvailableSlots {
    if (selectedDate == null) return false;

    final firstSlot = getFirstAvailableSlot();

    final lastSlot = DateTime(
      selectedDate!.year,
      selectedDate!.month,
      selectedDate!.day,
      bookingEndHour,
    );

    return firstSlot.isBefore(lastSlot);
  }

  @override
  void initState() {
    super.initState();

    context.read<CategoryBloc>().add(FetchCatEvent());

    vehicleTypeController.text = widget.type;
    serviceController.text = widget.serviceName;
  }

  @override
  void dispose() {
    vehicleNameController.dispose();
    plateNumberController.dispose();
    vehicleTypeController.dispose();
    serviceController.dispose();

    super.dispose();
  }

  // Pick vehicle image
  Future<XFile?> pickImage(ImageSource source) async {
    try {
      final picker = await imagePicker.pickImage(source: source);

      if (picker == null) {
        log("No Image Found");
        return null;
      }

      if (!mounted) return null;

      setState(() {
        file = picker;
      });

      return file;
    } catch (e, stackTrace) {
      log("Image picker error: $e", stackTrace: stackTrace);

      if (mounted) {
        showMsg('Unable to pick image');
      }

      return null;
    }
  }

  // Show snackbar
  void showMsg(String msg) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  // Choose photo dialog
  Future<void> popup(BuildContext context) async {
    return showDialog(
      useSafeArea: true,
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          title: const Text(
            "Choose Photo",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () async {
                  Navigator.pop(dialogContext);
                  await pickImage(ImageSource.camera);
                },
                leading: const HeroIcon(HeroIcons.camera),
                title: const Text("Camera"),
              ),
              ListTile(
                onTap: () async {
                  Navigator.pop(dialogContext);
                  await pickImage(ImageSource.gallery);
                },
                leading: const HeroIcon(HeroIcons.photo),
                title: const Text("Gallery"),
              ),
            ],
          ),
        );
      },
    );
  }

  // Select booking date
  Future<void> selectBookingDate() async {
    final today = DateUtils.dateOnly(DateTime.now());

    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? today,
      firstDate: today,
      lastDate: today.add(const Duration(days: 365)),
    );

    if (date != null && mounted) {
      setState(() {
        selectedDate = DateUtils.dateOnly(date);

        // Reset previously selected time.
        selectTime.clear();
      });
    }
  }

  // Validate and submit booking
  void submitBooking() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (file == null) {
      showMsg("Please Upload Vehicle Photo");
      return;
    }

    if (selectedDate == null) {
      showMsg("Please Select Slot Date");
      return;
    }

    if (selectTime.isEmpty) {
      showMsg("Please Select Time");
      return;
    }

    final selectedSlot = selectTime.first;

    // Construct selected slot using the selected booking date.
    final bookingDateTime = DateTime(
      selectedDate!.year,
      selectedDate!.month,
      selectedDate!.day,
      selectedSlot.hour,
      selectedSlot.minute,
    );

    // Check past time for today's booking.
    if (isToday && !bookingDateTime.isAfter(DateTime.now())) {
      setState(() {
        selectTime.clear();
      });

      showMsg("Selected time has passed. Please select another slot.");
      return;
    }

    // Validate business hours.
    if (selectedSlot.hour < bookingStartHour ||
        selectedSlot.hour >= bookingEndHour ||
        selectedSlot.minute != 0) {
      showMsg("Please select a valid slot between 9 AM and 6 PM.");
      return;
    }

    log("Vehicle Name: ${vehicleNameController.text}");
    log("Registration Number: ${plateNumberController.text}");
    log("Booking Date: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}");
    log("Booking Time: ${DateFormat('HH:mm').format(bookingDateTime)}");

    context.read<BookBloc>().add(
      BookAppointEvent(
        vehicleName: vehicleNameController.text.trim(),
        photo: XFile(file!.path),
        registerNo: plateNumberController.text.trim(),
        serviceName: serviceController.text,
        slotDate: DateFormat('yyyy-MM-dd').format(selectedDate!),
        slotTime: DateFormat('HH:mm').format(bookingDateTime),
        vehicleType: vehicleTypeController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      appBar: AppBar(
        title: TranslateText('Vehicle Repair Booking'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Vehicle Image
              Center(
                child: Card(
                  elevation: 2,
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),

                    child: CircleAvatar(
                      radius: 80,

                      backgroundImage: file != null
                          ? FileImage(File(file!.path))
                          : AssetImage(splashIcon) as ImageProvider,

                      child: Align(
                        alignment: Alignment.bottomRight,

                        child: Card(
                          shape: const CircleBorder(),

                          child: IconButton(
                            onPressed: () => popup(context),
                            icon: const HeroIcon(HeroIcons.pencil),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Vehicle Name
              _sectionTitle('Vehicle Name'),

              _textInputField(
                controller: vehicleNameController,
                hint: 'Enter vehicle name',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter vehicle name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Registration Number
              _sectionTitle('Registration Number'),

              _textInputField(
                controller: plateNumberController,
                hint: 'Enter Registration number',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter registration number';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Vehicle Type
              _sectionTitle('Vehicle Type'),

              _textInputField(
                controller: vehicleTypeController,
                readOnly: true,
                hint: 'Enter Vehicle Type',
              ),

              const SizedBox(height: 16),

              // Select Date
              _sectionTitle('Select Slot Date'),

              _pickerCard(
                icon: Icons.calendar_today,
                text: selectedDate == null
                    ? 'Pick a date'
                    : DateFormat('dd/MM/yyyy').format(selectedDate!),
                onTap: selectBookingDate,
              ),

              const SizedBox(height: 16),

              // Select Time
              _sectionTitle('Select Slot Time'),

              if (selectedDate == null)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Please select a date first.',
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              else if (!hasAvailableSlots)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'No available slots for today. '
                    'Please select another date.',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              else
                TimesSlotGridViewFromInterval(
                  locale: "en",

                  initTime: selectTime,

                  borderRadius: BorderRadius.circular(10),

                  crossAxisCount: 4,

                  selectedColor: Colors.black,

                  unSelectedColor: Colors.white,

                  childAspectRatio: 2,

                  timeSlotInterval: TimeSlotInterval(
                    start: TimeOfDay.fromDateTime(getFirstAvailableSlot()),

                    end: endTime,

                    interval: const Duration(hours: 1),
                  ),

                  onChange: (value) {
                    setState(() {
                      selectTime = value;
                    });
                  },
                ),

              const SizedBox(height: 16),

              // Service Type
              _sectionTitle('Service Type'),

              _textInputField(
                controller: serviceController,
                readOnly: true,
                hint: 'Enter Service Type',
              ),

              const SizedBox(height: 24),

              // Booking Button
              BlocConsumer<BookBloc, BookState>(
                listener: (context, state) {
                  switch (state.status) {
                    case BookStatus.completed:
                      context.pushAndRemoveUntil(AppRoute.dashboard);
                      break;

                    case BookStatus.error:
                      showMsg(state.msg.toString());
                      break;

                    default:
                      break;
                  }
                },

                builder: (context, state) {
                  if (state.status == BookStatus.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton(
                      onPressed: submitBooking,

                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.zero,
                      ),

                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.deepPurple, Colors.purpleAccent],
                          ),

                          borderRadius: BorderRadius.circular(20),
                        ),

                        alignment: Alignment.center,

                        child: TranslateText(
                          'Confirm Booking',

                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Section title
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),

      child: TranslateText(
        title,

        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  // Text input field
  Widget _textInputField({
    required TextEditingController controller,
    required String hint,
    bool readOnly = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,

      readOnly: readOnly,

      validator: validator,

      style: const TextStyle(color: Colors.black),

      decoration: InputDecoration(
        filled: true,

        fillColor: Colors.grey.shade200,

        hint: TranslateText(hint, style: const TextStyle(color: Colors.black)),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Date picker card
  Widget _pickerCard({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,

          borderRadius: BorderRadius.circular(15),

          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),

        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

        child: Row(
          children: [
            Icon(icon, color: Colors.deepPurple),

            const SizedBox(width: 16),

            Text(text, style: const TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
