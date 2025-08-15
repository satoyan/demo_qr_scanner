// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const QR_SCANNER = _Paths.QR_SCANNER;
  static const ATTENDANCE_STATUS = _Paths.ATTENDANCE_STATUS;
}

abstract class _Paths {
  _Paths._();
  static const QR_SCANNER = '/';
  static const ATTENDANCE_STATUS = '/attendance_status';
}

