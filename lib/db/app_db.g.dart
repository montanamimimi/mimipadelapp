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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    courts,
    points,
    date,
    started,
    finished,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TournamentTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TournamentTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
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
      started: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}started'],
      )!,
      finished: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}finished'],
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
  final int id;
  final String name;
  final int courts;
  final int points;
  final DateTime date;
  final bool started;
  final bool finished;
  const TournamentTableData({
    required this.id,
    required this.name,
    required this.courts,
    required this.points,
    required this.date,
    required this.started,
    required this.finished,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['courts'] = Variable<int>(courts);
    map['points'] = Variable<int>(points);
    map['date'] = Variable<DateTime>(date);
    map['started'] = Variable<bool>(started);
    map['finished'] = Variable<bool>(finished);
    return map;
  }

  TournamentTableCompanion toCompanion(bool nullToAbsent) {
    return TournamentTableCompanion(
      id: Value(id),
      name: Value(name),
      courts: Value(courts),
      points: Value(points),
      date: Value(date),
      started: Value(started),
      finished: Value(finished),
    );
  }

  factory TournamentTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TournamentTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      courts: serializer.fromJson<int>(json['courts']),
      points: serializer.fromJson<int>(json['points']),
      date: serializer.fromJson<DateTime>(json['date']),
      started: serializer.fromJson<bool>(json['started']),
      finished: serializer.fromJson<bool>(json['finished']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'courts': serializer.toJson<int>(courts),
      'points': serializer.toJson<int>(points),
      'date': serializer.toJson<DateTime>(date),
      'started': serializer.toJson<bool>(started),
      'finished': serializer.toJson<bool>(finished),
    };
  }

  TournamentTableData copyWith({
    int? id,
    String? name,
    int? courts,
    int? points,
    DateTime? date,
    bool? started,
    bool? finished,
  }) => TournamentTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    courts: courts ?? this.courts,
    points: points ?? this.points,
    date: date ?? this.date,
    started: started ?? this.started,
    finished: finished ?? this.finished,
  );
  TournamentTableData copyWithCompanion(TournamentTableCompanion data) {
    return TournamentTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      courts: data.courts.present ? data.courts.value : this.courts,
      points: data.points.present ? data.points.value : this.points,
      date: data.date.present ? data.date.value : this.date,
      started: data.started.present ? data.started.value : this.started,
      finished: data.finished.present ? data.finished.value : this.finished,
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
          ..write('started: $started, ')
          ..write('finished: $finished')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, courts, points, date, started, finished);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TournamentTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.courts == this.courts &&
          other.points == this.points &&
          other.date == this.date &&
          other.started == this.started &&
          other.finished == this.finished);
}

