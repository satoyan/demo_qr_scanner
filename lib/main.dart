import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart'; // Import for initializeDateFormatting
import 'package:demo_qr_scanner/routes/app_router.dart'; // Import appRouter
import 'package:demo_qr_scanner/theme/app_theme.dart'; // Import appTheme

void main() async { // Make main async
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
  await initializeDateFormatting('ja', null); // Initialize date formatting for Japanese locale
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter, // Use appRouter
      title: 'Flutter Demo',
      theme: appTheme, // Use appTheme
    );
  }
}

