import 'package:get/get.dart';
import 'package:demo_qr_scanner/core/database/app_database.dart';
import 'package:demo_qr_scanner/features/attendance/domain/services/attendance_service.dart';
import 'package:demo_qr_scanner/core/network/network_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AppDatabase>(AppDatabase()); // Register AppDatabase as a singleton
    Get.put<AttendanceService>(
      AttendanceService(Get.find<AppDatabase>()),
    ); // Register AttendanceService
    Get.put<NetworkController>(
      NetworkController(Get.find<AttendanceService>()),
    ); // Register NetworkController
  }
}
