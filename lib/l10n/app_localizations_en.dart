// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Flutter Demo';

  @override
  String get qrScannerScreenTitle => 'QR Scanner';

  @override
  String get detailsScreenTitle => 'Details';

  @override
  String get scanQrCodeInstruction => 'Hold the QR code over the camera';

  @override
  String get scanningForQrCode => 'Scanning for QR code...';

  @override
  String get qrCodeDetected => 'QR code detected!';

  @override
  String get buttonShukkin => 'Attendance';

  @override
  String get buttonTaikin => 'Leave';

  @override
  String get buttonKyukeiKaishi => 'Break Start';

  @override
  String get buttonKyukeiOwari => 'Break End';

  @override
  String get qrCodeLabel => 'QR Code:';
}
