part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const qrScanner = _Paths.qrScanner;
  static const attendanceStatus = _Paths.attendanceStatus;
}

abstract class _Paths {
  _Paths._();
  static const qrScanner = '/';
  static const attendanceStatus = '/attendance_status';
}