class TournamentTableCompanion extends UpdateCompanion<TournamentTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> courts;
  final Value<int> points;
  final Value<DateTime> date;
  final Value<bool> started;
  final Value<bool> finished;
  const TournamentTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.courts = const Value.absent(),
    this.points = const Value.absent(),
    this.date = const Value.absent(),
    this.started = const Value.absent(),
    this.finished = const Value.absent(),
  });
  TournamentTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int courts,
    required int points,
    required DateTime date,
    required bool started,
    required bool finished,
  }) : name = Value(name),
       courts = Value(courts),
       points = Value(points),
       date = Value(date),
       started = Value(started),
       finished = Value(finished);
  static Insertable<TournamentTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? courts,
    Expression<int>? points,
    Expression<DateTime>? date,
    Expression<bool>? started,
    Expression<bool>? finished,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (courts != null) 'courts': courts,
      if (points != null) 'points': points,
      if (date != null) 'date': date,
      if (started != null) 'started': started,
      if (finished != null) 'finished': finished,
    });
  }

  TournamentTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? courts,
    Value<int>? points,
    Value<DateTime>? date,
    Value<bool>? started,
    Value<bool>? finished,
  }) {
    return TournamentTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      courts: courts ?? this.courts,
      points: points ?? this.points,
      date: date ?? this.date,
      started: started ?? this.started,
      finished: finished ?? this.finished,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
    if (started.present) {
      map['started'] = Variable<bool>(started.value);
    }
    if (finished.present) {
      map['finished'] = Variable<bool>(finished.value);
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
          ..write('started: $started, ')
          ..write('finished: $finished')
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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _tournamentIdMeta = const VerificationMeta(
    'tournamentId',
  );
  @override
  late final GeneratedColumn<int> tournamentId = GeneratedColumn<int>(
    'tournament_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  List<GeneratedColumn> get $columns => [id, tournamentId, name];
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
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tournamentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
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
  final int id;
  final int tournamentId;
  final String name;
  const TournamentPlayerTableData({
    required this.id,
    required this.tournamentId,
    required this.name,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tournament_id'] = Variable<int>(tournamentId);
    map['name'] = Variable<String>(name);
    return map;
  }

  TournamentPlayerTableCompanion toCompanion(bool nullToAbsent) {
    return TournamentPlayerTableCompanion(
      id: Value(id),
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
      id: serializer.fromJson<int>(json['id']),
      tournamentId: serializer.fromJson<int>(json['tournamentId']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tournamentId': serializer.toJson<int>(tournamentId),
      'name': serializer.toJson<String>(name),
    };
  }

  TournamentPlayerTableData copyWith({
    int? id,
    int? tournamentId,
    String? name,
  }) => TournamentPlayerTableData(
    id: id ?? this.id,
    tournamentId: tournamentId ?? this.tournamentId,
    name: name ?? this.name,
  );
  TournamentPlayerTableData copyWithCompanion(
    TournamentPlayerTableCompanion data,
  ) {
    return TournamentPlayerTableData(
      id: data.id.present ? data.id.value : this.id,
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
          ..write('tournamentId: $tournamentId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tournamentId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TournamentPlayerTableData &&
          other.id == this.id &&
          other.tournamentId == this.tournamentId &&
          other.name == this.name);
}

class TournamentPlayerTableCompanion
    extends UpdateCompanion<TournamentPlayerTableData> {
  final Value<int> id;
  final Value<int> tournamentId;
  final Value<String> name;
  const TournamentPlayerTableCompanion({
    this.id = const Value.absent(),
    this.tournamentId = const Value.absent(),
    this.name = const Value.absent(),
  });
  TournamentPlayerTableCompanion.insert({
    this.id = const Value.absent(),
    required int tournamentId,
    required String name,
  }) : tournamentId = Value(tournamentId),
       name = Value(name);
  static Insertable<TournamentPlayerTableData> custom({
    Expression<int>? id,
    Expression<int>? tournamentId,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tournamentId != null) 'tournament_id': tournamentId,
      if (name != null) 'name': name,
    });
  }

  TournamentPlayerTableCompanion copyWith({
    Value<int>? id,
    Value<int>? tournamentId,
    Value<String>? name,
  }) {
    return TournamentPlayerTableCompanion(
      id: id ?? this.id,
      tournamentId: tournamentId ?? this.tournamentId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tournamentId.present) {
      map['tournament_id'] = Variable<int>(tournamentId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TournamentPlayerTableCompanion(')
          ..write('id: $id, ')
          ..write('tournamentId: $tournamentId, ')
          ..write('name: $name')
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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _gameNumberMeta = const VerificationMeta(
    'gameNumber',
  );
  @override
  late final GeneratedColumn<int> gameNumber = GeneratedColumn<int>(
    'game_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tournamentIdMeta = const VerificationMeta(
    'tournamentId',
  );
  @override
  late final GeneratedColumn<int> tournamentId = GeneratedColumn<int>(
    'tournament_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _side1Player1IdMeta = const VerificationMeta(
    'side1Player1Id',
  );
  @override
  late final GeneratedColumn<int> side1Player1Id = GeneratedColumn<int>(
    'side1_player1_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _side1Player2IdMeta = const VerificationMeta(
    'side1Player2Id',
  );
  @override
  late final GeneratedColumn<int> side1Player2Id = GeneratedColumn<int>(
    'side1_player2_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _side2Player1IdMeta = const VerificationMeta(
    'side2Player1Id',
  );
  @override
  late final GeneratedColumn<int> side2Player1Id = GeneratedColumn<int>(
    'side2_player1_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _side2Player2IdMeta = const VerificationMeta(
    'side2Player2Id',
  );
  @override
  late final GeneratedColumn<int> side2Player2Id = GeneratedColumn<int>(
    'side2_player2_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
    gameNumber,
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
    }
    if (data.containsKey('game_number')) {
      context.handle(
        _gameNumberMeta,
        gameNumber.isAcceptableOrUnknown(data['game_number']!, _gameNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_gameNumberMeta);
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
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      gameNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_number'],
      )!,
      tournamentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tournament_id'],
      )!,
      side1Player1Id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}side1_player1_id'],
      )!,
      side1Player2Id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}side1_player2_id'],
      )!,
      side2Player1Id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}side2_player1_id'],
      )!,
      side2Player2Id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
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
  final int id;
  final int gameNumber;
  final int tournamentId;
  final int side1Player1Id;
  final int side1Player2Id;
  final int side2Player1Id;
  final int side2Player2Id;
  final int side1Score;
  final int side2Score;
  const TournamentGameTableData({
    required this.id,
    required this.gameNumber,
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
    map['id'] = Variable<int>(id);
    map['game_number'] = Variable<int>(gameNumber);
    map['tournament_id'] = Variable<int>(tournamentId);
    map['side1_player1_id'] = Variable<int>(side1Player1Id);
    map['side1_player2_id'] = Variable<int>(side1Player2Id);
    map['side2_player1_id'] = Variable<int>(side2Player1Id);
    map['side2_player2_id'] = Variable<int>(side2Player2Id);
    map['side1_score'] = Variable<int>(side1Score);
    map['side2_score'] = Variable<int>(side2Score);
    return map;
  }

  TournamentGameTableCompanion toCompanion(bool nullToAbsent) {
    return TournamentGameTableCompanion(
      id: Value(id),
      gameNumber: Value(gameNumber),
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
      id: serializer.fromJson<int>(json['id']),
      gameNumber: serializer.fromJson<int>(json['gameNumber']),
      tournamentId: serializer.fromJson<int>(json['tournamentId']),
      side1Player1Id: serializer.fromJson<int>(json['side1Player1Id']),
      side1Player2Id: serializer.fromJson<int>(json['side1Player2Id']),
      side2Player1Id: serializer.fromJson<int>(json['side2Player1Id']),
      side2Player2Id: serializer.fromJson<int>(json['side2Player2Id']),
      side1Score: serializer.fromJson<int>(json['side1Score']),
      side2Score: serializer.fromJson<int>(json['side2Score']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gameNumber': serializer.toJson<int>(gameNumber),
      'tournamentId': serializer.toJson<int>(tournamentId),
      'side1Player1Id': serializer.toJson<int>(side1Player1Id),
      'side1Player2Id': serializer.toJson<int>(side1Player2Id),
      'side2Player1Id': serializer.toJson<int>(side2Player1Id),
      'side2Player2Id': serializer.toJson<int>(side2Player2Id),
      'side1Score': serializer.toJson<int>(side1Score),
      'side2Score': serializer.toJson<int>(side2Score),
    };
  }

  TournamentGameTableData copyWith({
    int? id,
    int? gameNumber,
    int? tournamentId,
    int? side1Player1Id,
    int? side1Player2Id,
    int? side2Player1Id,
    int? side2Player2Id,
    int? side1Score,
    int? side2Score,
  }) => TournamentGameTableData(
    id: id ?? this.id,
    gameNumber: gameNumber ?? this.gameNumber,
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
      gameNumber: data.gameNumber.present
          ? data.gameNumber.value
          : this.gameNumber,
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
          ..write('gameNumber: $gameNumber, ')
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
    gameNumber,
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
          other.gameNumber == this.gameNumber &&
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
  final Value<int> id;
  final Value<int> gameNumber;
  final Value<int> tournamentId;
  final Value<int> side1Player1Id;
  final Value<int> side1Player2Id;
  final Value<int> side2Player1Id;
  final Value<int> side2Player2Id;
  final Value<int> side1Score;
  final Value<int> side2Score;
  const TournamentGameTableCompanion({
    this.id = const Value.absent(),
    this.gameNumber = const Value.absent(),
    this.tournamentId = const Value.absent(),
    this.side1Player1Id = const Value.absent(),
    this.side1Player2Id = const Value.absent(),
    this.side2Player1Id = const Value.absent(),
    this.side2Player2Id = const Value.absent(),
    this.side1Score = const Value.absent(),
    this.side2Score = const Value.absent(),
  });
  TournamentGameTableCompanion.insert({
    this.id = const Value.absent(),
    required int gameNumber,
    required int tournamentId,
    required int side1Player1Id,
    required int side1Player2Id,
    required int side2Player1Id,
    required int side2Player2Id,
    required int side1Score,
    required int side2Score,
  }) : gameNumber = Value(gameNumber),
       tournamentId = Value(tournamentId),
       side1Player1Id = Value(side1Player1Id),
       side1Player2Id = Value(side1Player2Id),
       side2Player1Id = Value(side2Player1Id),
       side2Player2Id = Value(side2Player2Id),
       side1Score = Value(side1Score),
       side2Score = Value(side2Score);
  static Insertable<TournamentGameTableData> custom({
    Expression<int>? id,
    Expression<int>? gameNumber,
    Expression<int>? tournamentId,
    Expression<int>? side1Player1Id,
    Expression<int>? side1Player2Id,
    Expression<int>? side2Player1Id,
    Expression<int>? side2Player2Id,
    Expression<int>? side1Score,
    Expression<int>? side2Score,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameNumber != null) 'game_number': gameNumber,
      if (tournamentId != null) 'tournament_id': tournamentId,
      if (side1Player1Id != null) 'side1_player1_id': side1Player1Id,
      if (side1Player2Id != null) 'side1_player2_id': side1Player2Id,
      if (side2Player1Id != null) 'side2_player1_id': side2Player1Id,
      if (side2Player2Id != null) 'side2_player2_id': side2Player2Id,
      if (side1Score != null) 'side1_score': side1Score,
      if (side2Score != null) 'side2_score': side2Score,
    });
  }

  TournamentGameTableCompanion copyWith({
    Value<int>? id,
    Value<int>? gameNumber,
    Value<int>? tournamentId,
    Value<int>? side1Player1Id,
    Value<int>? side1Player2Id,
    Value<int>? side2Player1Id,
    Value<int>? side2Player2Id,
    Value<int>? side1Score,
    Value<int>? side2Score,
  }) {
    return TournamentGameTableCompanion(
      id: id ?? this.id,
      gameNumber: gameNumber ?? this.gameNumber,
      tournamentId: tournamentId ?? this.tournamentId,
      side1Player1Id: side1Player1Id ?? this.side1Player1Id,
      side1Player2Id: side1Player2Id ?? this.side1Player2Id,
      side2Player1Id: side2Player1Id ?? this.side2Player1Id,
      side2Player2Id: side2Player2Id ?? this.side2Player2Id,
      side1Score: side1Score ?? this.side1Score,
      side2Score: side2Score ?? this.side2Score,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gameNumber.present) {
      map['game_number'] = Variable<int>(gameNumber.value);
    }
    if (tournamentId.present) {
      map['tournament_id'] = Variable<int>(tournamentId.value);
    }
    if (side1Player1Id.present) {
      map['side1_player1_id'] = Variable<int>(side1Player1Id.value);
    }
    if (side1Player2Id.present) {
      map['side1_player2_id'] = Variable<int>(side1Player2Id.value);
    }
    if (side2Player1Id.present) {
      map['side2_player1_id'] = Variable<int>(side2Player1Id.value);
    }
    if (side2Player2Id.present) {
      map['side2_player2_id'] = Variable<int>(side2Player2Id.value);
    }
    if (side1Score.present) {
      map['side1_score'] = Variable<int>(side1Score.value);
    }
    if (side2Score.present) {
      map['side2_score'] = Variable<int>(side2Score.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TournamentGameTableCompanion(')
          ..write('id: $id, ')
          ..write('gameNumber: $gameNumber, ')
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
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    tournamentTable,
    tournamentPlayerTable,
    tournamentGameTable,
  ];
}

typedef $$TournamentTableTableCreateCompanionBuilder =
    TournamentTableCompanion Function({
      Value<int> id,
      required String name,
      required int courts,
      required int points,
      required DateTime date,
      required bool started,
      required bool finished,
    });
typedef $$TournamentTableTableUpdateCompanionBuilder =
    TournamentTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> courts,
      Value<int> points,
      Value<DateTime> date,
      Value<bool> started,
      Value<bool> finished,
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
  ColumnFilters<int> get id => $composableBuilder(
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

  ColumnFilters<bool> get started => $composableBuilder(
    column: $table.started,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get finished => $composableBuilder(
    column: $table.finished,
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
  ColumnOrderings<int> get id => $composableBuilder(
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

  ColumnOrderings<bool> get started => $composableBuilder(
    column: $table.started,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get finished => $composableBuilder(
    column: $table.finished,
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
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get courts =>
      $composableBuilder(column: $table.courts, builder: (column) => column);

  GeneratedColumn<int> get points =>
      $composableBuilder(column: $table.points, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<bool> get started =>
      $composableBuilder(column: $table.started, builder: (column) => column);

  GeneratedColumn<bool> get finished =>
      $composableBuilder(column: $table.finished, builder: (column) => column);
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
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> courts = const Value.absent(),
                Value<int> points = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<bool> started = const Value.absent(),
                Value<bool> finished = const Value.absent(),
              }) => TournamentTableCompanion(
                id: id,
                name: name,
                courts: courts,
                points: points,
                date: date,
                started: started,
                finished: finished,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int courts,
                required int points,
                required DateTime date,
                required bool started,
                required bool finished,
              }) => TournamentTableCompanion.insert(
                id: id,
                name: name,
                courts: courts,
                points: points,
                date: date,
                started: started,
                finished: finished,
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
      Value<int> id,
      required int tournamentId,
      required String name,
    });
typedef $$TournamentPlayerTableTableUpdateCompanionBuilder =
    TournamentPlayerTableCompanion Function({
      Value<int> id,
      Value<int> tournamentId,
      Value<String> name,
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
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tournamentId => $composableBuilder(
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
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tournamentId => $composableBuilder(
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
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get tournamentId => $composableBuilder(
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
                Value<int> id = const Value.absent(),
                Value<int> tournamentId = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => TournamentPlayerTableCompanion(
                id: id,
                tournamentId: tournamentId,
                name: name,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int tournamentId,
                required String name,
              }) => TournamentPlayerTableCompanion.insert(
                id: id,
                tournamentId: tournamentId,
                name: name,
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
      Value<int> id,
      required int gameNumber,
      required int tournamentId,
      required int side1Player1Id,
      required int side1Player2Id,
      required int side2Player1Id,
      required int side2Player2Id,
      required int side1Score,
      required int side2Score,
    });
typedef $$TournamentGameTableTableUpdateCompanionBuilder =
    TournamentGameTableCompanion Function({
      Value<int> id,
      Value<int> gameNumber,
      Value<int> tournamentId,
      Value<int> side1Player1Id,
      Value<int> side1Player2Id,
      Value<int> side2Player1Id,
      Value<int> side2Player2Id,
      Value<int> side1Score,
      Value<int> side2Score,
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
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get gameNumber => $composableBuilder(
    column: $table.gameNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tournamentId => $composableBuilder(
    column: $table.tournamentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get side1Player1Id => $composableBuilder(
    column: $table.side1Player1Id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get side1Player2Id => $composableBuilder(
    column: $table.side1Player2Id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get side2Player1Id => $composableBuilder(
    column: $table.side2Player1Id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get side2Player2Id => $composableBuilder(
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
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get gameNumber => $composableBuilder(
    column: $table.gameNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tournamentId => $composableBuilder(
    column: $table.tournamentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get side1Player1Id => $composableBuilder(
    column: $table.side1Player1Id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get side1Player2Id => $composableBuilder(
    column: $table.side1Player2Id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get side2Player1Id => $composableBuilder(
    column: $table.side2Player1Id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get side2Player2Id => $composableBuilder(
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
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get gameNumber => $composableBuilder(
    column: $table.gameNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get tournamentId => $composableBuilder(
    column: $table.tournamentId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get side1Player1Id => $composableBuilder(
    column: $table.side1Player1Id,
    builder: (column) => column,
  );

  GeneratedColumn<int> get side1Player2Id => $composableBuilder(
    column: $table.side1Player2Id,
    builder: (column) => column,
  );

  GeneratedColumn<int> get side2Player1Id => $composableBuilder(
    column: $table.side2Player1Id,
    builder: (column) => column,
  );

  GeneratedColumn<int> get side2Player2Id => $composableBuilder(
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
                Value<int> id = const Value.absent(),
                Value<int> gameNumber = const Value.absent(),
                Value<int> tournamentId = const Value.absent(),
                Value<int> side1Player1Id = const Value.absent(),
                Value<int> side1Player2Id = const Value.absent(),
                Value<int> side2Player1Id = const Value.absent(),
                Value<int> side2Player2Id = const Value.absent(),
                Value<int> side1Score = const Value.absent(),
                Value<int> side2Score = const Value.absent(),
              }) => TournamentGameTableCompanion(
                id: id,
                gameNumber: gameNumber,
                tournamentId: tournamentId,
                side1Player1Id: side1Player1Id,
                side1Player2Id: side1Player2Id,
                side2Player1Id: side2Player1Id,
                side2Player2Id: side2Player2Id,
                side1Score: side1Score,
                side2Score: side2Score,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int gameNumber,
                required int tournamentId,
                required int side1Player1Id,
                required int side1Player2Id,
                required int side2Player1Id,
                required int side2Player2Id,
                required int side1Score,
                required int side2Score,
              }) => TournamentGameTableCompanion.insert(
                id: id,
                gameNumber: gameNumber,
                tournamentId: tournamentId,
                side1Player1Id: side1Player1Id,
                side1Player2Id: side1Player2Id,
                side2Player1Id: side2Player1Id,
                side2Player2Id: side2Player2Id,
                side1Score: side1Score,
                side2Score: side2Score,
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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TournamentTableTableTableManager get tournamentTable =>
      $$TournamentTableTableTableManager(_db, _db.tournamentTable);
  $$TournamentPlayerTableTableTableManager get tournamentPlayerTable =>
      $$TournamentPlayerTableTableTableManager(_db, _db.tournamentPlayerTable);
  $$TournamentGameTableTableTableManager get tournamentGameTable =>
      $$TournamentGameTableTableTableManager(_db, _db.tournamentGameTable);
}
