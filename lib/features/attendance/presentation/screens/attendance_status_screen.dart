import 'package:flutter/material.dart'; // Import Flutter Material Design widgets
import 'package:demo_qr_scanner/core/utils/date_time_formatter.dart'; // Import for DateTimeFormatter
import 'package:go_router/go_router.dart'; // Import for context.pop
import 'package:get/get.dart'; // Import GetX
import 'package:demo_qr_scanner/features/attendance/presentation/controllers/attendance_status_controller.dart'; // Import controller
import 'package:demo_qr_scanner/l10n/app_localizations.dart'; // Import for AppLocalizations

class AttendanceStatusScreen extends GetView<AttendanceStatusController> {
  const AttendanceStatusScreen({super.key, required this.qrCodeValue});

  final String qrCodeValue;

  Widget _buildSquareButton(BuildContext context, String text, Color color) {
    return ElevatedButton(
      onPressed: () {
        context.pop(); // Navigate back to the previous screen
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Set background color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        padding: EdgeInsets.zero, // Remove default padding
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge, // Use theme style
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.detailsScreenTitle),
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
                    style: Theme.of(context).textTheme.headlineMedium, // Use theme style
                  )),
                  Obx(() => Text(
                    DateTimeFormatter.formatTime(controller.currentTime),
                    style: Theme.of(context).textTheme.headlineMedium, // Use theme style
                  )),
                ],
              ),
            ),
          ),
          Text(
            '${AppLocalizations.of(context)!.qrCodeLabel} $qrCodeValue',
            style: Theme.of(context).textTheme.bodyLarge,
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
                  AppLocalizations.of(context)!.buttonShukkin,
                  Colors.blue,
                ),
                _buildSquareButton(
                  context,
                  AppLocalizations.of(context)!.buttonTaikin,
                  Colors.red,
                ),
                _buildSquareButton(
                  context,
                  AppLocalizations.of(context)!.buttonKyukeiKaishi,
                  Colors.green,
                ),
                _buildSquareButton(
                  context,
                  AppLocalizations.of(context)!.buttonKyukeiOwari,
                  Colors.orange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
