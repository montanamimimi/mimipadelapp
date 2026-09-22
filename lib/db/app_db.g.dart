// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $TournamentTableTable extends TournamentTable
    with TableInfo<$TournamentTableTable, TournamentTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TournamentTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courtsMeta = const VerificationMeta('courts');
  @override
  late final GeneratedColumn<int> courts = GeneratedColumn<int>(
    'courts',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pointsMeta = const VerificationMeta('points');
  @override
  late final GeneratedColumn<int> points = GeneratedColumn<int>(
    'points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _formatMeta = const VerificationMeta('format');
  @override
  late final GeneratedColumn<String> format = GeneratedColumn<String>(
    'format',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startedMeta = const VerificationMeta(
    'started',
  );
  @override
  late final GeneratedColumn<bool> started = GeneratedColumn<bool>(
    'started',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("started" IN (0, 1))',
    ),
  );
  static const VerificationMeta _finishedMeta = const VerificationMeta(
    'finished',
  );
  @override
  late final GeneratedColumn<bool> finished = GeneratedColumn<bool>(
    'finished',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("finished" IN (0, 1))',
    ),
  );
  static const VerificationMeta _mixerMeta = const VerificationMeta('mixer');
  @override
  late final GeneratedColumn<bool> mixer = GeneratedColumn<bool>(
    'mixer',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("mixer" IN (0, 1))',
    ),
  );
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
    'synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    courts,
    points,
    date,
    format,
    started,
    finished,
    mixer,
    synced,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tournament_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TournamentTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('courts')) {
      context.handle(
        _courtsMeta,
        courts.isAcceptableOrUnknown(data['courts']!, _courtsMeta),
      );
    } else if (isInserting) {
      context.missing(_courtsMeta);
    }
    if (data.containsKey('points')) {
      context.handle(
        _pointsMeta,
        points.isAcceptableOrUnknown(data['points']!, _pointsMeta),
      );
    } else if (isInserting) {
      context.missing(_pointsMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('format')) {
      context.handle(
        _formatMeta,
        format.isAcceptableOrUnknown(data['format']!, _formatMeta),
      );
    } else if (isInserting) {
      context.missing(_formatMeta);
    }
    if (data.containsKey('started')) {
      context.handle(
        _startedMeta,
        started.isAcceptableOrUnknown(data['started']!, _startedMeta),
      );
    } else if (isInserting) {
      context.missing(_startedMeta);
    }
    if (data.containsKey('finished')) {
      context.handle(
        _finishedMeta,
        finished.isAcceptableOrUnknown(data['finished']!, _finishedMeta),
      );
    } else if (isInserting) {
      context.missing(_finishedMeta);
    }
    if (data.containsKey('mixer')) {
      context.handle(
        _mixerMeta,
        mixer.isAcceptableOrUnknown(data['mixer']!, _mixerMeta),
      );
    } else if (isInserting) {
      context.missing(_mixerMeta);
    }
    if (data.containsKey('synced')) {
      context.handle(
        _syncedMeta,
        synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TournamentTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TournamentTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      courts: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}courts'],
      )!,
      points: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}points'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      format: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}format'],
      )!,
      started: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}started'],
      )!,
      finished: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}finished'],
      )!,
      mixer: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}mixer'],
      )!,
      synced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}synced'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $TournamentTableTable createAlias(String alias) {
    return $TournamentTableTable(attachedDatabase, alias);
  }
}

