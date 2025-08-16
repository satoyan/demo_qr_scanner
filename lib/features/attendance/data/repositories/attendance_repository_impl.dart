import 'package:demo_qr_scanner/core/database/app_database.dart';
import 'package:demo_qr_scanner/features/attendance/domain/repositories/attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AppDatabase _appDatabase;

  AttendanceRepositoryImpl(this._appDatabase);

  @override
  Future<int> saveAttendanceRecord(AttendanceRecordsCompanion entry) {
    return _appDatabase.saveAttendanceRecord(entry);
  }

  @override
  Future<List<AttendanceRecord>> getAllAttendanceRecords() {
    return _appDatabase.getAllAttendanceRecords();
  }

  @override
  Future<List<AttendanceRecord>> getUnsyncedAttendanceRecords() {
    return _appDatabase.getUnsyncedAttendanceRecords();
  }

  @override
  Future<void> markAsSynced(AttendanceRecord record) {
    return _appDatabase.markAsSynced(record);
  }
}
