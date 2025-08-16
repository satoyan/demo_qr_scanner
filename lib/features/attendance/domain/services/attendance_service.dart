import 'package:demo_qr_scanner/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:demo_qr_scanner/core/database/app_database.dart'; // Import AppDatabase for types

class AttendanceService {
  final AttendanceRepository _attendanceRepository;

  AttendanceService(this._attendanceRepository);

  Future<void> saveAttendanceRecord(AttendanceRecordsCompanion entry) async {
    await _attendanceRepository.saveAttendanceRecord(entry);
  }

  Future<List<AttendanceRecord>> getAllAttendanceRecords() {
    return _attendanceRepository.getAllAttendanceRecords();
  }

  Future<List<AttendanceRecord>> getUnsyncedAttendanceRecords() {
    return _attendanceRepository.getUnsyncedAttendanceRecords();
  }

  Future<void> markAsSynced(AttendanceRecord record) async {
    await _attendanceRepository.markAsSynced(record);
  }
}
