// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AttendanceRecordsTable extends AttendanceRecords
    with TableInfo<$AttendanceRecordsTable, AttendanceRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttendanceRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _employeeIdMeta =
      const VerificationMeta('employeeId');
  @override
  late final GeneratedColumn<String> employeeId = GeneratedColumn<String>(
      'employee_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _employeeNameMeta =
      const VerificationMeta('employeeName');
  @override
  late final GeneratedColumn<String> employeeName = GeneratedColumn<String>(
      'employee_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, employeeId, employeeName, timestamp, status, isSynced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attendance_records';
  @override
  VerificationContext validateIntegrity(Insertable<AttendanceRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('employee_id')) {
      context.handle(
          _employeeIdMeta,
          employeeId.isAcceptableOrUnknown(
              data['employee_id']!, _employeeIdMeta));
    } else if (isInserting) {
      context.missing(_employeeIdMeta);
    }
    if (data.containsKey('employee_name')) {
      context.handle(
          _employeeNameMeta,
          employeeName.isAcceptableOrUnknown(
              data['employee_name']!, _employeeNameMeta));
    } else if (isInserting) {
      context.missing(_employeeNameMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AttendanceRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttendanceRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      employeeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}employee_id'])!,
      employeeName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}employee_name'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $AttendanceRecordsTable createAlias(String alias) {
    return $AttendanceRecordsTable(attachedDatabase, alias);
  }
}

