import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:demo_qr_scanner/l10n/app_localizations.dart'; // Import for AppLocalizations
import 'package:demo_qr_scanner/features/qr_scanner/presentation/controllers/qr_scanner_controller.dart'; // Import QrScannerController

class QrScannerScreen extends GetView<QrScannerController> {
  const QrScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.qrScannerScreenTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: MobileScanner(controller: controller.scannerController),
          ),
          Expanded(
            child: Center(
              child: Obx(() => controller.isScanning.value
                  ? Text(
                      AppLocalizations.of(context)!.scanQrCodeInstruction,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      AppLocalizations.of(context)!.qrCodeDetected,
                      style: Theme.of(context).textTheme.bodyLarge,
                    )),
            ),
          ),
        ],
      ),
    );
  }
}
