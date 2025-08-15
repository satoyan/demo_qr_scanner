import 'package:flutter/material.dart'; // Import Flutter Material Design widgets
import 'package:demo_qr_scanner/core/utils/date_time_formatter.dart'; // Import for DateTimeFormatter
import 'package:get/get.dart'; // Import GetX
import 'package:demo_qr_scanner/features/attendance/presentation/controllers/attendance_status_controller.dart'; // Import controller
import 'package:demo_qr_scanner/core/extensions/build_context_extension.dart'; // Import BuildContextExtension
import 'package:demo_qr_scanner/core/constants/app_constants.dart'; // Import AppConstants
import 'package:demo_qr_scanner/features/attendance/domain/enums/attendance_status.dart'; // Import AttendanceStatus
import 'package:demo_qr_scanner/features/employee/domain/models/employee.dart'; // Import Employee model

class AttendanceStatusScreen extends GetView<AttendanceStatusController> {
  const AttendanceStatusScreen({super.key, required this.employee});

  final Employee employee;

  Widget _buildSquareButton(BuildContext context, String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Set background color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.s)),
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
            padding: const EdgeInsets.all(AppSpacing.s),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.m),
            child: Column(
              children: [
                Text(
                  employee.name,
                  style: context.theme.textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'ID: ${employee.id}',
                  style: context.theme.textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.m),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: AppSpacing.s,
              mainAxisSpacing: AppSpacing.s,
              padding: const EdgeInsets.all(AppSpacing.s),
              children: [
                _buildSquareButton(
                  context,
                  context.l10n.buttonShukkin,
                  Colors.blue,
                  () => controller.recordAttendance(employee.id, employee.name, AttendanceStatus.clockIn),
                ),
                _buildSquareButton(
                  context,
                  context.l10n.buttonTaikin,
                  Colors.red,
                  () => controller.recordAttendance(employee.id, employee.name, AttendanceStatus.clockOut),
                ),
                _buildSquareButton(
                  context,
                  context.l10n.buttonKyukeiKaishi,
                  Colors.green,
                  () => controller.recordAttendance(employee.id, employee.name, AttendanceStatus.startBreak),
                ),
                _buildSquareButton(
                  context,
                  context.l10n.buttonKyukeiOwari,
                  Colors.orange,
                  () => controller.recordAttendance(employee.id, employee.name, AttendanceStatus.endBreak),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
