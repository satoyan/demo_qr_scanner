// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Flutter デモ';

  @override
  String get qrScannerScreenTitle => 'QRスキャナー';

  @override
  String get detailsScreenTitle => '詳細';

  @override
  String get scanQrCodeInstruction => 'QRコードをかざしてください';

  @override
  String get scanningForQrCode => 'QRコードをスキャン中...';

  @override
  String get qrCodeDetected => 'QRコードを検出しました！';

  @override
  String get buttonShukkin => '出勤';

  @override
  String get buttonTaikin => '退勤';

  @override
  String get buttonKyukeiKaishi => '休憩開始';

  @override
  String get buttonKyukeiOwari => '休憩終わり';

  @override
  String get qrCodeLabel => 'QRコード：';
}
