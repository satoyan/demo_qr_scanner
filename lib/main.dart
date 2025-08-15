import 'package:demo_qr_scanner/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart'; // Import for initializeDateFormatting
import 'package:demo_qr_scanner/core/theme/app_theme.dart'; // Import appTheme
import 'package:demo_qr_scanner/core/database/app_database.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:demo_qr_scanner/features/qr_scanner/presentation/screens/qr_scanner_screen.dart'; // Import QrScannerScreen
import 'package:demo_qr_scanner/features/attendance/presentation/screens/attendance_status_screen.dart'; // Import AttendanceStatusScreen
import 'package:demo_qr_scanner/features/attendance/presentation/bindings/attendance_status_binding.dart'; // Import AttendanceStatusBinding
import 'package:demo_qr_scanner/features/qr_scanner/presentation/bindings/qr_scanner_binding.dart'; // Import QrScannerBinding
import 'package:demo_qr_scanner/features/attendance/domain/services/attendance_service.dart'; // Import AttendanceService
import 'package:demo_qr_scanner/core/network/network_controller.dart'; // Import NetworkController
import 'package:demo_qr_scanner/core/extensions/build_context_extension.dart'; // Import BuildContextExtension

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
  await initializeDateFormatting(
    'ja',
    null,
  ); // Initialize date formatting for Japanese locale
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Demo QR Scanner', // Set a default title
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const QrScannerScreen(),
          binding: QrScannerBinding(),
        ),
        GetPage(
          name: '/details',
          page: () => AttendanceStatusScreen(qrCodeValue: Get.arguments),
          binding: AttendanceStatusBinding(),
        ),
      ],
      onGenerateTitle: (context) => context.l10n.appTitle,
      theme: appTheme, // Use appTheme
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialBinding: BindingsBuilder(() {
        Get.put<AppDatabase>(
          AppDatabase(),
        ); // Register AppDatabase as a singleton
        Get.put<AttendanceService>(
          AttendanceService(Get.find<AppDatabase>()),
        ); // Register AttendanceService
        Get.put<NetworkController>(
          NetworkController(Get.find<AttendanceService>()),
        ); // Register NetworkController
      }),
    );
  }
}
