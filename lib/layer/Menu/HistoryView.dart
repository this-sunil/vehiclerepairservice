import 'dart:ui';
import 'package:flutter/material.dart';

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

  // Modern Color Palette
  static const Color primaryColor = Color(0xFF0F62FE);
  static const Color primaryLightColor = Color(0xFFEDF5FF);

  static const Color successColor = Color(0xFF10B981);
  static const Color successLightColor = Color(0xFFECFDF5);

  static const Color backgroundColor = Color(0xFFF8FAFC);
  static const Color cardColor = Colors.white;

  static const Color darkText = Color(0xFF0F172A);
  static const Color normalText = Color(0xFF334155);
  static const Color lightText = Color(0xFF64748B);

  static const Color borderColor = Color(0xFFE2E8F0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleSpacing: 8,
        title: TranslateText(
          vehicleName,
          style: const TextStyle(
            color: darkText,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3,
          ),
        ),
        iconTheme: const IconThemeData(color: darkText),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: borderColor.withValues(alpha: 0.6),
            height: 1.0,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _customHeader(),
              const SizedBox(height: 28),
              _sectionTitle(
                icon: Icons.receipt_long_rounded,
                title: "Booking Details",
              ),
              const SizedBox(height: 14),
              _bookingDetailsCard(),
              const SizedBox(height: 28),
              _sectionTitle(
                icon: Icons.timeline_rounded,
                title: "Booking Timeline",
              ),
              const SizedBox(height: 14),
              _timelineCard(),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // HEADER CARD WITH GLASSMORPHISM OVERLAY
  // ============================================================

  Widget _customHeader() {
    return Container(
      height: 260,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Hero(
          tag: '$bookId',
          child: Stack(
            fit: StackFit.expand,
            children: [
              CustomImage(
                imgPath: vehiclePhoto,
                width: double.infinity,
                height: 260,
                fit: BoxFit.cover,
                radius: 0,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.1),
                      Colors.black.withValues(alpha: 0.75),
                    ],
                    stops: const [0.5, 1.0],
                  ),
                ),
              ),
              Positioned(
                top: 14,
                right: 14,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: successColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle_rounded,
                        color: Colors.white,
                        size: 14,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Completed",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 14,
                right: 14,
                bottom: 14,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.25),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TranslateText(
                            vehicleName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.2,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.confirmation_number_outlined,
                                color: Colors.white70,
                                size: 14,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  registrationNo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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

  // ============================================================
  // SECTION TITLE
  // ============================================================

  Widget _sectionTitle({required IconData icon, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: primaryLightColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: primaryColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TranslateText(
              title,
              style: const TextStyle(
                color: darkText,
                fontSize: 17,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BOOKING DETAILS CARD
  // ============================================================

  Widget _bookingDetailsCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.03),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          _detailRow(
            icon: Icons.directions_car_rounded,
            title: "Vehicle Name",
            value: vehicleName,
          ),
          _detailDivider(),
          _detailRow(
            icon: Icons.confirmation_number_outlined,
            title: "Registration No.",
            value: registrationNo,
          ),
          _detailDivider(),
          _detailRow(
            icon: Icons.build_circle_outlined,
            title: "Service",
            value: serviceName,
          ),
          _detailDivider(),
          _detailRow(
            icon: Icons.category_outlined,
            title: "Vehicle Type",
            value: vehicleType,
          ),
          _detailDivider(),
          _detailRow(
            icon: Icons.access_time_rounded,
            title: "Slot Time",
            value: slotTime,
          ),
          _detailDivider(),
          _detailRow(
            icon: Icons.calendar_month_rounded,
            title: "Slot Date",
            value: slotDate,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _detailRow({
    required IconData icon,
    required String title,
    required String value,
    bool isLast = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: borderColor, width: 0.8),
            ),
            child: Icon(icon, color: lightText, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TranslateText(
                  title,
                  style: const TextStyle(
                    color: lightText,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 3),
                TranslateText(
                  value,
                  style: const TextStyle(
                    color: darkText,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailDivider() {
    return const Padding(
      padding: EdgeInsets.only(left: 70),
      child: Divider(height: 1, thickness: 0.8, color: borderColor),
    );
  }

  // ============================================================
  // TIMELINE CARD
  // ============================================================

  Widget _timelineCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.03),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          _timelineItem(
            step: 1,
            icon: Icons.check_rounded,
            title: "Booking Created",
            description: "Your booking has been created successfully.",
            status: "Confirmed",
            color: successColor,
            backgroundColor: successLightColor,
            isLast: false,
          ),
          _timelineItem(
            step: 2,
            icon: Icons.build_rounded,
            title: "Processing",
            description: "Your vehicle service is currently being processed.",
            status: "In Progress",
            color: primaryColor,
            backgroundColor: primaryLightColor,
            isLast: false,
          ),
          _timelineItem(
            step: 3,
            icon: Icons.done_all_rounded,
            title: "Completed",
            description:
                "Your vehicle service has been completed successfully.",
            status: "Completed",
            color: successColor,
            backgroundColor: successLightColor,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _timelineItem({
    required int step,
    required IconData icon,
    required String title,
    required String description,
    required String status,
    required Color color,
    required Color backgroundColor,
    required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 32,
            child: Column(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: color.withValues(alpha: 0.25),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(icon, color: Colors.white, size: 16),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        color: borderColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 16 : 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TranslateText(
                          title,
                          style: const TextStyle(
                            color: darkText,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Step $step",
                          style: TextStyle(
                            color: color,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  TranslateText(
                    description,
                    style: const TextStyle(
                      color: normalText,
                      fontSize: 12.5,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            color: color,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today_outlined,
                            size: 11,
                            color: lightText,
                          ),
                          const SizedBox(width: 4),
                          TranslateText(
                            slotDate,
                            style: const TextStyle(
                              color: lightText,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.access_time_outlined,
                            size: 11,
                            color: lightText,
                          ),
                          const SizedBox(width: 4),
                          TranslateText(
                            slotTime,
                            style: const TextStyle(
                              color: lightText,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
