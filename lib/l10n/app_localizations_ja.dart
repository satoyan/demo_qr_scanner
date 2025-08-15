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
  String get detailsScreenTitle => '出退勤';

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

  @override
  String get noQrCodeOption => 'QRコードがない場合はこちら';

  @override
  String get enterIdHint => 'IDを入力';

  @override
  String get enterNameHint => '氏名を入力';

  @override
  String get confirmButton => '確定';

  @override
  String get idEmptyError => 'IDは必須です';

  @override
  String get nameEmptyError => '氏名は必須です';
}
