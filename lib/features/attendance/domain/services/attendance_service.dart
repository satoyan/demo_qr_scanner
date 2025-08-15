import 'package:drift/drift.dart';
import 'package:demo_qr_scanner/core/database/app_database.dart';

class AttendanceService {
  final AppDatabase _db;

  AttendanceService(this._db);

  Future<void> saveAttendanceRecord(AttendanceRecordsCompanion entry) async {
    await _db.into(_db.attendanceRecords).insert(entry);
  }

  Future<List<AttendanceRecord>> getAllAttendanceRecords() {
    return _db.select(_db.attendanceRecords).get();
  }

  Future<List<AttendanceRecord>> getUnsyncedAttendanceRecords() {
    return (_db.select(
      _db.attendanceRecords,
    )..where((tbl) => tbl.isSynced.equals(false))).get();
  }

  Future<void> markAsSynced(AttendanceRecord record) async {
    await (_db.update(_db.attendanceRecords)
          ..where((tbl) => tbl.id.equals(record.id)))
        .write(AttendanceRecordsCompanion(isSynced: Value(true)));
  }
}
