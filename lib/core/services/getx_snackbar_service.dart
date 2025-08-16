import 'package:get/get.dart';
import 'package:demo_qr_scanner/core/services/snackbar_service.dart';

class GetxSnackbarService implements SnackbarService {
  @override
  void showSnackbar(String title, String message) {
    Get.snackbar(title, message);
  }
}
