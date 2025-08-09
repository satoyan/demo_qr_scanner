import 'package:flutter/material.dart';
import 'dart:async'; // Import for Timer
import 'package:demo_qr_scanner/utils/date_time_formatter.dart'; // Import for DateTimeFormatter
import 'package:go_router/go_router.dart'; // Import for context.pop

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.qrCodeValue});

  final String qrCodeValue;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ), // Ensure text is visible
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
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
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateTimeFormatter.formatTime(_currentTime),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text('QR Code: ${widget.qrCodeValue}'),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(10),
              children: [
                _buildSquareButton(context, '出勤', Colors.blue),
                _buildSquareButton(context, '退勤', Colors.red),
                _buildSquareButton(context, '休憩開始', Colors.green),
                _buildSquareButton(context, '休憩終わり', Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
