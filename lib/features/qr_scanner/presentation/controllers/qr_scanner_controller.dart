import 'dart:async';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:logger/logger.dart'; // Import for Logger

class QrScannerController extends GetxController {
  late MobileScannerController scannerController;
  var isScanning = true.obs;
  final Logger _logger = Logger(); // Create a Logger instance

  @override
  void onInit() {
    super.onInit();
    scannerController = MobileScannerController(facing: CameraFacing.front);
    _initScanner();
  }

  Future<void> _initScanner() async {
    await scannerController.start();
    scannerController.barcodes.listen(_onBarcodeDetected);
  }

  Future<void> _onBarcodeDetected(BarcodeCapture capture) async {
    _logger.d('Detected barcode: ${capture.barcodes.first.rawValue}'); // Use logger
    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isNotEmpty && isScanning.value) {
      isScanning.value = false; // Update UI to show detected state
      await _handleQrCode(barcodes.first.rawValue);
    }
  }

  Future<void> _handleQrCode(String? qrCodeValue) async {
    if (qrCodeValue == null) {
      return;
    }

    // Stop scanning to prevent multiple detections and navigations
    await scannerController.stop();

    Get.toNamed('/details', arguments: qrCodeValue);

    // After returning from details screen, restart scanner and reset UI
    isScanning.value = true;
    await scannerController.start();
  }

  @override
  void onClose() {
    scannerController.dispose();
    super.onClose();
  }
}
