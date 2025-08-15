import 'package:demo_qr_scanner/core/services/getx_navigation_service.dart';
import 'package:get/get.dart';
import 'package:demo_qr_scanner/core/database/app_database.dart';
import 'package:demo_qr_scanner/features/attendance/domain/services/attendance_service.dart';
import 'package:demo_qr_scanner/core/network/network_controller.dart';
import 'package:demo_qr_scanner/core/database/database_service.dart'; // Import DatabaseService

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetxNavigationService(), fenix: true);
    Get.lazyPut<DatabaseService>(() => AppDatabase(), fenix: true);
    Get.lazyPut<AttendanceService>(
      () => AttendanceService(Get.find<DatabaseService>()),
    );
    Get.lazyPut<NetworkController>(
      () => NetworkController(Get.find<AttendanceService>()),
      fenix: true,
    );
  }
}