class TournamentTableData extends DataClass
    implements Insertable<TournamentTableData> {
  final String id;
  final String name;
  final int courts;
  final int points;
  final DateTime date;
  final String format;
  final bool started;
  final bool finished;
  final bool mixer;
  final bool synced;
  final DateTime createdAt;
  final DateTime updatedAt;
  const TournamentTableData({
    required this.id,
    required this.name,
    required this.courts,
    required this.points,
    required this.date,
    required this.format,
    required this.started,
    required this.finished,
    required this.mixer,
    required this.synced,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['courts'] = Variable<int>(courts);
    map['points'] = Variable<int>(points);
    map['date'] = Variable<DateTime>(date);
    map['format'] = Variable<String>(format);
    map['started'] = Variable<bool>(started);
    map['finished'] = Variable<bool>(finished);
    map['mixer'] = Variable<bool>(mixer);
    map['synced'] = Variable<bool>(synced);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TournamentTableCompanion toCompanion(bool nullToAbsent) {
    return TournamentTableCompanion(
      id: Value(id),
      name: Value(name),
      courts: Value(courts),
      points: Value(points),
      date: Value(date),
      format: Value(format),
      started: Value(started),
      finished: Value(finished),
      mixer: Value(mixer),
      synced: Value(synced),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TournamentTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TournamentTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      courts: serializer.fromJson<int>(json['courts']),
      points: serializer.fromJson<int>(json['points']),
      date: serializer.fromJson<DateTime>(json['date']),
      format: serializer.fromJson<String>(json['format']),
      started: serializer.fromJson<bool>(json['started']),
      finished: serializer.fromJson<bool>(json['finished']),
      mixer: serializer.fromJson<bool>(json['mixer']),
      synced: serializer.fromJson<bool>(json['synced']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'courts': serializer.toJson<int>(courts),
      'points': serializer.toJson<int>(points),
      'date': serializer.toJson<DateTime>(date),
      'format': serializer.toJson<String>(format),
      'started': serializer.toJson<bool>(started),
      'finished': serializer.toJson<bool>(finished),
      'mixer': serializer.toJson<bool>(mixer),
      'synced': serializer.toJson<bool>(synced),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TournamentTableData copyWith({
    String? id,
    String? name,
    int? courts,
    int? points,
    DateTime? date,
    String? format,
    bool? started,
    bool? finished,
    bool? mixer,
    bool? synced,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => TournamentTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    courts: courts ?? this.courts,
    points: points ?? this.points,
    date: date ?? this.date,
    format: format ?? this.format,
    started: started ?? this.started,
    finished: finished ?? this.finished,
    mixer: mixer ?? this.mixer,
    synced: synced ?? this.synced,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  TournamentTableData copyWithCompanion(TournamentTableCompanion data) {
    return TournamentTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      courts: data.courts.present ? data.courts.value : this.courts,
      points: data.points.present ? data.points.value : this.points,
      date: data.date.present ? data.date.value : this.date,
      format: data.format.present ? data.format.value : this.format,
      started: data.started.present ? data.started.value : this.started,
      finished: data.finished.present ? data.finished.value : this.finished,
      mixer: data.mixer.present ? data.mixer.value : this.mixer,
      synced: data.synced.present ? data.synced.value : this.synced,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TournamentTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('courts: $courts, ')
          ..write('points: $points, ')
          ..write('date: $date, ')
          ..write('format: $format, ')
          ..write('started: $started, ')
          ..write('finished: $finished, ')
          ..write('mixer: $mixer, ')
          ..write('synced: $synced, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    courts,
    points,
    date,
    format,
    started,
    finished,
    mixer,
    synced,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TournamentTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.courts == this.courts &&
          other.points == this.points &&
          other.date == this.date &&
          other.format == this.format &&
          other.started == this.started &&
          other.finished == this.finished &&
          other.mixer == this.mixer &&
          other.synced == this.synced &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TournamentTableCompanion extends UpdateCompanion<TournamentTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> courts;
  final Value<int> points;
  final Value<DateTime> date;
  final Value<String> format;
  final Value<bool> started;
  final Value<bool> finished;
  final Value<bool> mixer;
  final Value<bool> synced;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const TournamentTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.courts = const Value.absent(),
    this.points = const Value.absent(),
    this.date = const Value.absent(),
    this.format = const Value.absent(),
    this.started = const Value.absent(),
    this.finished = const Value.absent(),
    this.mixer = const Value.absent(),
    this.synced = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TournamentTableCompanion.insert({
    required String id,
    required String name,
    required int courts,
    required int points,
    required DateTime date,
    required String format,
    required bool started,
    required bool finished,
    required bool mixer,
    this.synced = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       courts = Value(courts),
       points = Value(points),
       date = Value(date),
       format = Value(format),
       started = Value(started),
       finished = Value(finished),
       mixer = Value(mixer),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<TournamentTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? courts,
    Expression<int>? points,
    Expression<DateTime>? date,
    Expression<String>? format,
    Expression<bool>? started,
    Expression<bool>? finished,
    Expression<bool>? mixer,
    Expression<bool>? synced,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (courts != null) 'courts': courts,
      if (points != null) 'points': points,
      if (date != null) 'date': date,
      if (format != null) 'format': format,
      if (started != null) 'started': started,
      if (finished != null) 'finished': finished,
      if (mixer != null) 'mixer': mixer,
      if (synced != null) 'synced': synced,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TournamentTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? courts,
    Value<int>? points,
    Value<DateTime>? date,
    Value<String>? format,
    Value<bool>? started,
    Value<bool>? finished,
    Value<bool>? mixer,
    Value<bool>? synced,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return TournamentTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      courts: courts ?? this.courts,
      points: points ?? this.points,
      date: date ?? this.date,
      format: format ?? this.format,
      started: started ?? this.started,
      finished: finished ?? this.finished,
      mixer: mixer ?? this.mixer,
      synced: synced ?? this.synced,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (courts.present) {
      map['courts'] = Variable<int>(courts.value);
    }
    if (points.present) {
      map['points'] = Variable<int>(points.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (format.present) {
      map['format'] = Variable<String>(format.value);
    }
    if (started.present) {
      map['started'] = Variable<bool>(started.value);
    }
    if (finished.present) {
      map['finished'] = Variable<bool>(finished.value);
    }
    if (mixer.present) {
      map['mixer'] = Variable<bool>(mixer.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TournamentTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('courts: $courts, ')
          ..write('points: $points, ')
          ..write('date: $date, ')
          ..write('format: $format, ')
          ..write('started: $started, ')
          ..write('finished: $finished, ')
          ..write('mixer: $mixer, ')
          ..write('synced: $synced, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TournamentPlayerTableTable extends TournamentPlayerTable
    with TableInfo<$TournamentPlayerTableTable, TournamentPlayerTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TournamentPlayerTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _playerIdMeta = const VerificationMeta(
    'playerId',
  );
  @override
  late final GeneratedColumn<String> playerId = GeneratedColumn<String>(
    'player_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tournamentIdMeta = const VerificationMeta(
    'tournamentId',
  );
  @override
  late final GeneratedColumn<String> tournamentId = GeneratedColumn<String>(
    'tournament_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, playerId, tournamentId, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tournament_player_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TournamentPlayerTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('player_id')) {
      context.handle(
        _playerIdMeta,
        playerId.isAcceptableOrUnknown(data['player_id']!, _playerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playerIdMeta);
    }
    if (data.containsKey('tournament_id')) {
      context.handle(
        _tournamentIdMeta,
        tournamentId.isAcceptableOrUnknown(
          data['tournament_id']!,
          _tournamentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tournamentIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TournamentPlayerTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TournamentPlayerTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      playerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}player_id'],
      )!,
      tournamentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tournament_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $TournamentPlayerTableTable createAlias(String alias) {
    return $TournamentPlayerTableTable(attachedDatabase, alias);
  }
}

class TournamentPlayerTableData extends DataClass
    implements Insertable<TournamentPlayerTableData> {
  final String id;
  final String playerId;
  final String tournamentId;
  final String name;
  const TournamentPlayerTableData({
    required this.id,
    required this.playerId,
    required this.tournamentId,
    required this.name,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['player_id'] = Variable<String>(playerId);
    map['tournament_id'] = Variable<String>(tournamentId);
    map['name'] = Variable<String>(name);
    return map;
  }

  TournamentPlayerTableCompanion toCompanion(bool nullToAbsent) {
    return TournamentPlayerTableCompanion(
      id: Value(id),
      playerId: Value(playerId),
      tournamentId: Value(tournamentId),
      name: Value(name),
    );
  }

  factory TournamentPlayerTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TournamentPlayerTableData(
      id: serializer.fromJson<String>(json['id']),
      playerId: serializer.fromJson<String>(json['playerId']),
      tournamentId: serializer.fromJson<String>(json['tournamentId']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'playerId': serializer.toJson<String>(playerId),
      'tournamentId': serializer.toJson<String>(tournamentId),
      'name': serializer.toJson<String>(name),
    };
  }

  TournamentPlayerTableData copyWith({
    String? id,
    String? playerId,
    String? tournamentId,
    String? name,
  }) => TournamentPlayerTableData(
    id: id ?? this.id,
    playerId: playerId ?? this.playerId,
    tournamentId: tournamentId ?? this.tournamentId,
    name: name ?? this.name,
  );
  TournamentPlayerTableData copyWithCompanion(
    TournamentPlayerTableCompanion data,
  ) {
    return TournamentPlayerTableData(
      id: data.id.present ? data.id.value : this.id,
      playerId: data.playerId.present ? data.playerId.value : this.playerId,
      tournamentId: data.tournamentId.present
          ? data.tournamentId.value
          : this.tournamentId,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TournamentPlayerTableData(')
          ..write('id: $id, ')
          ..write('playerId: $playerId, ')
          ..write('tournamentId: $tournamentId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, playerId, tournamentId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TournamentPlayerTableData &&
          other.id == this.id &&
          other.playerId == this.playerId &&
          other.tournamentId == this.tournamentId &&
          other.name == this.name);
}

class TournamentPlayerTableCompanion
    extends UpdateCompanion<TournamentPlayerTableData> {
  final Value<String> id;
  final Value<String> playerId;
  final Value<String> tournamentId;
  final Value<String> name;
  final Value<int> rowid;
  const TournamentPlayerTableCompanion({
    this.id = const Value.absent(),
    this.playerId = const Value.absent(),
    this.tournamentId = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TournamentPlayerTableCompanion.insert({
    required String id,
    required String playerId,
    required String tournamentId,
    required String name,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       playerId = Value(playerId),
       tournamentId = Value(tournamentId),
       name = Value(name);
  static Insertable<TournamentPlayerTableData> custom({
    Expression<String>? id,
    Expression<String>? playerId,
    Expression<String>? tournamentId,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playerId != null) 'player_id': playerId,
      if (tournamentId != null) 'tournament_id': tournamentId,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TournamentPlayerTableCompanion copyWith({
    Value<String>? id,
    Value<String>? playerId,
    Value<String>? tournamentId,
    Value<String>? name,
    Value<int>? rowid,
  }) {
    return TournamentPlayerTableCompanion(
      id: id ?? this.id,
      playerId: playerId ?? this.playerId,
      tournamentId: tournamentId ?? this.tournamentId,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (playerId.present) {
      map['player_id'] = Variable<String>(playerId.value);
    }
    if (tournamentId.present) {
      map['tournament_id'] = Variable<String>(tournamentId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TournamentPlayerTableCompanion(')
          ..write('id: $id, ')
          ..write('playerId: $playerId, ')
          ..write('tournamentId: $tournamentId, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TournamentGameTableTable extends TournamentGameTable
    with TableInfo<$TournamentGameTableTable, TournamentGameTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TournamentGameTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roundMeta = const VerificationMeta('round');
  @override
  late final GeneratedColumn<int> round = GeneratedColumn<int>(
    'round',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tournamentIdMeta = const VerificationMeta(
    'tournamentId',
  );
  @override
  late final GeneratedColumn<String> tournamentId = GeneratedColumn<String>(
    'tournament_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _side1Player1IdMeta = const VerificationMeta(
    'side1Player1Id',
  );
  @override
  late final GeneratedColumn<String> side1Player1Id = GeneratedColumn<String>(
    'side1_player1_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _side1Player2IdMeta = const VerificationMeta(
    'side1Player2Id',
  );
  @override
  late final GeneratedColumn<String> side1Player2Id = GeneratedColumn<String>(
    'side1_player2_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _side2Player1IdMeta = const VerificationMeta(
    'side2Player1Id',
  );
  @override
  late final GeneratedColumn<String> side2Player1Id = GeneratedColumn<String>(
    'side2_player1_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _side2Player2IdMeta = const VerificationMeta(
    'side2Player2Id',
  );
  @override
  late final GeneratedColumn<String> side2Player2Id = GeneratedColumn<String>(
    'side2_player2_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _side1ScoreMeta = const VerificationMeta(
    'side1Score',
  );
  @override
  late final GeneratedColumn<int> side1Score = GeneratedColumn<int>(
    'side1_score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _side2ScoreMeta = const VerificationMeta(
    'side2Score',
  );
  @override
  late final GeneratedColumn<int> side2Score = GeneratedColumn<int>(
    'side2_score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    round,
    tournamentId,
    side1Player1Id,
    side1Player2Id,
    side2Player1Id,
    side2Player2Id,
    side1Score,
    side2Score,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tournament_game_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TournamentGameTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('round')) {
      context.handle(
        _roundMeta,
        round.isAcceptableOrUnknown(data['round']!, _roundMeta),
      );
    } else if (isInserting) {
      context.missing(_roundMeta);
    }
    if (data.containsKey('tournament_id')) {
      context.handle(
        _tournamentIdMeta,
        tournamentId.isAcceptableOrUnknown(
          data['tournament_id']!,
          _tournamentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tournamentIdMeta);
    }
    if (data.containsKey('side1_player1_id')) {
      context.handle(
        _side1Player1IdMeta,
        side1Player1Id.isAcceptableOrUnknown(
          data['side1_player1_id']!,
          _side1Player1IdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_side1Player1IdMeta);
    }
    if (data.containsKey('side1_player2_id')) {
      context.handle(
        _side1Player2IdMeta,
        side1Player2Id.isAcceptableOrUnknown(
          data['side1_player2_id']!,
          _side1Player2IdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_side1Player2IdMeta);
    }
    if (data.containsKey('side2_player1_id')) {
      context.handle(
        _side2Player1IdMeta,
        side2Player1Id.isAcceptableOrUnknown(
          data['side2_player1_id']!,
          _side2Player1IdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_side2Player1IdMeta);
    }
    if (data.containsKey('side2_player2_id')) {
      context.handle(
        _side2Player2IdMeta,
        side2Player2Id.isAcceptableOrUnknown(
          data['side2_player2_id']!,
          _side2Player2IdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_side2Player2IdMeta);
    }
    if (data.containsKey('side1_score')) {
      context.handle(
        _side1ScoreMeta,
        side1Score.isAcceptableOrUnknown(data['side1_score']!, _side1ScoreMeta),
      );
    } else if (isInserting) {
      context.missing(_side1ScoreMeta);
    }
    if (data.containsKey('side2_score')) {
      context.handle(
        _side2ScoreMeta,
        side2Score.isAcceptableOrUnknown(data['side2_score']!, _side2ScoreMeta),
      );
    } else if (isInserting) {
      context.missing(_side2ScoreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TournamentGameTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TournamentGameTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      round: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}round'],
      )!,
      tournamentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tournament_id'],
      )!,
      side1Player1Id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}side1_player1_id'],
      )!,
      side1Player2Id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}side1_player2_id'],
      )!,
      side2Player1Id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}side2_player1_id'],
      )!,
      side2Player2Id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}side2_player2_id'],
      )!,
      side1Score: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}side1_score'],
      )!,
      side2Score: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}side2_score'],
      )!,
    );
  }

  @override
  $TournamentGameTableTable createAlias(String alias) {
    return $TournamentGameTableTable(attachedDatabase, alias);
  }
}

class TournamentGameTableData extends DataClass
    implements Insertable<TournamentGameTableData> {
  final String id;
  final int round;
  final String tournamentId;
  final String side1Player1Id;
  final String side1Player2Id;
  final String side2Player1Id;
  final String side2Player2Id;
  final int side1Score;
  final int side2Score;
  const TournamentGameTableData({
    required this.id,
    required this.round,
    required this.tournamentId,
    required this.side1Player1Id,
    required this.side1Player2Id,
    required this.side2Player1Id,
    required this.side2Player2Id,
    required this.side1Score,
    required this.side2Score,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['round'] = Variable<int>(round);
    map['tournament_id'] = Variable<String>(tournamentId);
    map['side1_player1_id'] = Variable<String>(side1Player1Id);
    map['side1_player2_id'] = Variable<String>(side1Player2Id);
    map['side2_player1_id'] = Variable<String>(side2Player1Id);
    map['side2_player2_id'] = Variable<String>(side2Player2Id);
    map['side1_score'] = Variable<int>(side1Score);
    map['side2_score'] = Variable<int>(side2Score);
    return map;
  }

  TournamentGameTableCompanion toCompanion(bool nullToAbsent) {
    return TournamentGameTableCompanion(
      id: Value(id),
      round: Value(round),
      tournamentId: Value(tournamentId),
      side1Player1Id: Value(side1Player1Id),
      side1Player2Id: Value(side1Player2Id),
      side2Player1Id: Value(side2Player1Id),
      side2Player2Id: Value(side2Player2Id),
      side1Score: Value(side1Score),
      side2Score: Value(side2Score),
    );
  }

  factory TournamentGameTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TournamentGameTableData(
      id: serializer.fromJson<String>(json['id']),
      round: serializer.fromJson<int>(json['round']),
      tournamentId: serializer.fromJson<String>(json['tournamentId']),
      side1Player1Id: serializer.fromJson<String>(json['side1Player1Id']),
      side1Player2Id: serializer.fromJson<String>(json['side1Player2Id']),
      side2Player1Id: serializer.fromJson<String>(json['side2Player1Id']),
      side2Player2Id: serializer.fromJson<String>(json['side2Player2Id']),
      side1Score: serializer.fromJson<int>(json['side1Score']),
      side2Score: serializer.fromJson<int>(json['side2Score']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'round': serializer.toJson<int>(round),
      'tournamentId': serializer.toJson<String>(tournamentId),
      'side1Player1Id': serializer.toJson<String>(side1Player1Id),
      'side1Player2Id': serializer.toJson<String>(side1Player2Id),
      'side2Player1Id': serializer.toJson<String>(side2Player1Id),
      'side2Player2Id': serializer.toJson<String>(side2Player2Id),
      'side1Score': serializer.toJson<int>(side1Score),
      'side2Score': serializer.toJson<int>(side2Score),
    };
  }

  TournamentGameTableData copyWith({
    String? id,
    int? round,
    String? tournamentId,
    String? side1Player1Id,
    String? side1Player2Id,
    String? side2Player1Id,
    String? side2Player2Id,
    int? side1Score,
    int? side2Score,
  }) => TournamentGameTableData(
    id: id ?? this.id,
    round: round ?? this.round,
    tournamentId: tournamentId ?? this.tournamentId,
    side1Player1Id: side1Player1Id ?? this.side1Player1Id,
    side1Player2Id: side1Player2Id ?? this.side1Player2Id,
    side2Player1Id: side2Player1Id ?? this.side2Player1Id,
    side2Player2Id: side2Player2Id ?? this.side2Player2Id,
    side1Score: side1Score ?? this.side1Score,
    side2Score: side2Score ?? this.side2Score,
  );
  TournamentGameTableData copyWithCompanion(TournamentGameTableCompanion data) {
    return TournamentGameTableData(
      id: data.id.present ? data.id.value : this.id,
      round: data.round.present ? data.round.value : this.round,
      tournamentId: data.tournamentId.present
          ? data.tournamentId.value
          : this.tournamentId,
      side1Player1Id: data.side1Player1Id.present
          ? data.side1Player1Id.value
          : this.side1Player1Id,
      side1Player2Id: data.side1Player2Id.present
          ? data.side1Player2Id.value
          : this.side1Player2Id,
      side2Player1Id: data.side2Player1Id.present
          ? data.side2Player1Id.value
          : this.side2Player1Id,
      side2Player2Id: data.side2Player2Id.present
          ? data.side2Player2Id.value
          : this.side2Player2Id,
      side1Score: data.side1Score.present
          ? data.side1Score.value
          : this.side1Score,
      side2Score: data.side2Score.present
          ? data.side2Score.value
          : this.side2Score,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TournamentGameTableData(')
          ..write('id: $id, ')
          ..write('round: $round, ')
          ..write('tournamentId: $tournamentId, ')
          ..write('side1Player1Id: $side1Player1Id, ')
          ..write('side1Player2Id: $side1Player2Id, ')
          ..write('side2Player1Id: $side2Player1Id, ')
          ..write('side2Player2Id: $side2Player2Id, ')
          ..write('side1Score: $side1Score, ')
          ..write('side2Score: $side2Score')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    round,
    tournamentId,
    side1Player1Id,
    side1Player2Id,
    side2Player1Id,
    side2Player2Id,
    side1Score,
    side2Score,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TournamentGameTableData &&
          other.id == this.id &&
          other.round == this.round &&
          other.tournamentId == this.tournamentId &&
          other.side1Player1Id == this.side1Player1Id &&
          other.side1Player2Id == this.side1Player2Id &&
          other.side2Player1Id == this.side2Player1Id &&
          other.side2Player2Id == this.side2Player2Id &&
          other.side1Score == this.side1Score &&
          other.side2Score == this.side2Score);
}

class TournamentGameTableCompanion
    extends UpdateCompanion<TournamentGameTableData> {
  final Value<String> id;
  final Value<int> round;
  final Value<String> tournamentId;
  final Value<String> side1Player1Id;
  final Value<String> side1Player2Id;
  final Value<String> side2Player1Id;
  final Value<String> side2Player2Id;
  final Value<int> side1Score;
  final Value<int> side2Score;
  final Value<int> rowid;
  const TournamentGameTableCompanion({
    this.id = const Value.absent(),
    this.round = const Value.absent(),
    this.tournamentId = const Value.absent(),
    this.side1Player1Id = const Value.absent(),
    this.side1Player2Id = const Value.absent(),
    this.side2Player1Id = const Value.absent(),
    this.side2Player2Id = const Value.absent(),
    this.side1Score = const Value.absent(),
    this.side2Score = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TournamentGameTableCompanion.insert({
    required String id,
    required int round,
    required String tournamentId,
    required String side1Player1Id,
    required String side1Player2Id,
    required String side2Player1Id,
    required String side2Player2Id,
    required int side1Score,
    required int side2Score,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       round = Value(round),
       tournamentId = Value(tournamentId),
       side1Player1Id = Value(side1Player1Id),
       side1Player2Id = Value(side1Player2Id),
       side2Player1Id = Value(side2Player1Id),
       side2Player2Id = Value(side2Player2Id),
       side1Score = Value(side1Score),
       side2Score = Value(side2Score);
  static Insertable<TournamentGameTableData> custom({
    Expression<String>? id,
    Expression<int>? round,
    Expression<String>? tournamentId,
    Expression<String>? side1Player1Id,
    Expression<String>? side1Player2Id,
    Expression<String>? side2Player1Id,
    Expression<String>? side2Player2Id,
    Expression<int>? side1Score,
    Expression<int>? side2Score,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (round != null) 'round': round,
      if (tournamentId != null) 'tournament_id': tournamentId,
      if (side1Player1Id != null) 'side1_player1_id': side1Player1Id,
      if (side1Player2Id != null) 'side1_player2_id': side1Player2Id,
      if (side2Player1Id != null) 'side2_player1_id': side2Player1Id,
      if (side2Player2Id != null) 'side2_player2_id': side2Player2Id,
      if (side1Score != null) 'side1_score': side1Score,
      if (side2Score != null) 'side2_score': side2Score,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TournamentGameTableCompanion copyWith({
    Value<String>? id,
    Value<int>? round,
    Value<String>? tournamentId,
    Value<String>? side1Player1Id,
    Value<String>? side1Player2Id,
    Value<String>? side2Player1Id,
    Value<String>? side2Player2Id,
    Value<int>? side1Score,
    Value<int>? side2Score,
    Value<int>? rowid,
  }) {
    return TournamentGameTableCompanion(
      id: id ?? this.id,
      round: round ?? this.round,
      tournamentId: tournamentId ?? this.tournamentId,
      side1Player1Id: side1Player1Id ?? this.side1Player1Id,
      side1Player2Id: side1Player2Id ?? this.side1Player2Id,
      side2Player1Id: side2Player1Id ?? this.side2Player1Id,
      side2Player2Id: side2Player2Id ?? this.side2Player2Id,
      side1Score: side1Score ?? this.side1Score,
      side2Score: side2Score ?? this.side2Score,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (round.present) {
      map['round'] = Variable<int>(round.value);
    }
    if (tournamentId.present) {
      map['tournament_id'] = Variable<String>(tournamentId.value);
    }
    if (side1Player1Id.present) {
      map['side1_player1_id'] = Variable<String>(side1Player1Id.value);
    }
    if (side1Player2Id.present) {
      map['side1_player2_id'] = Variable<String>(side1Player2Id.value);
    }
    if (side2Player1Id.present) {
      map['side2_player1_id'] = Variable<String>(side2Player1Id.value);
    }
    if (side2Player2Id.present) {
      map['side2_player2_id'] = Variable<String>(side2Player2Id.value);
    }
    if (side1Score.present) {
      map['side1_score'] = Variable<int>(side1Score.value);
    }
    if (side2Score.present) {
      map['side2_score'] = Variable<int>(side2Score.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TournamentGameTableCompanion(')
          ..write('id: $id, ')
          ..write('round: $round, ')
          ..write('tournamentId: $tournamentId, ')
          ..write('side1Player1Id: $side1Player1Id, ')
          ..write('side1Player2Id: $side1Player2Id, ')
          ..write('side2Player1Id: $side2Player1Id, ')
          ..write('side2Player2Id: $side2Player2Id, ')
          ..write('side1Score: $side1Score, ')
          ..write('side2Score: $side2Score, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlayerTableTable extends PlayerTable
    with TableInfo<$PlayerTableTable, PlayerTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayerTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'player_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlayerTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlayerTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlayerTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $PlayerTableTable createAlias(String alias) {
    return $PlayerTableTable(attachedDatabase, alias);
  }
}

class PlayerTableData extends DataClass implements Insertable<PlayerTableData> {
  final String id;
  final String userId;
  final String name;
  const PlayerTableData({
    required this.id,
    required this.userId,
    required this.name,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['name'] = Variable<String>(name);
    return map;
  }

  PlayerTableCompanion toCompanion(bool nullToAbsent) {
    return PlayerTableCompanion(
      id: Value(id),
      userId: Value(userId),
      name: Value(name),
    );
  }

  factory PlayerTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlayerTableData(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'name': serializer.toJson<String>(name),
    };
  }

  PlayerTableData copyWith({String? id, String? userId, String? name}) =>
      PlayerTableData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        name: name ?? this.name,
      );
  PlayerTableData copyWithCompanion(PlayerTableCompanion data) {
    return PlayerTableData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlayerTableData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlayerTableData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name);
}

class PlayerTableCompanion extends UpdateCompanion<PlayerTableData> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> name;
  final Value<int> rowid;
  const PlayerTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlayerTableCompanion.insert({
    required String id,
    required String userId,
    required String name,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       name = Value(name);
  static Insertable<PlayerTableData> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlayerTableCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? name,
    Value<int>? rowid,
  }) {
    return PlayerTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayerTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TournamentTableTable tournamentTable = $TournamentTableTable(
    this,
  );
  late final $TournamentPlayerTableTable tournamentPlayerTable =
      $TournamentPlayerTableTable(this);
  late final $TournamentGameTableTable tournamentGameTable =
      $TournamentGameTableTable(this);
  late final $PlayerTableTable playerTable = $PlayerTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    tournamentTable,
    tournamentPlayerTable,
    tournamentGameTable,
    playerTable,
  ];
}

typedef $$TournamentTableTableCreateCompanionBuilder =
    TournamentTableCompanion Function({
      required String id,
      required String name,
      required int courts,
      required int points,
      required DateTime date,
      required String format,
      required bool started,
      required bool finished,
      required bool mixer,
      Value<bool> synced,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$TournamentTableTableUpdateCompanionBuilder =
    TournamentTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> courts,
      Value<int> points,
      Value<DateTime> date,
      Value<String> format,
      Value<bool> started,
      Value<bool> finished,
      Value<bool> mixer,
      Value<bool> synced,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$TournamentTableTableFilterComposer
    extends Composer<_$AppDatabase, $TournamentTableTable> {
  $$TournamentTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get courts => $composableBuilder(
    column: $table.courts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get points => $composableBuilder(
    column: $table.points,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get format => $composableBuilder(
    column: $table.format,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get started => $composableBuilder(
    column: $table.started,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get finished => $composableBuilder(
    column: $table.finished,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get mixer => $composableBuilder(
    column: $table.mixer,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get synced => $composableBuilder(
    column: $table.synced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TournamentTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TournamentTableTable> {
  $$TournamentTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get courts => $composableBuilder(
    column: $table.courts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get points => $composableBuilder(
    column: $table.points,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get format => $composableBuilder(
    column: $table.format,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get started => $composableBuilder(
    column: $table.started,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get finished => $composableBuilder(
    column: $table.finished,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get mixer => $composableBuilder(
    column: $table.mixer,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get synced => $composableBuilder(
    column: $table.synced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TournamentTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TournamentTableTable> {
  $$TournamentTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get courts =>
      $composableBuilder(column: $table.courts, builder: (column) => column);

  GeneratedColumn<int> get points =>
      $composableBuilder(column: $table.points, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get format =>
      $composableBuilder(column: $table.format, builder: (column) => column);

  GeneratedColumn<bool> get started =>
      $composableBuilder(column: $table.started, builder: (column) => column);

  GeneratedColumn<bool> get finished =>
      $composableBuilder(column: $table.finished, builder: (column) => column);

  GeneratedColumn<bool> get mixer =>
      $composableBuilder(column: $table.mixer, builder: (column) => column);

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$TournamentTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TournamentTableTable,
          TournamentTableData,
          $$TournamentTableTableFilterComposer,
          $$TournamentTableTableOrderingComposer,
          $$TournamentTableTableAnnotationComposer,
          $$TournamentTableTableCreateCompanionBuilder,
          $$TournamentTableTableUpdateCompanionBuilder,
          (
            TournamentTableData,
            BaseReferences<
              _$AppDatabase,
              $TournamentTableTable,
              TournamentTableData
            >,
          ),
          TournamentTableData,
          PrefetchHooks Function()
        > {
  $$TournamentTableTableTableManager(
    _$AppDatabase db,
    $TournamentTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TournamentTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TournamentTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TournamentTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> courts = const Value.absent(),
                Value<int> points = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> format = const Value.absent(),
                Value<bool> started = const Value.absent(),
                Value<bool> finished = const Value.absent(),
                Value<bool> mixer = const Value.absent(),
                Value<bool> synced = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TournamentTableCompanion(
                id: id,
                name: name,
                courts: courts,
                points: points,
                date: date,
                format: format,
                started: started,
                finished: finished,
                mixer: mixer,
                synced: synced,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required int courts,
                required int points,
                required DateTime date,
                required String format,
                required bool started,
                required bool finished,
                required bool mixer,
                Value<bool> synced = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => TournamentTableCompanion.insert(
                id: id,
                name: name,
                courts: courts,
                points: points,
                date: date,
                format: format,
                started: started,
                finished: finished,
                mixer: mixer,
                synced: synced,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TournamentTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TournamentTableTable,
      TournamentTableData,
      $$TournamentTableTableFilterComposer,
      $$TournamentTableTableOrderingComposer,
      $$TournamentTableTableAnnotationComposer,
      $$TournamentTableTableCreateCompanionBuilder,
      $$TournamentTableTableUpdateCompanionBuilder,
      (
        TournamentTableData,
        BaseReferences<
          _$AppDatabase,
          $TournamentTableTable,
          TournamentTableData
        >,
      ),
      TournamentTableData,
      PrefetchHooks Function()
    >;
typedef $$TournamentPlayerTableTableCreateCompanionBuilder =
    TournamentPlayerTableCompanion Function({
      required String id,
      required String playerId,
      required String tournamentId,
      required String name,
      Value<int> rowid,
    });
typedef $$TournamentPlayerTableTableUpdateCompanionBuilder =
    TournamentPlayerTableCompanion Function({
      Value<String> id,
      Value<String> playerId,
      Value<String> tournamentId,
      Value<String> name,
      Value<int> rowid,
    });

class $$TournamentPlayerTableTableFilterComposer
    extends Composer<_$AppDatabase, $TournamentPlayerTableTable> {
  $$TournamentPlayerTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get playerId => $composableBuilder(
    column: $table.playerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tournamentId => $composableBuilder(
    column: $table.tournamentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TournamentPlayerTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TournamentPlayerTableTable> {
  $$TournamentPlayerTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get playerId => $composableBuilder(
    column: $table.playerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tournamentId => $composableBuilder(
    column: $table.tournamentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TournamentPlayerTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TournamentPlayerTableTable> {
  $$TournamentPlayerTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get playerId =>
      $composableBuilder(column: $table.playerId, builder: (column) => column);

  GeneratedColumn<String> get tournamentId => $composableBuilder(
    column: $table.tournamentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$TournamentPlayerTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TournamentPlayerTableTable,
          TournamentPlayerTableData,
          $$TournamentPlayerTableTableFilterComposer,
          $$TournamentPlayerTableTableOrderingComposer,
          $$TournamentPlayerTableTableAnnotationComposer,
          $$TournamentPlayerTableTableCreateCompanionBuilder,
          $$TournamentPlayerTableTableUpdateCompanionBuilder,
          (
            TournamentPlayerTableData,
            BaseReferences<
              _$AppDatabase,
              $TournamentPlayerTableTable,
              TournamentPlayerTableData
            >,
          ),
          TournamentPlayerTableData,
          PrefetchHooks Function()
        > {
  $$TournamentPlayerTableTableTableManager(
    _$AppDatabase db,
    $TournamentPlayerTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TournamentPlayerTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$TournamentPlayerTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TournamentPlayerTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> playerId = const Value.absent(),
                Value<String> tournamentId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TournamentPlayerTableCompanion(
                id: id,
                playerId: playerId,
                tournamentId: tournamentId,
                name: name,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String playerId,
                required String tournamentId,
                required String name,
                Value<int> rowid = const Value.absent(),
              }) => TournamentPlayerTableCompanion.insert(
                id: id,
                playerId: playerId,
                tournamentId: tournamentId,
                name: name,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TournamentPlayerTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TournamentPlayerTableTable,
      TournamentPlayerTableData,
      $$TournamentPlayerTableTableFilterComposer,
      $$TournamentPlayerTableTableOrderingComposer,
      $$TournamentPlayerTableTableAnnotationComposer,
      $$TournamentPlayerTableTableCreateCompanionBuilder,
      $$TournamentPlayerTableTableUpdateCompanionBuilder,
      (
        TournamentPlayerTableData,
        BaseReferences<
          _$AppDatabase,
          $TournamentPlayerTableTable,
          TournamentPlayerTableData
        >,
      ),
      TournamentPlayerTableData,
      PrefetchHooks Function()
    >;
typedef $$TournamentGameTableTableCreateCompanionBuilder =
    TournamentGameTableCompanion Function({
      required String id,
      required int round,
      required String tournamentId,
      required String side1Player1Id,
      required String side1Player2Id,
      required String side2Player1Id,
      required String side2Player2Id,
      required int side1Score,
      required int side2Score,
      Value<int> rowid,
    });
typedef $$TournamentGameTableTableUpdateCompanionBuilder =
    TournamentGameTableCompanion Function({
      Value<String> id,
      Value<int> round,
      Value<String> tournamentId,
      Value<String> side1Player1Id,
      Value<String> side1Player2Id,
      Value<String> side2Player1Id,
      Value<String> side2Player2Id,
      Value<int> side1Score,
      Value<int> side2Score,
      Value<int> rowid,
    });

class $$TournamentGameTableTableFilterComposer
    extends Composer<_$AppDatabase, $TournamentGameTableTable> {
  $$TournamentGameTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get round => $composableBuilder(
    column: $table.round,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tournamentId => $composableBuilder(
    column: $table.tournamentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get side1Player1Id => $composableBuilder(
    column: $table.side1Player1Id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get side1Player2Id => $composableBuilder(
    column: $table.side1Player2Id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get side2Player1Id => $composableBuilder(
    column: $table.side2Player1Id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get side2Player2Id => $composableBuilder(
    column: $table.side2Player2Id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get side1Score => $composableBuilder(
    column: $table.side1Score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get side2Score => $composableBuilder(
    column: $table.side2Score,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TournamentGameTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TournamentGameTableTable> {
  $$TournamentGameTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get round => $composableBuilder(
    column: $table.round,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tournamentId => $composableBuilder(
    column: $table.tournamentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get side1Player1Id => $composableBuilder(
    column: $table.side1Player1Id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get side1Player2Id => $composableBuilder(
    column: $table.side1Player2Id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get side2Player1Id => $composableBuilder(
    column: $table.side2Player1Id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get side2Player2Id => $composableBuilder(
    column: $table.side2Player2Id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get side1Score => $composableBuilder(
    column: $table.side1Score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get side2Score => $composableBuilder(
    column: $table.side2Score,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TournamentGameTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TournamentGameTableTable> {
  $$TournamentGameTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get round =>
      $composableBuilder(column: $table.round, builder: (column) => column);

  GeneratedColumn<String> get tournamentId => $composableBuilder(
    column: $table.tournamentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get side1Player1Id => $composableBuilder(
    column: $table.side1Player1Id,
    builder: (column) => column,
  );

  GeneratedColumn<String> get side1Player2Id => $composableBuilder(
    column: $table.side1Player2Id,
    builder: (column) => column,
  );

  GeneratedColumn<String> get side2Player1Id => $composableBuilder(
    column: $table.side2Player1Id,
    builder: (column) => column,
  );

  GeneratedColumn<String> get side2Player2Id => $composableBuilder(
    column: $table.side2Player2Id,
    builder: (column) => column,
  );

  GeneratedColumn<int> get side1Score => $composableBuilder(
    column: $table.side1Score,
    builder: (column) => column,
  );

  GeneratedColumn<int> get side2Score => $composableBuilder(
    column: $table.side2Score,
    builder: (column) => column,
  );
}

class $$TournamentGameTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TournamentGameTableTable,
          TournamentGameTableData,
          $$TournamentGameTableTableFilterComposer,
          $$TournamentGameTableTableOrderingComposer,
          $$TournamentGameTableTableAnnotationComposer,
          $$TournamentGameTableTableCreateCompanionBuilder,
          $$TournamentGameTableTableUpdateCompanionBuilder,
          (
            TournamentGameTableData,
            BaseReferences<
              _$AppDatabase,
              $TournamentGameTableTable,
              TournamentGameTableData
            >,
          ),
          TournamentGameTableData,
          PrefetchHooks Function()
        > {
  $$TournamentGameTableTableTableManager(
    _$AppDatabase db,
    $TournamentGameTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TournamentGameTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TournamentGameTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TournamentGameTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> round = const Value.absent(),
                Value<String> tournamentId = const Value.absent(),
                Value<String> side1Player1Id = const Value.absent(),
                Value<String> side1Player2Id = const Value.absent(),
                Value<String> side2Player1Id = const Value.absent(),
                Value<String> side2Player2Id = const Value.absent(),
                Value<int> side1Score = const Value.absent(),
                Value<int> side2Score = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TournamentGameTableCompanion(
                id: id,
                round: round,
                tournamentId: tournamentId,
                side1Player1Id: side1Player1Id,
                side1Player2Id: side1Player2Id,
                side2Player1Id: side2Player1Id,
                side2Player2Id: side2Player2Id,
                side1Score: side1Score,
                side2Score: side2Score,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int round,
                required String tournamentId,
                required String side1Player1Id,
                required String side1Player2Id,
                required String side2Player1Id,
                required String side2Player2Id,
                required int side1Score,
                required int side2Score,
                Value<int> rowid = const Value.absent(),
              }) => TournamentGameTableCompanion.insert(
                id: id,
                round: round,
                tournamentId: tournamentId,
                side1Player1Id: side1Player1Id,
                side1Player2Id: side1Player2Id,
                side2Player1Id: side2Player1Id,
                side2Player2Id: side2Player2Id,
                side1Score: side1Score,
                side2Score: side2Score,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TournamentGameTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TournamentGameTableTable,
      TournamentGameTableData,
      $$TournamentGameTableTableFilterComposer,
      $$TournamentGameTableTableOrderingComposer,
      $$TournamentGameTableTableAnnotationComposer,
      $$TournamentGameTableTableCreateCompanionBuilder,
      $$TournamentGameTableTableUpdateCompanionBuilder,
      (
        TournamentGameTableData,
        BaseReferences<
          _$AppDatabase,
          $TournamentGameTableTable,
          TournamentGameTableData
        >,
      ),
      TournamentGameTableData,
      PrefetchHooks Function()
    >;
typedef $$PlayerTableTableCreateCompanionBuilder =
    PlayerTableCompanion Function({
      required String id,
      required String userId,
      required String name,
      Value<int> rowid,
    });
typedef $$PlayerTableTableUpdateCompanionBuilder =
    PlayerTableCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> name,
      Value<int> rowid,
    });

class $$PlayerTableTableFilterComposer
    extends Composer<_$AppDatabase, $PlayerTableTable> {
  $$PlayerTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlayerTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PlayerTableTable> {
  $$PlayerTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlayerTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlayerTableTable> {
  $$PlayerTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$PlayerTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlayerTableTable,
          PlayerTableData,
          $$PlayerTableTableFilterComposer,
          $$PlayerTableTableOrderingComposer,
          $$PlayerTableTableAnnotationComposer,
          $$PlayerTableTableCreateCompanionBuilder,
          $$PlayerTableTableUpdateCompanionBuilder,
          (
            PlayerTableData,
            BaseReferences<_$AppDatabase, $PlayerTableTable, PlayerTableData>,
          ),
          PlayerTableData,
          PrefetchHooks Function()
        > {
  $$PlayerTableTableTableManager(_$AppDatabase db, $PlayerTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlayerTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlayerTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlayerTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlayerTableCompanion(
                id: id,
                userId: userId,
                name: name,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String name,
                Value<int> rowid = const Value.absent(),
              }) => PlayerTableCompanion.insert(
                id: id,
                userId: userId,
                name: name,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlayerTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlayerTableTable,
      PlayerTableData,
      $$PlayerTableTableFilterComposer,
      $$PlayerTableTableOrderingComposer,
      $$PlayerTableTableAnnotationComposer,
      $$PlayerTableTableCreateCompanionBuilder,
      $$PlayerTableTableUpdateCompanionBuilder,
      (
        PlayerTableData,
        BaseReferences<_$AppDatabase, $PlayerTableTable, PlayerTableData>,
      ),
      PlayerTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TournamentTableTableTableManager get tournamentTable =>
      $$TournamentTableTableTableManager(_db, _db.tournamentTable);
  $$TournamentPlayerTableTableTableManager get tournamentPlayerTable =>
      $$TournamentPlayerTableTableTableManager(_db, _db.tournamentPlayerTable);
  $$TournamentGameTableTableTableManager get tournamentGameTable =>
      $$TournamentGameTableTableTableManager(_db, _db.tournamentGameTable);
  $$PlayerTableTableTableManager get playerTable =>
      $$PlayerTableTableTableManager(_db, _db.playerTable);
}
