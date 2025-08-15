import 'package:demo_qr_scanner/features/attendance/presentation/screens/attendance_status_screen.dart';
import 'package:demo_qr_scanner/features/qr_scanner/presentation/screens/qr_scanner_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const QrScannerScreen(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) {
        final qrCodeValue = state.extra as String;
        return AttendanceStatusScreen(qrCodeValue: qrCodeValue);
      },
    ),
  ],
);
