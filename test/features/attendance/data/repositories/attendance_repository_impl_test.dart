import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:demo_qr_scanner/core/database/app_database.dart';
import 'package:demo_qr_scanner/features/attendance/data/repositories/attendance_repository_impl.dart';

import '../../../../mocks.mocks.dart';

void main() {
  late AttendanceRepositoryImpl repository;
  late MockAppDatabase mockAppDatabase;

  setUp(() {
    mockAppDatabase = MockAppDatabase();
    repository = AttendanceRepositoryImpl(mockAppDatabase);
  });

  group('AttendanceRepositoryImpl', () {
    test('saveAttendanceRecord calls AppDatabase.saveAttendanceRecord', () async {
      final entry = AttendanceRecordsCompanion(
        employeeId: const Value('emp1'),
        employeeName: const Value('John Doe'),
        timestamp: Value(DateTime.now()),
        status: const Value('clockIn'),
        isSynced: const Value(false),
      );
      when(mockAppDatabase.saveAttendanceRecord(entry)).thenAnswer((_) async => 1);

      await repository.saveAttendanceRecord(entry);

      verify(mockAppDatabase.saveAttendanceRecord(entry)).called(1);
    });

    test('getAllAttendanceRecords calls AppDatabase.getAllAttendanceRecords', () async {
      when(mockAppDatabase.getAllAttendanceRecords()).thenAnswer((_) async => []);

      await repository.getAllAttendanceRecords();

      verify(mockAppDatabase.getAllAttendanceRecords()).called(1);
    });

    test('getUnsyncedAttendanceRecords calls AppDatabase.getUnsyncedAttendanceRecords', () async {
      when(mockAppDatabase.getUnsyncedAttendanceRecords()).thenAnswer((_) async => []);

      await repository.getUnsyncedAttendanceRecords();

      verify(mockAppDatabase.getUnsyncedAttendanceRecords()).called(1);
    });

    test('markAsSynced calls AppDatabase.markAsSynced', () async {
      final record = AttendanceRecord(id: 1, employeeId: 'emp1', employeeName: 'John Doe', timestamp: DateTime.now(), status: 'clockIn', isSynced: false);
      when(mockAppDatabase.markAsSynced(record)).thenAnswer((_) async {});

      await repository.markAsSynced(record);

      verify(mockAppDatabase.markAsSynced(record)).called(1);
    });
  });
}
