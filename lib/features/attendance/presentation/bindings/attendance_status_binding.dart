import 'package:demo_qr_scanner/core/services/navigation_service.dart';
import 'package:demo_qr_scanner/core/services/snackbar_service.dart';
import 'package:demo_qr_scanner/core/services/localization_service.dart';
import 'package:get/get.dart';
import 'package:demo_qr_scanner/features/attendance/presentation/controllers/attendance_status_controller.dart';
import 'package:demo_qr_scanner/features/attendance/domain/services/attendance_service.dart';
import 'package:demo_qr_scanner/core/database/app_database.dart'; // Import for database instance

class AttendanceStatusBinding extends Bindings {
  @override
  void dependencies() {
    // Register AppDatabase globally if not already done, or pass it
    // Assuming 'database' is already a global instance from main.dart
    Get.lazyPut<AttendanceService>(
      () => AttendanceService(Get.find<AppDatabase>()), // Get the database instance from GetX
    );
    Get.lazyPut<AttendanceStatusController>(
      () => AttendanceStatusController(
        Get.find<AttendanceService>(),
        Get.find<NavigationService>(),
        Get.find<SnackbarService>(),
        Get.find<LocalizationService>(),
      ),
    );
  }
}
