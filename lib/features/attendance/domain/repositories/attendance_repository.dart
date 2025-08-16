import 'package:demo_qr_scanner/core/database/app_database.dart';

abstract class AttendanceRepository {
  Future<int> saveAttendanceRecord(AttendanceRecordsCompanion entry);
  Future<List<AttendanceRecord>> getAllAttendanceRecords();
  Future<List<AttendanceRecord>> getUnsyncedAttendanceRecords();
  Future<void> markAsSynced(AttendanceRecord record);
}