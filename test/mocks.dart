import 'package:demo_qr_scanner/core/services/error_handling_service.dart';
import 'package:demo_qr_scanner/core/services/getx_navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_qr_scanner/features/attendance/domain/services/attendance_service.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:demo_qr_scanner/core/services/snackbar_service.dart';
import 'package:demo_qr_scanner/core/services/localization_service.dart';
import 'package:demo_qr_scanner/l10n/app_localizations.dart';
import 'package:demo_qr_scanner/features/attendance/domain/repositories/attendance_repository.dart';

@GenerateNiceMocks([
  MockSpec<GlobalKey<FormState>>(as: #MockFormStateKey),
  MockSpec<FormState>(),
  MockSpec<GetxNavigationService>(),
  MockSpec<AttendanceService>(),
  MockSpec<Connectivity>(),
  MockSpec<MobileScannerController>(),
  MockSpec<SnackbarService>(),
  MockSpec<ErrorHandlingService>(),
  MockSpec<LocalizationService>(as: #MockLocalizationService),
  MockSpec<AppLocalizations>(as: #MockAppLocalizations),
  MockSpec<AttendanceRepository>(as: #MockAttendanceRepository),
])
void main() {}
