import 'package:drift/drift.dart';
import 'package:demo_qr_scanner/core/database/database_service.dart'; // Import DatabaseService
import 'package:demo_qr_scanner/core/database/app_database.dart'; // Import AppDatabase for types

class AttendanceService {
  final DatabaseService _db;

  AttendanceService(this._db);

  Future<void> saveAttendanceRecord(AttendanceRecordsCompanion entry) async {
    await _db.saveAttendanceRecord(entry);
  }

  Future<List<AttendanceRecord>> getAllAttendanceRecords() {
    return _db.getAllAttendanceRecords();
  }

  Future<List<AttendanceRecord>> getUnsyncedAttendanceRecords() {
    return _db.getUnsyncedAttendanceRecords();
  }

  Future<void> markAsSynced(AttendanceRecord record) async {
    await _db.markAsSynced(record);
  }
}
