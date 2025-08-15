import 'package:flutter/material.dart';
import 'dart:async'; // Import for Timer
import 'package:demo_qr_scanner/core/utils/date_time_formatter.dart'; // Import for DateTimeFormatter
import 'package:go_router/go_router.dart'; // Import for context.pop
import 'package:demo_qr_scanner/core/extensions/build_context_extension.dart'; // Import for textTheme and l10n extension

class AttendanceStatusScreen extends StatefulWidget {
  const AttendanceStatusScreen({super.key, required this.qrCodeValue});

  final String qrCodeValue;

  @override
  State<AttendanceStatusScreen> createState() => _AttendanceStatusScreenState();
}

class _AttendanceStatusScreenState extends State<AttendanceStatusScreen> {
  late DateTime _currentTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
          style: context.textTheme.labelLarge, // Use theme style
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
                  Text(
                    DateTimeFormatter.formatDate(_currentTime),
                    style: context.textTheme.headlineMedium, // Use theme style
                  ),
                  Text(
                    DateTimeFormatter.formatTime(_currentTime),
                    style: context.textTheme.headlineMedium, // Use theme style
                  ),
                ],
              ),
            ),
          ),
          Text(
            '${context.l10n.qrCodeLabel} ${widget.qrCodeValue}',
            style: context.textTheme.bodyLarge,
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
                ),
                _buildSquareButton(
                  context,
                  context.l10n.buttonTaikin,
                  Colors.red,
                ),
                _buildSquareButton(
                  context,
                  context.l10n.buttonKyukeiKaishi,
                  Colors.green,
                ),
                _buildSquareButton(
                  context,
                  context.l10n.buttonKyukeiOwari,
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
