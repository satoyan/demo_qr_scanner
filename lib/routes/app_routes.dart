part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const qrScanner = _Paths.qrScanner;
  static const attendanceStatus = _Paths.attendanceStatus;
  static const manualEntry = _Paths.manualEntry;
}

abstract class _Paths {
  _Paths._();
  static const qrScanner = '/';
  static const attendanceStatus = '/attendance_status';
  static const manualEntry = '/manual_entry';
}

