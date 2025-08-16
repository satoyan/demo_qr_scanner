import 'package:demo_qr_scanner/core/services/error_handling_service.dart';
import 'package:demo_qr_scanner/core/services/navigation_service.dart';
import 'package:demo_qr_scanner/core/services/snackbar_service.dart';
import 'package:demo_qr_scanner/core/services/localization_service.dart';
import 'package:get/get.dart';
import 'package:demo_qr_scanner/features/qr_scanner/presentation/controllers/qr_scanner_controller.dart';

class QrScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrScannerController>(
      () => QrScannerController(
        Get.find<NavigationService>(),
        snackbarService: Get.find<SnackbarService>(),
        localizationService: Get.find<LocalizationService>(),
        errorHandlingService: Get.find<ErrorHandlingService>(),
      ),
    );
  }
}
