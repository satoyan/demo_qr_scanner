import 'package:demo_qr_scanner/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
