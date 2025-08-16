import 'package:drift/drift.dart';
import 'package:demo_qr_scanner/core/database/app_database.dart';
import 'package:demo_qr_scanner/features/attendance/domain/repositories/attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AppDatabase _appDatabase;

  AttendanceRepositoryImpl(this._appDatabase);

  @override
  Future<int> saveAttendanceRecord(AttendanceRecordsCompanion entry) {
    return _appDatabase.into(_appDatabase.attendanceRecords).insert(entry);
  }

  @override
  Future<List<AttendanceRecord>> getAllAttendanceRecords() {
    return _appDatabase.select(_appDatabase.attendanceRecords).get();
  }

  @override
  Future<List<AttendanceRecord>> getUnsyncedAttendanceRecords() {
    return (_appDatabase.select(_appDatabase.attendanceRecords)
          ..where((tbl) => tbl.isSynced.equals(false)))
        .get();
  }

  @override
  Future<void> markAsSynced(AttendanceRecord record) {
    return (_appDatabase.update(_appDatabase.attendanceRecords)..where((tbl) => tbl.id.equals(record.id)))
        .write(AttendanceRecordsCompanion(isSynced: Value(true)));
  }
}
