import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:demo_qr_scanner/core/database/app_database.dart';

void main() {
  late AppDatabase database;

  setUp(() {
    database = AppDatabase.fromConnection(DatabaseConnection(NativeDatabase.memory()));
  });

  tearDown(() async {
    await database.close();
  });

  group('AppDatabase', () {
    test('can save an attendance record', () async {
      // 勤怠記録を保存できることをテスト
      final entry = AttendanceRecordsCompanion(
        employeeId: const Value('emp1'),
        employeeName: const Value('John Doe'),
        timestamp: Value(DateTime.now()),
        status: const Value('clockIn'),
        isSynced: const Value(false),
      );
      final id = await database.saveAttendanceRecord(entry);
      expect(id, greaterThan(0));

      final records = await database.getAllAttendanceRecords();
      expect(records.length, 1);
      expect(records.first.employeeId, 'emp1');
    });

    test('can get all attendance records', () async {
      // 全ての勤怠記録を取得できることをテスト
      await database.saveAttendanceRecord(AttendanceRecordsCompanion(
        employeeId: const Value('emp1'),
        employeeName: const Value('John Doe'),
        timestamp: Value(DateTime.now()),
        status: const Value('clockIn'),
        isSynced: const Value(false),
      ));
      await database.saveAttendanceRecord(AttendanceRecordsCompanion(
        employeeId: const Value('emp2'),
        employeeName: const Value('Jane Doe'),
        timestamp: Value(DateTime.now()),
        status: const Value('clockOut'),
        isSynced: const Value(true),
      ));

      final records = await database.getAllAttendanceRecords();
      expect(records.length, 2);
    });

    test('can get unsynced attendance records', () async {
      // 未同期の勤怠記録のみを取得できることをテスト
      await database.saveAttendanceRecord(AttendanceRecordsCompanion(
        employeeId: const Value('emp1'),
        employeeName: const Value('John Doe'),
        timestamp: Value(DateTime.now()),
        status: const Value('clockIn'),
        isSynced: const Value(false),
      ));
      await database.saveAttendanceRecord(AttendanceRecordsCompanion(
        employeeId: const Value('emp2'),
        employeeName: const Value('Jane Doe'),
        timestamp: Value(DateTime.now()),
        status: const Value('clockOut'),
        isSynced: const Value(true),
      ));

      final unsyncedRecords = await database.getUnsyncedAttendanceRecords();
      expect(unsyncedRecords.length, 1);
      expect(unsyncedRecords.first.employeeId, 'emp1');
    });

    test('can mark an attendance record as synced', () async {
      // 勤怠記録を同期済みとしてマークできることをテスト
      await database.saveAttendanceRecord(AttendanceRecordsCompanion(
        employeeId: const Value('emp1'),
        employeeName: const Value('John Doe'),
        timestamp: Value(DateTime.now()),
        status: const Value('clockIn'),
        isSynced: const Value(false),
      ));

      final recordToUpdate = (await database.getAllAttendanceRecords()).first;
      await database.markAsSynced(recordToUpdate);

      final updatedRecord = (await database.getAllAttendanceRecords()).first;
      expect(updatedRecord.isSynced, true);
    });
  });
}
