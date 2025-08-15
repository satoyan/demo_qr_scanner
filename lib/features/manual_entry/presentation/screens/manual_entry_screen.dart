import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_qr_scanner/core/extensions/build_context_extension.dart';

class ManualEntryScreen extends StatelessWidget {
  const ManualEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.noQrCodeOption),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is the manual entry screen.',
              style: context.theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}