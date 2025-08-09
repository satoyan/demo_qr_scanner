import 'package:demo_qr_scanner/details_screen.dart';
import 'package:demo_qr_scanner/qr_scanner_screen.dart';
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
        return DetailsScreen(qrCodeValue: qrCodeValue);
      },
    ),
  ],
);
