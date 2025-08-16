import 'package:demo_qr_scanner/core/widgets/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:demo_qr_scanner/features/qr_scanner/presentation/controllers/qr_scanner_controller.dart'; // Import QrScannerController
import 'package:demo_qr_scanner/core/extensions/build_context_extension.dart'; // Import BuildContextExtension
import 'package:demo_qr_scanner/core/constants/app_constants.dart'; // Import AppConstants

class QrScannerScreen extends GetView<QrScannerController> {
  const QrScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        title: Text(
          context.l10n.qrScannerScreenTitle,
          style: context.theme.textTheme.titleLarge,
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
              child: Obx(
                () => controller.isScanning.value
                    ? Text(
                        context.l10n.scanQrCodeInstruction,
                        style: context.theme.textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        context.l10n.qrCodeDetected,
                        style: context.theme.textTheme.bodyLarge,
                      ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.m),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to manual entry screen
                controller.navigateToManualEntry();
              },
              child: Text(context.l10n.noQrCodeOption),
            ),
          ),
        ],
      ),
    );
  }
}
