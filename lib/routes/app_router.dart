import 'package:demo_qr_scanner/features/attendance/presentation/bindings/attendance_status_binding.dart';
import 'package:demo_qr_scanner/features/attendance/presentation/screens/attendance_status_screen.dart';
import 'package:demo_qr_scanner/features/qr_scanner/presentation/screens/qr_scanner_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const QrScannerScreen()),
    GoRoute(
      path: '/details',
      builder: (context, state) {
        // In a pure GetX navigation setup, you would use Get.put(AttendanceStatusController()) here
        // or define a GetPage with a binding.
        AttendanceStatusBinding().dependencies();
        final qrCodeValue = state.extra as String;
        return AttendanceStatusScreen(qrCodeValue: qrCodeValue);
      },
    ),
  ],
);
