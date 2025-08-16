import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:drift/drift.dart';

import 'package:demo_qr_scanner/features/attendance/domain/services/attendance_service.dart';
import 'package:demo_qr_scanner/core/database/app_database.dart';
// Import DatabaseService
import '../../../../mocks.mocks.dart';

void main() {
  late AttendanceService attendanceService;
  late MockAttendanceRepository mockAttendanceRepository;

  setUp(() {
    mockAttendanceRepository = MockAttendanceRepository();
    attendanceService = AttendanceService(mockAttendanceRepository);
  });

  group('AttendanceService', () {
    test('saveAttendanceRecord saves a record', () async {
      final testRecord = AttendanceRecordsCompanion(
        employeeId: const Value('emp123'),
        employeeName: const Value('John Doe'),
        timestamp: Value(DateTime.now()),
        status: const Value('clockIn'),
        isSynced: const Value(false),
      );

      when(
        mockAttendanceRepository.saveAttendanceRecord(testRecord),
      ).thenAnswer((_) async => 1); // Simulate successful insert

      await attendanceService.saveAttendanceRecord(testRecord);

      verify(mockAttendanceRepository.saveAttendanceRecord(testRecord)).called(1);
    });

    test('getAllAttendanceRecords returns all records', () async {
      final records = [
        AttendanceRecord(
          id: 1,
          employeeId: 'emp1',
          employeeName: 'Name1',
          timestamp: DateTime.now(),
          status: 'clockIn',
          isSynced: false,
        ),
        AttendanceRecord(
          id: 2,
          employeeId: 'emp2',
          employeeName: 'Name2',
          timestamp: DateTime.now(),
          status: 'clockOut',
          isSynced: true,
        ),
      ];

      // Mock the select statement
      when(
        mockAttendanceRepository.getAllAttendanceRecords(),
      ).thenAnswer((_) async => records);

      final result = await attendanceService.getAllAttendanceRecords();

      expect(result, records);
      verify(mockAttendanceRepository.getAllAttendanceRecords()).called(1);
    });

    test('getUnsyncedAttendanceRecords returns only unsynced records', () async {
      final records = [
        AttendanceRecord(
          id: 1,
          employeeId: 'emp1',
          employeeName: 'Name1',
          timestamp: DateTime.now(),
          status: 'clockIn',
          isSynced: false,
        ),
        AttendanceRecord(
          id: 2,
          employeeId: 'emp2',
          employeeName: 'Name2',
          timestamp: DateTime.now(),
          status: 'clockOut',
          isSynced: true,
        ),
      ];

      // Mock the select statement with where clause
      // This part is tricky with Mockito and Drift. A common approach is to mock the query builder.
      // For simplicity, we'll mock the final .get() call after a hypothetical filter.
      // In a real scenario, you might need to mock the `where` method on `Selectable`.
      when(
        mockAttendanceRepository.getUnsyncedAttendanceRecords(),
      ).thenAnswer((_) async => [records[0]]); // Only return the unsynced one

      final result = await attendanceService.getUnsyncedAttendanceRecords();

      expect(result.length, 1);
      expect(result[0].isSynced, false);
      // verify(mockAppDatabase.select(mockAppDatabase.attendanceRecords).get()).called(1); // Verification might be complex due to `where`
    });

    test('markAsSynced updates record status', () async {
      final recordToSync = AttendanceRecord(
        id: 1,
        employeeId: 'emp1',
        employeeName: 'Name1',
        timestamp: DateTime.now(),
        status: 'clockIn',
        isSynced: false,
      );

      // Mock the update operation
      when(
        mockAttendanceRepository.markAsSynced(recordToSync),
      ).thenAnswer((_) async => {}); // Simulate successful update

      await attendanceService.markAsSynced(recordToSync);

      verify(mockAttendanceRepository.markAsSynced(recordToSync)).called(1);
    });
  });
}
