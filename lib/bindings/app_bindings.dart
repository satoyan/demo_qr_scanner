import 'package:get/get.dart';
import 'package:demo_qr_scanner/core/database/app_database.dart';
import 'package:demo_qr_scanner/features/attendance/domain/services/attendance_service.dart';
import 'package:demo_qr_scanner/core/network/network_controller.dart';
import 'package:demo_qr_scanner/core/database/database_service.dart'; // Import DatabaseService

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<DatabaseService>(AppDatabase()); // Register AppDatabase as DatabaseService
    Get.put<AttendanceService>(
      AttendanceService(Get.find<DatabaseService>()),
    ); // Register AttendanceService
    Get.put<NetworkController>(
      NetworkController(Get.find<AttendanceService>()),
    ); // Register NetworkController
  }
}
