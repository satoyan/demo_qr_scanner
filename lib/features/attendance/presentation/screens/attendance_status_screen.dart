import 'package:flutter/material.dart'; // Import Flutter Material Design widgets
import 'package:demo_qr_scanner/core/utils/date_time_formatter.dart'; // Import for DateTimeFormatter
import 'package:get/get.dart'; // Import GetX
import 'package:demo_qr_scanner/features/attendance/presentation/controllers/attendance_status_controller.dart'; // Import controller
import 'package:demo_qr_scanner/core/extensions/build_context_extension.dart'; // Import BuildContextExtension

class AttendanceStatusScreen extends GetView<AttendanceStatusController> {
  const AttendanceStatusScreen({super.key, required this.qrCodeValue});

  final String qrCodeValue;

  Widget _buildSquareButton(BuildContext context, String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Set background color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        padding: EdgeInsets.zero, // Remove default padding
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: context.theme.textTheme.labelLarge, // Use theme style
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.detailsScreenTitle),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(() => Text(
                    DateTimeFormatter.formatDate(controller.currentTime),
                    style: context.theme.textTheme.headlineMedium, // Use theme style
                  )),
                  Obx(() => Text(
                    DateTimeFormatter.formatTime(controller.currentTime),
                    style: context.theme.textTheme.headlineMedium, // Use theme style
                  )),
                ],
              ),
            ),
          ),
          Text(
            '${context.l10n.qrCodeLabel} $qrCodeValue',
            style: context.theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(10),
              children: [
                _buildSquareButton(
                  context,
                  context.l10n.buttonShukkin,
                  Colors.blue,
                  () => controller.recordAttendance(qrCodeValue, "Employee Name", AttendanceStatus.clockIn),
                ),
                _buildSquareButton(
                  context,
                  context.l10n.buttonTaikin,
                  Colors.red,
                  () => controller.recordAttendance(qrCodeValue, "Employee Name", AttendanceStatus.clockOut),
                ),
                _buildSquareButton(
                  context,
                  context.l10n.buttonKyukeiKaishi,
                  Colors.green,
                  () => controller.recordAttendance(qrCodeValue, "Employee Name", AttendanceStatus.startBreak),
                ),
                _buildSquareButton(
                  context,
                  context.l10n.buttonKyukeiOwari,
                  Colors.orange,
                  () => controller.recordAttendance(qrCodeValue, "Employee Name", AttendanceStatus.endBreak),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
