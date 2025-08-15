import 'package:demo_qr_scanner/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart'; // Import for initializeDateFormatting
import 'package:demo_qr_scanner/core/theme/app_theme.dart'; // Import appTheme
import 'package:get/get.dart'; // Import GetX

import 'package:demo_qr_scanner/core/extensions/build_context_extension.dart'; // Import BuildContextExtension
import 'package:demo_qr_scanner/routes/app_pages.dart'; // Import AppPages
import 'package:demo_qr_scanner/bindings/app_bindings.dart'; // Import AppBindings

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
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      onGenerateTitle: (context) => context.l10n.appTitle,
      theme: appTheme, // Use appTheme
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialBinding: AppBindings(),
    );
  }
}
