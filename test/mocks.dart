import 'package:demo_qr_scanner/core/services/getx_navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_qr_scanner/features/attendance/domain/services/attendance_service.dart';
import 'package:demo_qr_scanner/core/database/database_service.dart'; // Import DatabaseService
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:demo_qr_scanner/core/services/snackbar_service.dart';
import 'package:demo_qr_scanner/core/services/localization_service.dart';
import 'package:demo_qr_scanner/l10n/app_localizations.dart';

@GenerateNiceMocks([
  MockSpec<DatabaseService>(as: #MockDatabaseService),
  MockSpec<GlobalKey<FormState>>(as: #MockFormStateKey),
  MockSpec<FormState>(),
  MockSpec<GetxNavigationService>(),
  MockSpec<AttendanceService>(),
  MockSpec<Connectivity>(),
  MockSpec<MobileScannerController>(),
  MockSpec<SnackbarService>(),
  MockSpec<LocalizationService>(as: #MockLocalizationService),
  MockSpec<AppLocalizations>(as: #MockAppLocalizations),
])
void main() {}

class MockBuildContext extends Mock implements BuildContext {
  @override
  AppLocalizations get l10n => (super.noSuchMethod(
        Invocation.getter(#l10n),
        returnValue: MockAppLocalizations(),
      ) as AppLocalizations);
}


