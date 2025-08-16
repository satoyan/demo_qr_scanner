import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

class AttendanceRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get employeeId => text()();
  TextColumn get employeeName => text()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get status => text()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [AttendanceRecords])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.fromConnection(DatabaseConnection super.connection);

  @override
  int get schemaVersion => 1;

  Future<int> saveAttendanceRecord(AttendanceRecordsCompanion entry) {
    return into(attendanceRecords).insert(entry);
  }

  Future<List<AttendanceRecord>> getAllAttendanceRecords() {
    return select(attendanceRecords).get();
  }

  Future<List<AttendanceRecord>> getUnsyncedAttendanceRecords() {
    return (select(attendanceRecords)
          ..where((tbl) => tbl.isSynced.equals(false)))
        .get();
  }

  Future<void> markAsSynced(AttendanceRecord record) {
    return (update(attendanceRecords)..where((tbl) => tbl.id.equals(record.id)))
        .write(AttendanceRecordsCompanion(isSynced: Value(true)));
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
