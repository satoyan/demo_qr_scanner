import 'package:get/get.dart';
import 'package:demo_qr_scanner/features/qr_scanner/presentation/screens/qr_scanner_screen.dart';
import 'package:demo_qr_scanner/features/attendance/presentation/screens/attendance_status_screen.dart';
import 'package:demo_qr_scanner/features/attendance/presentation/bindings/attendance_status_binding.dart';
import 'package:demo_qr_scanner/features/qr_scanner/presentation/bindings/qr_scanner_binding.dart';
import 'package:demo_qr_scanner/features/employee/domain/models/employee.dart'; // Import Employee model
import 'package:demo_qr_scanner/features/manual_entry/presentation/screens/manual_entry_screen.dart'; // Import ManualEntryScreen
import 'package:demo_qr_scanner/features/manual_entry/presentation/bindings/manual_entry_binding.dart'; // Import ManualEntryBinding

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
    GetPage(
      name: _Paths.manualEntry,
      page: () => const ManualEntryScreen(),
      binding: ManualEntryBinding(),
    ),
  ];
}

