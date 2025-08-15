import 'package:demo_qr_scanner/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart'; // Import for initializeDateFormatting
import 'package:demo_qr_scanner/routes/app_router.dart'; // Import appRouter
import 'package:demo_qr_scanner/core/theme/app_theme.dart'; // Import appTheme
import 'package:demo_qr_scanner/core/database/app_database.dart';

// For simplicity, we'll use a global instance of the database.
// In a real app, you should use a dependency injection solution like
// provider or riverpod to make the database available to your widgets.
late AppDatabase database;

void main() async {
  database = AppDatabase();
  // Make main async
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
    return MaterialApp.router(
      routerConfig: appRouter, // Use appRouter
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      theme: appTheme, // Use appTheme
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
