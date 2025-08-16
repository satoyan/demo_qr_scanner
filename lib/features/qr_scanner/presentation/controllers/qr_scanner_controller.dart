import 'dart:async';
import 'dart:convert'; // Import for jsonDecode
import 'package:demo_qr_scanner/core/services/navigation_service.dart';
import 'package:demo_qr_scanner/core/services/snackbar_service.dart';
import 'package:demo_qr_scanner/core/services/localization_service.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:demo_qr_scanner/core/utils/app_logger.dart'; // Import appLogger
import 'package:demo_qr_scanner/features/employee/domain/models/employee.dart'; // Import Employee model
import 'package:demo_qr_scanner/routes/app_pages.dart'; // Import AppPages for route names

class QrScannerController extends GetxController {
  late MobileScannerController scannerController;
  var isScanning = true.obs;
  final NavigationService _navigationService;
  final SnackbarService _snackbarService;
  final LocalizationService _localizationService;

  QrScannerController(this._navigationService, {MobileScannerController? scannerController, required SnackbarService snackbarService, required LocalizationService localizationService}) : _snackbarService = snackbarService, _localizationService = localizationService {
    this.scannerController = scannerController ?? MobileScannerController(facing: CameraFacing.front);
  }

  @override
  void onInit() {
    super.onInit();
    initScanner();
  }

  Future<void> initScanner() async {
    await scannerController.start();
    scannerController.barcodes.listen(onBarcodeDetected);
  }

  Future<void> onBarcodeDetected(BarcodeCapture capture) async {
    appLogger.d(
      'Detected barcode: ${capture.barcodes.first.rawValue}',
    ); // Use appLogger
    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isNotEmpty && isScanning.value) {
      isScanning.value = false; // Update UI to show detected state
      await handleQrCode(barcodes.first.rawValue);
    }
  }

  Future<void> handleQrCode(String? qrCodeValue) async {
    if (qrCodeValue == null) {
      return;
    }

    // Stop scanning to prevent multiple detections and navigations
    await scannerController.stop();

    try {
      final Map<String, dynamic> jsonMap = jsonDecode(qrCodeValue);
      final Employee employee = Employee.fromJson(jsonMap);
      appLogger.d('Parsed Employee: ${employee.id}, ${employee.name}');
      _navigationService.toNamed(Routes.attendanceStatus, arguments: employee);
    } catch (e) {
      appLogger.e('Error parsing QR code value as JSON: ', error: e);
      // Handle invalid QR code format, e.g., show an error message
      _snackbarService.showSnackbar(
        _localizationService.snackbarErrorTitle,
        _localizationService.snackbarInvalidQrCodeFormat,
      );
      // Optionally, navigate to a different screen or restart scanning
    }

    // After returning from details screen, restart scanner and reset UI
    isScanning.value = true;
    await scannerController.start();
  }

  void navigateToManualEntry() {
    _navigationService.toNamed(Routes.manualEntry);
  }

  @override
  void onClose() {
    scannerController.dispose();
    super.onClose();
  }
}
