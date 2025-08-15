import 'package:get/get.dart';
import 'package:demo_qr_scanner/features/attendance/presentation/controllers/attendance_status_controller.dart';

class AttendanceStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceStatusController>(
      () => AttendanceStatusController(),
    );
  }
}
