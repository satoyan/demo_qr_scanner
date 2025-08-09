import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.qrCodeValue});

  final String qrCodeValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('QR Code: $qrCodeValue'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Button 1'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Button 2'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Button 3'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Button 4'),
            ),
          ],
        ),
      ),
    );
  }
}