class AttendanceRecord extends DataClass
    implements Insertable<AttendanceRecord> {
  final int id;
  final String employeeId;
  final String employeeName;
  final DateTime timestamp;
  final String status;
  final bool isSynced;
  const AttendanceRecord(
      {required this.id,
      required this.employeeId,
      required this.employeeName,
      required this.timestamp,
      required this.status,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['employee_id'] = Variable<String>(employeeId);
    map['employee_name'] = Variable<String>(employeeName);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['status'] = Variable<String>(status);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  AttendanceRecordsCompanion toCompanion(bool nullToAbsent) {
    return AttendanceRecordsCompanion(
      id: Value(id),
      employeeId: Value(employeeId),
      employeeName: Value(employeeName),
      timestamp: Value(timestamp),
      status: Value(status),
      isSynced: Value(isSynced),
    );
  }

  factory AttendanceRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttendanceRecord(
      id: serializer.fromJson<int>(json['id']),
      employeeId: serializer.fromJson<String>(json['employeeId']),
      employeeName: serializer.fromJson<String>(json['employeeName']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      status: serializer.fromJson<String>(json['status']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'employeeId': serializer.toJson<String>(employeeId),
      'employeeName': serializer.toJson<String>(employeeName),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'status': serializer.toJson<String>(status),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  AttendanceRecord copyWith(
          {int? id,
          String? employeeId,
          String? employeeName,
          DateTime? timestamp,
          String? status,
          bool? isSynced}) =>
      AttendanceRecord(
        id: id ?? this.id,
        employeeId: employeeId ?? this.employeeId,
        employeeName: employeeName ?? this.employeeName,
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        isSynced: isSynced ?? this.isSynced,
      );
  @override
  String toString() {
    return (StringBuffer('AttendanceRecord(')
          ..write('id: $id, ')
          ..write('employeeId: $employeeId, ')
          ..write('employeeName: $employeeName, ')
          ..write('timestamp: $timestamp, ')
          ..write('status: $status, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, employeeId, employeeName, timestamp, status, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttendanceRecord &&
          other.id == this.id &&
          other.employeeId == this.employeeId &&
          other.employeeName == this.employeeName &&
          other.timestamp == this.timestamp &&
          other.status == this.status &&
          other.isSynced == this.isSynced);
}

class AttendanceRecordsCompanion extends UpdateCompanion<AttendanceRecord> {
  final Value<int> id;
  final Value<String> employeeId;
  final Value<String> employeeName;
  final Value<DateTime> timestamp;
  final Value<String> status;
  final Value<bool> isSynced;
  const AttendanceRecordsCompanion({
    this.id = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.employeeName = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.status = const Value.absent(),
    this.isSynced = const Value.absent(),
  });
  AttendanceRecordsCompanion.insert({
    this.id = const Value.absent(),
    required String employeeId,
    required String employeeName,
    required DateTime timestamp,
    required String status,
    this.isSynced = const Value.absent(),
  })  : employeeId = Value(employeeId),
        employeeName = Value(employeeName),
        timestamp = Value(timestamp),
        status = Value(status);
  static Insertable<AttendanceRecord> custom({
    Expression<int>? id,
    Expression<String>? employeeId,
    Expression<String>? employeeName,
    Expression<DateTime>? timestamp,
    Expression<String>? status,
    Expression<bool>? isSynced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (employeeId != null) 'employee_id': employeeId,
      if (employeeName != null) 'employee_name': employeeName,
      if (timestamp != null) 'timestamp': timestamp,
      if (status != null) 'status': status,
      if (isSynced != null) 'is_synced': isSynced,
    });
  }

  AttendanceRecordsCompanion copyWith(
      {Value<int>? id,
      Value<String>? employeeId,
      Value<String>? employeeName,
      Value<DateTime>? timestamp,
      Value<String>? status,
      Value<bool>? isSynced}) {
    return AttendanceRecordsCompanion(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      employeeName: employeeName ?? this.employeeName,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (employeeId.present) {
      map['employee_id'] = Variable<String>(employeeId.value);
    }
    if (employeeName.present) {
      map['employee_name'] = Variable<String>(employeeName.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceRecordsCompanion(')
          ..write('id: $id, ')
          ..write('employeeId: $employeeId, ')
          ..write('employeeName: $employeeName, ')
          ..write('timestamp: $timestamp, ')
          ..write('status: $status, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $AttendanceRecordsTable attendanceRecords =
      $AttendanceRecordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [attendanceRecords];
}

typedef $$AttendanceRecordsTableInsertCompanionBuilder
    = AttendanceRecordsCompanion Function({
  Value<int> id,
  required String employeeId,
  required String employeeName,
  required DateTime timestamp,
  required String status,
  Value<bool> isSynced,
});
typedef $$AttendanceRecordsTableUpdateCompanionBuilder
    = AttendanceRecordsCompanion Function({
  Value<int> id,
  Value<String> employeeId,
  Value<String> employeeName,
  Value<DateTime> timestamp,
  Value<String> status,
  Value<bool> isSynced,
});

class $$AttendanceRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AttendanceRecordsTable,
    AttendanceRecord,
    $$AttendanceRecordsTableFilterComposer,
    $$AttendanceRecordsTableOrderingComposer,
    $$AttendanceRecordsTableProcessedTableManager,
    $$AttendanceRecordsTableInsertCompanionBuilder,
    $$AttendanceRecordsTableUpdateCompanionBuilder> {
  $$AttendanceRecordsTableTableManager(
      _$AppDatabase db, $AttendanceRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AttendanceRecordsTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$AttendanceRecordsTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$AttendanceRecordsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> employeeId = const Value.absent(),
            Value<String> employeeName = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
          }) =>
              AttendanceRecordsCompanion(
            id: id,
            employeeId: employeeId,
            employeeName: employeeName,
            timestamp: timestamp,
            status: status,
            isSynced: isSynced,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String employeeId,
            required String employeeName,
            required DateTime timestamp,
            required String status,
            Value<bool> isSynced = const Value.absent(),
          }) =>
              AttendanceRecordsCompanion.insert(
            id: id,
            employeeId: employeeId,
            employeeName: employeeName,
            timestamp: timestamp,
            status: status,
            isSynced: isSynced,
          ),
        ));
}

class $$AttendanceRecordsTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $AttendanceRecordsTable,
        AttendanceRecord,
        $$AttendanceRecordsTableFilterComposer,
        $$AttendanceRecordsTableOrderingComposer,
        $$AttendanceRecordsTableProcessedTableManager,
        $$AttendanceRecordsTableInsertCompanionBuilder,
        $$AttendanceRecordsTableUpdateCompanionBuilder> {
  $$AttendanceRecordsTableProcessedTableManager(super.$state);
}

class $$AttendanceRecordsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AttendanceRecordsTable> {
  $$AttendanceRecordsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get employeeId => $state.composableBuilder(
      column: $state.table.employeeId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get employeeName => $state.composableBuilder(
      column: $state.table.employeeName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isSynced => $state.composableBuilder(
      column: $state.table.isSynced,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AttendanceRecordsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AttendanceRecordsTable> {
  $$AttendanceRecordsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get employeeId => $state.composableBuilder(
      column: $state.table.employeeId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get employeeName => $state.composableBuilder(
      column: $state.table.employeeName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isSynced => $state.composableBuilder(
      column: $state.table.isSynced,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$AttendanceRecordsTableTableManager get attendanceRecords =>
      $$AttendanceRecordsTableTableManager(_db, _db.attendanceRecords);
}
