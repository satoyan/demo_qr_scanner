import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:demo_qr_scanner/core/database/app_database.dart';
import 'package:demo_qr_scanner/features/attendance/data/repositories/attendance_repository_impl.dart';

void main() {
  late AttendanceRepositoryImpl repository;
  late AppDatabase appDatabase;

  setUp(() {
    appDatabase = AppDatabase.fromConnection(DatabaseConnection(NativeDatabase.memory()));
    repository = AttendanceRepositoryImpl(appDatabase);
  });

  tearDown(() async {
    await appDatabase.close();
  });

  group('AttendanceRepositoryImpl', () {
    test('saveAttendanceRecord saves a record', () async {
      final entry = AttendanceRecordsCompanion(
        employeeId: const Value('emp1'),
        employeeName: const Value('John Doe'),
        timestamp: Value(DateTime.now()),
        status: const Value('clockIn'),
        isSynced: const Value(false),
      );

      final id = await repository.saveAttendanceRecord(entry);
      expect(id, greaterThan(0));

      final records = await repository.getAllAttendanceRecords();
      expect(records.length, 1);
      expect(records.first.employeeId, 'emp1');
    });

    test('getAllAttendanceRecords returns all records', () async {
      await repository.saveAttendanceRecord(AttendanceRecordsCompanion(
        employeeId: const Value('emp1'),
        employeeName: const Value('John Doe'),
        timestamp: Value(DateTime.now()),
        status: const Value('clockIn'),
        isSynced: const Value(false),
      ));
      await repository.saveAttendanceRecord(AttendanceRecordsCompanion(
        employeeId: const Value('emp2'),
        employeeName: const Value('Jane Doe'),
        timestamp: Value(DateTime.now()),
        status: const Value('clockOut'),
        isSynced: const Value(true),
      ));

      final records = await repository.getAllAttendanceRecords();
      expect(records.length, 2);
    });

    test('getUnsyncedAttendanceRecords returns only unsynced records', () async {
      await repository.saveAttendanceRecord(AttendanceRecordsCompanion(
        employeeId: const Value('emp1'),
        employeeName: const Value('John Doe'),
        timestamp: Value(DateTime.now()),
        status: const Value('clockIn'),
        isSynced: const Value(false),
      ));
      await repository.saveAttendanceRecord(AttendanceRecordsCompanion(
        employeeId: const Value('emp2'),
        employeeName: const Value('Jane Doe'),
        timestamp: Value(DateTime.now()),
        status: const Value('clockOut'),
        isSynced: const Value(true),
      ));

      final unsyncedRecords = await repository.getUnsyncedAttendanceRecords();
      expect(unsyncedRecords.length, 1);
      expect(unsyncedRecords.first.isSynced, false);
    });

    test('markAsSynced updates record status', () async {
      await repository.saveAttendanceRecord(AttendanceRecordsCompanion(
        employeeId: const Value('emp1'),
        employeeName: const Value('John Doe'),
        timestamp: Value(DateTime.now()),
        status: const Value('clockIn'),
        isSynced: const Value(false),
      ));

      final recordToUpdate = (await repository.getAllAttendanceRecords()).first;
      await repository.markAsSynced(recordToUpdate);

      final updatedRecord = (await repository.getAllAttendanceRecords()).first;
      expect(updatedRecord.isSynced, true);
    });
  });
}
