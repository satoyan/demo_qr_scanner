import 'package:demo_qr_scanner/core/widgets/base_screen.dart';
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

  Widget _buildSquareButton(
    BuildContext context, {
    required String text,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Set background color
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.s)),
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

  Widget _buildAttendanceButtons(BuildContext context) {
    final buttonData = [
      {
        'text': context.l10n.buttonShukkin,
        'color': Colors.blue,
        'status': AttendanceStatus.clockIn,
      },
      {
        'text': context.l10n.buttonTaikin,
        'color': Colors.red,
        'status': AttendanceStatus.clockOut,
      },
      {
        'text': context.l10n.buttonKyukeiKaishi,
        'color': Colors.green,
        'status': AttendanceStatus.startBreak,
      },
      {
        'text': context.l10n.buttonKyukeiOwari,
        'color': Colors.orange,
        'status': AttendanceStatus.endBreak,
      },
    ];

    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: AppSpacing.s,
        mainAxisSpacing: AppSpacing.s,
        padding: const EdgeInsets.all(AppSpacing.s),
        children: buttonData.map((data) {
          return _buildSquareButton(
            context,
            text: data['text'] as String,
            color: data['color'] as Color,
            onPressed: () => controller.recordAttendance(
              employee.id,
              employee.name,
              data['status'] as AttendanceStatus,
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
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
                        style:
                            context.theme.textTheme.headlineMedium, // Use theme style
                      )),
                  Obx(() => Text(
                        DateTimeFormatter.formatTime(controller.currentTime),
                        style:
                            context.theme.textTheme.headlineMedium, // Use theme style
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
          _buildAttendanceButtons(context),
        ],
      ),
    );
  }
}
