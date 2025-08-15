import 'package:get/get.dart';
import 'package:demo_qr_scanner/features/qr_scanner/presentation/screens/qr_scanner_screen.dart';
import 'package:demo_qr_scanner/features/attendance/presentation/screens/attendance_status_screen.dart';
import 'package:demo_qr_scanner/features/attendance/presentation/bindings/attendance_status_binding.dart';
import 'package:demo_qr_scanner/features/qr_scanner/presentation/bindings/qr_scanner_binding.dart';
import 'package:demo_qr_scanner/features/employee/domain/models/employee.dart'; // Import Employee model

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initialRoute = Routes.qrScanner;

  static final routes = [
    GetPage(
      name: _Paths.qrScanner,
      page: () => const QrScannerScreen(),
      binding: QrScannerBinding(),
    ),
    GetPage(
      name: _Paths.attendanceStatus,
      page: () => AttendanceStatusScreen(employee: Get.arguments as Employee),
      binding: AttendanceStatusBinding(),
    ),
  ];
}

