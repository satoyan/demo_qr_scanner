import 'package:demo_qr_scanner/details_screen.dart';
import 'package:demo_qr_scanner/qr_scanner_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart'; // Import for initializeDateFormatting

void main() async { // Make main async
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
  await initializeDateFormatting('ja', null); // Initialize date formatting for Japanese locale
  runApp(const MyApp());
}

final _router = GoRouter(
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}

