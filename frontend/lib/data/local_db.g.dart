// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db.dart';

// ignore_for_file: type=lint
class $HospitalsTable extends Hospitals
    with TableInfo<$HospitalsTable, Hospital> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HospitalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _planMeta = const VerificationMeta('plan');
  @override
  late final GeneratedColumn<String> plan = GeneratedColumn<String>(
      'plan', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ownerUserIdMeta =
      const VerificationMeta('ownerUserId');
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
      'owner_user_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, code, uid, plan, status, ownerUserId, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hospitals';
  @override
  VerificationContext validateIntegrity(Insertable<Hospital> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('plan')) {
      context.handle(
          _planMeta, plan.isAcceptableOrUnknown(data['plan']!, _planMeta));
    } else if (isInserting) {
      context.missing(_planMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
          _ownerUserIdMeta,
          ownerUserId.isAcceptableOrUnknown(
              data['owner_user_id']!, _ownerUserIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Hospital map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Hospital(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid'])!,
      plan: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plan'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      ownerUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}owner_user_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $HospitalsTable createAlias(String alias) {
    return $HospitalsTable(attachedDatabase, alias);
  }
}

class Hospital extends DataClass implements Insertable<Hospital> {
  final String id;
  final String name;
  final String code;
  final String uid;
  final String plan;
  final String status;
  final String? ownerUserId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Hospital(
      {required this.id,
      required this.name,
      required this.code,
      required this.uid,
      required this.plan,
      required this.status,
      this.ownerUserId,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['code'] = Variable<String>(code);
    map['uid'] = Variable<String>(uid);
    map['plan'] = Variable<String>(plan);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || ownerUserId != null) {
      map['owner_user_id'] = Variable<String>(ownerUserId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  HospitalsCompanion toCompanion(bool nullToAbsent) {
    return HospitalsCompanion(
      id: Value(id),
      name: Value(name),
      code: Value(code),
      uid: Value(uid),
      plan: Value(plan),
      status: Value(status),
      ownerUserId: ownerUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerUserId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Hospital.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Hospital(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      code: serializer.fromJson<String>(json['code']),
      uid: serializer.fromJson<String>(json['uid']),
      plan: serializer.fromJson<String>(json['plan']),
      status: serializer.fromJson<String>(json['status']),
      ownerUserId: serializer.fromJson<String?>(json['ownerUserId']),
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
      'code': serializer.toJson<String>(code),
      'uid': serializer.toJson<String>(uid),
      'plan': serializer.toJson<String>(plan),
      'status': serializer.toJson<String>(status),
      'ownerUserId': serializer.toJson<String?>(ownerUserId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Hospital copyWith(
          {String? id,
          String? name,
          String? code,
          String? uid,
          String? plan,
          String? status,
          Value<String?> ownerUserId = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Hospital(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        uid: uid ?? this.uid,
        plan: plan ?? this.plan,
        status: status ?? this.status,
        ownerUserId: ownerUserId.present ? ownerUserId.value : this.ownerUserId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Hospital copyWithCompanion(HospitalsCompanion data) {
    return Hospital(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      code: data.code.present ? data.code.value : this.code,
      uid: data.uid.present ? data.uid.value : this.uid,
      plan: data.plan.present ? data.plan.value : this.plan,
      status: data.status.present ? data.status.value : this.status,
      ownerUserId:
          data.ownerUserId.present ? data.ownerUserId.value : this.ownerUserId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Hospital(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('uid: $uid, ')
          ..write('plan: $plan, ')
          ..write('status: $status, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, code, uid, plan, status, ownerUserId, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Hospital &&
          other.id == this.id &&
          other.name == this.name &&
          other.code == this.code &&
          other.uid == this.uid &&
          other.plan == this.plan &&
          other.status == this.status &&
          other.ownerUserId == this.ownerUserId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class HospitalsCompanion extends UpdateCompanion<Hospital> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> code;
  final Value<String> uid;
  final Value<String> plan;
  final Value<String> status;
  final Value<String?> ownerUserId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const HospitalsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.uid = const Value.absent(),
    this.plan = const Value.absent(),
    this.status = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HospitalsCompanion.insert({
    required String id,
    required String name,
    required String code,
    required String uid,
    required String plan,
    required String status,
    this.ownerUserId = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        code = Value(code),
        uid = Value(uid),
        plan = Value(plan),
        status = Value(status),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Hospital> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? code,
    Expression<String>? uid,
    Expression<String>? plan,
    Expression<String>? status,
    Expression<String>? ownerUserId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (uid != null) 'uid': uid,
      if (plan != null) 'plan': plan,
      if (status != null) 'status': status,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HospitalsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? code,
      Value<String>? uid,
      Value<String>? plan,
      Value<String>? status,
      Value<String?>? ownerUserId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return HospitalsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      uid: uid ?? this.uid,
      plan: plan ?? this.plan,
      status: status ?? this.status,
      ownerUserId: ownerUserId ?? this.ownerUserId,
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
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (plan.present) {
      map['plan'] = Variable<String>(plan.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
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
    return (StringBuffer('HospitalsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('uid: $uid, ')
          ..write('plan: $plan, ')
          ..write('status: $status, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'role', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hospitalIdMeta =
      const VerificationMeta('hospitalId');
  @override
  late final GeneratedColumn<String> hospitalId = GeneratedColumn<String>(
      'hospital_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, email, phone, role, hospitalId, status, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('hospital_id')) {
      context.handle(
          _hospitalIdMeta,
          hospitalId.isAcceptableOrUnknown(
              data['hospital_id']!, _hospitalIdMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      role: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!,
      hospitalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hospital_id']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String role;
  final String? hospitalId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  const User(
      {required this.id,
      required this.name,
      required this.email,
      this.phone,
      required this.role,
      this.hospitalId,
      required this.status,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    map['role'] = Variable<String>(role);
    if (!nullToAbsent || hospitalId != null) {
      map['hospital_id'] = Variable<String>(hospitalId);
    }
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      role: Value(role),
      hospitalId: hospitalId == null && nullToAbsent
          ? const Value.absent()
          : Value(hospitalId),
      status: Value(status),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      role: serializer.fromJson<String>(json['role']),
      hospitalId: serializer.fromJson<String?>(json['hospitalId']),
      status: serializer.fromJson<String>(json['status']),
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
      'email': serializer.toJson<String>(email),
      'phone': serializer.toJson<String?>(phone),
      'role': serializer.toJson<String>(role),
      'hospitalId': serializer.toJson<String?>(hospitalId),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  User copyWith(
          {String? id,
          String? name,
          String? email,
          Value<String?> phone = const Value.absent(),
          String? role,
          Value<String?> hospitalId = const Value.absent(),
          String? status,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone.present ? phone.value : this.phone,
        role: role ?? this.role,
        hospitalId: hospitalId.present ? hospitalId.value : this.hospitalId,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      role: data.role.present ? data.role.value : this.role,
      hospitalId:
          data.hospitalId.present ? data.hospitalId.value : this.hospitalId,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('role: $role, ')
          ..write('hospitalId: $hospitalId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, email, phone, role, hospitalId, status, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.role == this.role &&
          other.hospitalId == this.hospitalId &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String?> phone;
  final Value<String> role;
  final Value<String?> hospitalId;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.role = const Value.absent(),
    this.hospitalId = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required String name,
    required String email,
    this.phone = const Value.absent(),
    required String role,
    this.hospitalId = const Value.absent(),
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        email = Value(email),
        role = Value(role),
        status = Value(status),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<User> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? role,
    Expression<String>? hospitalId,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (role != null) 'role': role,
      if (hospitalId != null) 'hospital_id': hospitalId,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? email,
      Value<String?>? phone,
      Value<String>? role,
      Value<String?>? hospitalId,
      Value<String>? status,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      hospitalId: hospitalId ?? this.hospitalId,
      status: status ?? this.status,
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
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (hospitalId.present) {
      map['hospital_id'] = Variable<String>(hospitalId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
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
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('role: $role, ')
          ..write('hospitalId: $hospitalId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SubscriptionsTable extends Subscriptions
    with TableInfo<$SubscriptionsTable, Subscription> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubscriptionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subjectTypeMeta =
      const VerificationMeta('subjectType');
  @override
  late final GeneratedColumn<String> subjectType = GeneratedColumn<String>(
      'subject_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subjectIdMeta =
      const VerificationMeta('subjectId');
  @override
  late final GeneratedColumn<String> subjectId = GeneratedColumn<String>(
      'subject_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _planCodeMeta =
      const VerificationMeta('planCode');
  @override
  late final GeneratedColumn<String> planCode = GeneratedColumn<String>(
      'plan_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _periodStartMeta =
      const VerificationMeta('periodStart');
  @override
  late final GeneratedColumn<DateTime> periodStart = GeneratedColumn<DateTime>(
      'period_start', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _periodEndMeta =
      const VerificationMeta('periodEnd');
  @override
  late final GeneratedColumn<DateTime> periodEnd = GeneratedColumn<DateTime>(
      'period_end', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _seatsMeta = const VerificationMeta('seats');
  @override
  late final GeneratedColumn<int> seats = GeneratedColumn<int>(
      'seats', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        subjectType,
        subjectId,
        planCode,
        periodStart,
        periodEnd,
        status,
        seats,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subscriptions';
  @override
  VerificationContext validateIntegrity(Insertable<Subscription> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('subject_type')) {
      context.handle(
          _subjectTypeMeta,
          subjectType.isAcceptableOrUnknown(
              data['subject_type']!, _subjectTypeMeta));
    } else if (isInserting) {
      context.missing(_subjectTypeMeta);
    }
    if (data.containsKey('subject_id')) {
      context.handle(_subjectIdMeta,
          subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta));
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('plan_code')) {
      context.handle(_planCodeMeta,
          planCode.isAcceptableOrUnknown(data['plan_code']!, _planCodeMeta));
    } else if (isInserting) {
      context.missing(_planCodeMeta);
    }
    if (data.containsKey('period_start')) {
      context.handle(
          _periodStartMeta,
          periodStart.isAcceptableOrUnknown(
              data['period_start']!, _periodStartMeta));
    } else if (isInserting) {
      context.missing(_periodStartMeta);
    }
    if (data.containsKey('period_end')) {
      context.handle(_periodEndMeta,
          periodEnd.isAcceptableOrUnknown(data['period_end']!, _periodEndMeta));
    } else if (isInserting) {
      context.missing(_periodEndMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('seats')) {
      context.handle(
          _seatsMeta, seats.isAcceptableOrUnknown(data['seats']!, _seatsMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Subscription map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subscription(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      subjectType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject_type'])!,
      subjectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject_id'])!,
      planCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plan_code'])!,
      periodStart: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}period_start'])!,
      periodEnd: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}period_end'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      seats: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}seats']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $SubscriptionsTable createAlias(String alias) {
    return $SubscriptionsTable(attachedDatabase, alias);
  }
}

class Subscription extends DataClass implements Insertable<Subscription> {
  final String id;
  final String subjectType;
  final String subjectId;
  final String planCode;
  final DateTime periodStart;
  final DateTime periodEnd;
  final String status;
  final int? seats;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Subscription(
      {required this.id,
      required this.subjectType,
      required this.subjectId,
      required this.planCode,
      required this.periodStart,
      required this.periodEnd,
      required this.status,
      this.seats,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['subject_type'] = Variable<String>(subjectType);
    map['subject_id'] = Variable<String>(subjectId);
    map['plan_code'] = Variable<String>(planCode);
    map['period_start'] = Variable<DateTime>(periodStart);
    map['period_end'] = Variable<DateTime>(periodEnd);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || seats != null) {
      map['seats'] = Variable<int>(seats);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SubscriptionsCompanion toCompanion(bool nullToAbsent) {
    return SubscriptionsCompanion(
      id: Value(id),
      subjectType: Value(subjectType),
      subjectId: Value(subjectId),
      planCode: Value(planCode),
      periodStart: Value(periodStart),
      periodEnd: Value(periodEnd),
      status: Value(status),
      seats:
          seats == null && nullToAbsent ? const Value.absent() : Value(seats),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Subscription.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subscription(
      id: serializer.fromJson<String>(json['id']),
      subjectType: serializer.fromJson<String>(json['subjectType']),
      subjectId: serializer.fromJson<String>(json['subjectId']),
      planCode: serializer.fromJson<String>(json['planCode']),
      periodStart: serializer.fromJson<DateTime>(json['periodStart']),
      periodEnd: serializer.fromJson<DateTime>(json['periodEnd']),
      status: serializer.fromJson<String>(json['status']),
      seats: serializer.fromJson<int?>(json['seats']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'subjectType': serializer.toJson<String>(subjectType),
      'subjectId': serializer.toJson<String>(subjectId),
      'planCode': serializer.toJson<String>(planCode),
      'periodStart': serializer.toJson<DateTime>(periodStart),
      'periodEnd': serializer.toJson<DateTime>(periodEnd),
      'status': serializer.toJson<String>(status),
      'seats': serializer.toJson<int?>(seats),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Subscription copyWith(
          {String? id,
          String? subjectType,
          String? subjectId,
          String? planCode,
          DateTime? periodStart,
          DateTime? periodEnd,
          String? status,
          Value<int?> seats = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Subscription(
        id: id ?? this.id,
        subjectType: subjectType ?? this.subjectType,
        subjectId: subjectId ?? this.subjectId,
        planCode: planCode ?? this.planCode,
        periodStart: periodStart ?? this.periodStart,
        periodEnd: periodEnd ?? this.periodEnd,
        status: status ?? this.status,
        seats: seats.present ? seats.value : this.seats,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Subscription copyWithCompanion(SubscriptionsCompanion data) {
    return Subscription(
      id: data.id.present ? data.id.value : this.id,
      subjectType:
          data.subjectType.present ? data.subjectType.value : this.subjectType,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      planCode: data.planCode.present ? data.planCode.value : this.planCode,
      periodStart:
          data.periodStart.present ? data.periodStart.value : this.periodStart,
      periodEnd: data.periodEnd.present ? data.periodEnd.value : this.periodEnd,
      status: data.status.present ? data.status.value : this.status,
      seats: data.seats.present ? data.seats.value : this.seats,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Subscription(')
          ..write('id: $id, ')
          ..write('subjectType: $subjectType, ')
          ..write('subjectId: $subjectId, ')
          ..write('planCode: $planCode, ')
          ..write('periodStart: $periodStart, ')
          ..write('periodEnd: $periodEnd, ')
          ..write('status: $status, ')
          ..write('seats: $seats, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, subjectType, subjectId, planCode,
      periodStart, periodEnd, status, seats, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subscription &&
          other.id == this.id &&
          other.subjectType == this.subjectType &&
          other.subjectId == this.subjectId &&
          other.planCode == this.planCode &&
          other.periodStart == this.periodStart &&
          other.periodEnd == this.periodEnd &&
          other.status == this.status &&
          other.seats == this.seats &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SubscriptionsCompanion extends UpdateCompanion<Subscription> {
  final Value<String> id;
  final Value<String> subjectType;
  final Value<String> subjectId;
  final Value<String> planCode;
  final Value<DateTime> periodStart;
  final Value<DateTime> periodEnd;
  final Value<String> status;
  final Value<int?> seats;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SubscriptionsCompanion({
    this.id = const Value.absent(),
    this.subjectType = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.planCode = const Value.absent(),
    this.periodStart = const Value.absent(),
    this.periodEnd = const Value.absent(),
    this.status = const Value.absent(),
    this.seats = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SubscriptionsCompanion.insert({
    required String id,
    required String subjectType,
    required String subjectId,
    required String planCode,
    required DateTime periodStart,
    required DateTime periodEnd,
    required String status,
    this.seats = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        subjectType = Value(subjectType),
        subjectId = Value(subjectId),
        planCode = Value(planCode),
        periodStart = Value(periodStart),
        periodEnd = Value(periodEnd),
        status = Value(status),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Subscription> custom({
    Expression<String>? id,
    Expression<String>? subjectType,
    Expression<String>? subjectId,
    Expression<String>? planCode,
    Expression<DateTime>? periodStart,
    Expression<DateTime>? periodEnd,
    Expression<String>? status,
    Expression<int>? seats,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subjectType != null) 'subject_type': subjectType,
      if (subjectId != null) 'subject_id': subjectId,
      if (planCode != null) 'plan_code': planCode,
      if (periodStart != null) 'period_start': periodStart,
      if (periodEnd != null) 'period_end': periodEnd,
      if (status != null) 'status': status,
      if (seats != null) 'seats': seats,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SubscriptionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? subjectType,
      Value<String>? subjectId,
      Value<String>? planCode,
      Value<DateTime>? periodStart,
      Value<DateTime>? periodEnd,
      Value<String>? status,
      Value<int?>? seats,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return SubscriptionsCompanion(
      id: id ?? this.id,
      subjectType: subjectType ?? this.subjectType,
      subjectId: subjectId ?? this.subjectId,
      planCode: planCode ?? this.planCode,
      periodStart: periodStart ?? this.periodStart,
      periodEnd: periodEnd ?? this.periodEnd,
      status: status ?? this.status,
      seats: seats ?? this.seats,
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
    if (subjectType.present) {
      map['subject_type'] = Variable<String>(subjectType.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<String>(subjectId.value);
    }
    if (planCode.present) {
      map['plan_code'] = Variable<String>(planCode.value);
    }
    if (periodStart.present) {
      map['period_start'] = Variable<DateTime>(periodStart.value);
    }
    if (periodEnd.present) {
      map['period_end'] = Variable<DateTime>(periodEnd.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (seats.present) {
      map['seats'] = Variable<int>(seats.value);
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
    return (StringBuffer('SubscriptionsCompanion(')
          ..write('id: $id, ')
          ..write('subjectType: $subjectType, ')
          ..write('subjectId: $subjectId, ')
          ..write('planCode: $planCode, ')
          ..write('periodStart: $periodStart, ')
          ..write('periodEnd: $periodEnd, ')
          ..write('status: $status, ')
          ..write('seats: $seats, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PatientsTable extends Patients with TableInfo<$PatientsTable, Patient> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PatientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hospitalIdMeta =
      const VerificationMeta('hospitalId');
  @override
  late final GeneratedColumn<String> hospitalId = GeneratedColumn<String>(
      'hospital_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ownerUserIdMeta =
      const VerificationMeta('ownerUserId');
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
      'owner_user_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mrnMeta = const VerificationMeta('mrn');
  @override
  late final GeneratedColumn<String> mrn = GeneratedColumn<String>(
      'mrn', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _initialsMeta =
      const VerificationMeta('initials');
  @override
  late final GeneratedColumn<String> initials = GeneratedColumn<String>(
      'initials', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dobMeta = const VerificationMeta('dob');
  @override
  late final GeneratedColumn<DateTime> dob = GeneratedColumn<DateTime>(
      'dob', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
      'sex', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _weightKgMeta =
      const VerificationMeta('weightKg');
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
      'weight_kg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _heightCmMeta =
      const VerificationMeta('heightCm');
  @override
  late final GeneratedColumn<double> heightCm = GeneratedColumn<double>(
      'height_cm', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _allergiesMeta =
      const VerificationMeta('allergies');
  @override
  late final GeneratedColumn<String> allergies = GeneratedColumn<String>(
      'allergies', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
      'created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        hospitalId,
        ownerUserId,
        mrn,
        initials,
        fullName,
        dob,
        sex,
        weightKg,
        heightCm,
        allergies,
        createdBy,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'patients';
  @override
  VerificationContext validateIntegrity(Insertable<Patient> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('hospital_id')) {
      context.handle(
          _hospitalIdMeta,
          hospitalId.isAcceptableOrUnknown(
              data['hospital_id']!, _hospitalIdMeta));
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
          _ownerUserIdMeta,
          ownerUserId.isAcceptableOrUnknown(
              data['owner_user_id']!, _ownerUserIdMeta));
    }
    if (data.containsKey('mrn')) {
      context.handle(
          _mrnMeta, mrn.isAcceptableOrUnknown(data['mrn']!, _mrnMeta));
    }
    if (data.containsKey('initials')) {
      context.handle(_initialsMeta,
          initials.isAcceptableOrUnknown(data['initials']!, _initialsMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    }
    if (data.containsKey('dob')) {
      context.handle(
          _dobMeta, dob.isAcceptableOrUnknown(data['dob']!, _dobMeta));
    }
    if (data.containsKey('sex')) {
      context.handle(
          _sexMeta, sex.isAcceptableOrUnknown(data['sex']!, _sexMeta));
    }
    if (data.containsKey('weight_kg')) {
      context.handle(_weightKgMeta,
          weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta));
    }
    if (data.containsKey('height_cm')) {
      context.handle(_heightCmMeta,
          heightCm.isAcceptableOrUnknown(data['height_cm']!, _heightCmMeta));
    }
    if (data.containsKey('allergies')) {
      context.handle(_allergiesMeta,
          allergies.isAcceptableOrUnknown(data['allergies']!, _allergiesMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Patient map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Patient(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      hospitalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hospital_id']),
      ownerUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}owner_user_id']),
      mrn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mrn']),
      initials: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}initials']),
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name']),
      dob: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dob']),
      sex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sex']),
      weightKg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight_kg']),
      heightCm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}height_cm']),
      allergies: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}allergies']),
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $PatientsTable createAlias(String alias) {
    return $PatientsTable(attachedDatabase, alias);
  }
}

class Patient extends DataClass implements Insertable<Patient> {
  final String id;
  final String? hospitalId;
  final String? ownerUserId;
  final String? mrn;
  final String? initials;
  final String? fullName;
  final DateTime? dob;
  final String? sex;
  final double? weightKg;
  final double? heightCm;
  final String? allergies;
  final String? createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Patient(
      {required this.id,
      this.hospitalId,
      this.ownerUserId,
      this.mrn,
      this.initials,
      this.fullName,
      this.dob,
      this.sex,
      this.weightKg,
      this.heightCm,
      this.allergies,
      this.createdBy,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || hospitalId != null) {
      map['hospital_id'] = Variable<String>(hospitalId);
    }
    if (!nullToAbsent || ownerUserId != null) {
      map['owner_user_id'] = Variable<String>(ownerUserId);
    }
    if (!nullToAbsent || mrn != null) {
      map['mrn'] = Variable<String>(mrn);
    }
    if (!nullToAbsent || initials != null) {
      map['initials'] = Variable<String>(initials);
    }
    if (!nullToAbsent || fullName != null) {
      map['full_name'] = Variable<String>(fullName);
    }
    if (!nullToAbsent || dob != null) {
      map['dob'] = Variable<DateTime>(dob);
    }
    if (!nullToAbsent || sex != null) {
      map['sex'] = Variable<String>(sex);
    }
    if (!nullToAbsent || weightKg != null) {
      map['weight_kg'] = Variable<double>(weightKg);
    }
    if (!nullToAbsent || heightCm != null) {
      map['height_cm'] = Variable<double>(heightCm);
    }
    if (!nullToAbsent || allergies != null) {
      map['allergies'] = Variable<String>(allergies);
    }
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PatientsCompanion toCompanion(bool nullToAbsent) {
    return PatientsCompanion(
      id: Value(id),
      hospitalId: hospitalId == null && nullToAbsent
          ? const Value.absent()
          : Value(hospitalId),
      ownerUserId: ownerUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerUserId),
      mrn: mrn == null && nullToAbsent ? const Value.absent() : Value(mrn),
      initials: initials == null && nullToAbsent
          ? const Value.absent()
          : Value(initials),
      fullName: fullName == null && nullToAbsent
          ? const Value.absent()
          : Value(fullName),
      dob: dob == null && nullToAbsent ? const Value.absent() : Value(dob),
      sex: sex == null && nullToAbsent ? const Value.absent() : Value(sex),
      weightKg: weightKg == null && nullToAbsent
          ? const Value.absent()
          : Value(weightKg),
      heightCm: heightCm == null && nullToAbsent
          ? const Value.absent()
          : Value(heightCm),
      allergies: allergies == null && nullToAbsent
          ? const Value.absent()
          : Value(allergies),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Patient.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Patient(
      id: serializer.fromJson<String>(json['id']),
      hospitalId: serializer.fromJson<String?>(json['hospitalId']),
      ownerUserId: serializer.fromJson<String?>(json['ownerUserId']),
      mrn: serializer.fromJson<String?>(json['mrn']),
      initials: serializer.fromJson<String?>(json['initials']),
      fullName: serializer.fromJson<String?>(json['fullName']),
      dob: serializer.fromJson<DateTime?>(json['dob']),
      sex: serializer.fromJson<String?>(json['sex']),
      weightKg: serializer.fromJson<double?>(json['weightKg']),
      heightCm: serializer.fromJson<double?>(json['heightCm']),
      allergies: serializer.fromJson<String?>(json['allergies']),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'hospitalId': serializer.toJson<String?>(hospitalId),
      'ownerUserId': serializer.toJson<String?>(ownerUserId),
      'mrn': serializer.toJson<String?>(mrn),
      'initials': serializer.toJson<String?>(initials),
      'fullName': serializer.toJson<String?>(fullName),
      'dob': serializer.toJson<DateTime?>(dob),
      'sex': serializer.toJson<String?>(sex),
      'weightKg': serializer.toJson<double?>(weightKg),
      'heightCm': serializer.toJson<double?>(heightCm),
      'allergies': serializer.toJson<String?>(allergies),
      'createdBy': serializer.toJson<String?>(createdBy),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Patient copyWith(
          {String? id,
          Value<String?> hospitalId = const Value.absent(),
          Value<String?> ownerUserId = const Value.absent(),
          Value<String?> mrn = const Value.absent(),
          Value<String?> initials = const Value.absent(),
          Value<String?> fullName = const Value.absent(),
          Value<DateTime?> dob = const Value.absent(),
          Value<String?> sex = const Value.absent(),
          Value<double?> weightKg = const Value.absent(),
          Value<double?> heightCm = const Value.absent(),
          Value<String?> allergies = const Value.absent(),
          Value<String?> createdBy = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Patient(
        id: id ?? this.id,
        hospitalId: hospitalId.present ? hospitalId.value : this.hospitalId,
        ownerUserId: ownerUserId.present ? ownerUserId.value : this.ownerUserId,
        mrn: mrn.present ? mrn.value : this.mrn,
        initials: initials.present ? initials.value : this.initials,
        fullName: fullName.present ? fullName.value : this.fullName,
        dob: dob.present ? dob.value : this.dob,
        sex: sex.present ? sex.value : this.sex,
        weightKg: weightKg.present ? weightKg.value : this.weightKg,
        heightCm: heightCm.present ? heightCm.value : this.heightCm,
        allergies: allergies.present ? allergies.value : this.allergies,
        createdBy: createdBy.present ? createdBy.value : this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Patient copyWithCompanion(PatientsCompanion data) {
    return Patient(
      id: data.id.present ? data.id.value : this.id,
      hospitalId:
          data.hospitalId.present ? data.hospitalId.value : this.hospitalId,
      ownerUserId:
          data.ownerUserId.present ? data.ownerUserId.value : this.ownerUserId,
      mrn: data.mrn.present ? data.mrn.value : this.mrn,
      initials: data.initials.present ? data.initials.value : this.initials,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      dob: data.dob.present ? data.dob.value : this.dob,
      sex: data.sex.present ? data.sex.value : this.sex,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      heightCm: data.heightCm.present ? data.heightCm.value : this.heightCm,
      allergies: data.allergies.present ? data.allergies.value : this.allergies,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Patient(')
          ..write('id: $id, ')
          ..write('hospitalId: $hospitalId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('mrn: $mrn, ')
          ..write('initials: $initials, ')
          ..write('fullName: $fullName, ')
          ..write('dob: $dob, ')
          ..write('sex: $sex, ')
          ..write('weightKg: $weightKg, ')
          ..write('heightCm: $heightCm, ')
          ..write('allergies: $allergies, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      hospitalId,
      ownerUserId,
      mrn,
      initials,
      fullName,
      dob,
      sex,
      weightKg,
      heightCm,
      allergies,
      createdBy,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Patient &&
          other.id == this.id &&
          other.hospitalId == this.hospitalId &&
          other.ownerUserId == this.ownerUserId &&
          other.mrn == this.mrn &&
          other.initials == this.initials &&
          other.fullName == this.fullName &&
          other.dob == this.dob &&
          other.sex == this.sex &&
          other.weightKg == this.weightKg &&
          other.heightCm == this.heightCm &&
          other.allergies == this.allergies &&
          other.createdBy == this.createdBy &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PatientsCompanion extends UpdateCompanion<Patient> {
  final Value<String> id;
  final Value<String?> hospitalId;
  final Value<String?> ownerUserId;
  final Value<String?> mrn;
  final Value<String?> initials;
  final Value<String?> fullName;
  final Value<DateTime?> dob;
  final Value<String?> sex;
  final Value<double?> weightKg;
  final Value<double?> heightCm;
  final Value<String?> allergies;
  final Value<String?> createdBy;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PatientsCompanion({
    this.id = const Value.absent(),
    this.hospitalId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.mrn = const Value.absent(),
    this.initials = const Value.absent(),
    this.fullName = const Value.absent(),
    this.dob = const Value.absent(),
    this.sex = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.heightCm = const Value.absent(),
    this.allergies = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PatientsCompanion.insert({
    required String id,
    this.hospitalId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.mrn = const Value.absent(),
    this.initials = const Value.absent(),
    this.fullName = const Value.absent(),
    this.dob = const Value.absent(),
    this.sex = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.heightCm = const Value.absent(),
    this.allergies = const Value.absent(),
    this.createdBy = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Patient> custom({
    Expression<String>? id,
    Expression<String>? hospitalId,
    Expression<String>? ownerUserId,
    Expression<String>? mrn,
    Expression<String>? initials,
    Expression<String>? fullName,
    Expression<DateTime>? dob,
    Expression<String>? sex,
    Expression<double>? weightKg,
    Expression<double>? heightCm,
    Expression<String>? allergies,
    Expression<String>? createdBy,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hospitalId != null) 'hospital_id': hospitalId,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (mrn != null) 'mrn': mrn,
      if (initials != null) 'initials': initials,
      if (fullName != null) 'full_name': fullName,
      if (dob != null) 'dob': dob,
      if (sex != null) 'sex': sex,
      if (weightKg != null) 'weight_kg': weightKg,
      if (heightCm != null) 'height_cm': heightCm,
      if (allergies != null) 'allergies': allergies,
      if (createdBy != null) 'created_by': createdBy,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PatientsCompanion copyWith(
      {Value<String>? id,
      Value<String?>? hospitalId,
      Value<String?>? ownerUserId,
      Value<String?>? mrn,
      Value<String?>? initials,
      Value<String?>? fullName,
      Value<DateTime?>? dob,
      Value<String?>? sex,
      Value<double?>? weightKg,
      Value<double?>? heightCm,
      Value<String?>? allergies,
      Value<String?>? createdBy,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return PatientsCompanion(
      id: id ?? this.id,
      hospitalId: hospitalId ?? this.hospitalId,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      mrn: mrn ?? this.mrn,
      initials: initials ?? this.initials,
      fullName: fullName ?? this.fullName,
      dob: dob ?? this.dob,
      sex: sex ?? this.sex,
      weightKg: weightKg ?? this.weightKg,
      heightCm: heightCm ?? this.heightCm,
      allergies: allergies ?? this.allergies,
      createdBy: createdBy ?? this.createdBy,
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
    if (hospitalId.present) {
      map['hospital_id'] = Variable<String>(hospitalId.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (mrn.present) {
      map['mrn'] = Variable<String>(mrn.value);
    }
    if (initials.present) {
      map['initials'] = Variable<String>(initials.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (dob.present) {
      map['dob'] = Variable<DateTime>(dob.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (heightCm.present) {
      map['height_cm'] = Variable<double>(heightCm.value);
    }
    if (allergies.present) {
      map['allergies'] = Variable<String>(allergies.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
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
    return (StringBuffer('PatientsCompanion(')
          ..write('id: $id, ')
          ..write('hospitalId: $hospitalId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('mrn: $mrn, ')
          ..write('initials: $initials, ')
          ..write('fullName: $fullName, ')
          ..write('dob: $dob, ')
          ..write('sex: $sex, ')
          ..write('weightKg: $weightKg, ')
          ..write('heightCm: $heightCm, ')
          ..write('allergies: $allergies, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CaseSheetsTable extends CaseSheets
    with TableInfo<$CaseSheetsTable, CaseSheet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CaseSheetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<String> patientId = GeneratedColumn<String>(
      'patient_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
      'created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _currentVersionMeta =
      const VerificationMeta('currentVersion');
  @override
  late final GeneratedColumn<int> currentVersion = GeneratedColumn<int>(
      'current_version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, patientId, createdBy, currentVersion, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'case_sheets';
  @override
  VerificationContext validateIntegrity(Insertable<CaseSheet> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    }
    if (data.containsKey('current_version')) {
      context.handle(
          _currentVersionMeta,
          currentVersion.isAcceptableOrUnknown(
              data['current_version']!, _currentVersionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CaseSheet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CaseSheet(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}patient_id'])!,
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by']),
      currentVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_version'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CaseSheetsTable createAlias(String alias) {
    return $CaseSheetsTable(attachedDatabase, alias);
  }
}

class CaseSheet extends DataClass implements Insertable<CaseSheet> {
  final String id;
  final String patientId;
  final String? createdBy;
  final int currentVersion;
  final DateTime createdAt;
  final DateTime updatedAt;
  const CaseSheet(
      {required this.id,
      required this.patientId,
      this.createdBy,
      required this.currentVersion,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['patient_id'] = Variable<String>(patientId);
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    map['current_version'] = Variable<int>(currentVersion);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CaseSheetsCompanion toCompanion(bool nullToAbsent) {
    return CaseSheetsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      currentVersion: Value(currentVersion),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CaseSheet.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CaseSheet(
      id: serializer.fromJson<String>(json['id']),
      patientId: serializer.fromJson<String>(json['patientId']),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
      currentVersion: serializer.fromJson<int>(json['currentVersion']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'patientId': serializer.toJson<String>(patientId),
      'createdBy': serializer.toJson<String?>(createdBy),
      'currentVersion': serializer.toJson<int>(currentVersion),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CaseSheet copyWith(
          {String? id,
          String? patientId,
          Value<String?> createdBy = const Value.absent(),
          int? currentVersion,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      CaseSheet(
        id: id ?? this.id,
        patientId: patientId ?? this.patientId,
        createdBy: createdBy.present ? createdBy.value : this.createdBy,
        currentVersion: currentVersion ?? this.currentVersion,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  CaseSheet copyWithCompanion(CaseSheetsCompanion data) {
    return CaseSheet(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      currentVersion: data.currentVersion.present
          ? data.currentVersion.value
          : this.currentVersion,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CaseSheet(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('createdBy: $createdBy, ')
          ..write('currentVersion: $currentVersion, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, patientId, createdBy, currentVersion, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CaseSheet &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.createdBy == this.createdBy &&
          other.currentVersion == this.currentVersion &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CaseSheetsCompanion extends UpdateCompanion<CaseSheet> {
  final Value<String> id;
  final Value<String> patientId;
  final Value<String?> createdBy;
  final Value<int> currentVersion;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CaseSheetsCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.currentVersion = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CaseSheetsCompanion.insert({
    required String id,
    required String patientId,
    this.createdBy = const Value.absent(),
    this.currentVersion = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        patientId = Value(patientId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<CaseSheet> custom({
    Expression<String>? id,
    Expression<String>? patientId,
    Expression<String>? createdBy,
    Expression<int>? currentVersion,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (createdBy != null) 'created_by': createdBy,
      if (currentVersion != null) 'current_version': currentVersion,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CaseSheetsCompanion copyWith(
      {Value<String>? id,
      Value<String>? patientId,
      Value<String?>? createdBy,
      Value<int>? currentVersion,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return CaseSheetsCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      createdBy: createdBy ?? this.createdBy,
      currentVersion: currentVersion ?? this.currentVersion,
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
    if (patientId.present) {
      map['patient_id'] = Variable<String>(patientId.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (currentVersion.present) {
      map['current_version'] = Variable<int>(currentVersion.value);
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
    return (StringBuffer('CaseSheetsCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('createdBy: $createdBy, ')
          ..write('currentVersion: $currentVersion, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CaseUpdatesTable extends CaseUpdates
    with TableInfo<$CaseUpdatesTable, CaseUpdate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CaseUpdatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _caseIdMeta = const VerificationMeta('caseId');
  @override
  late final GeneratedColumn<String> caseId = GeneratedColumn<String>(
      'case_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _doctorIdMeta =
      const VerificationMeta('doctorId');
  @override
  late final GeneratedColumn<String> doctorId = GeneratedColumn<String>(
      'doctor_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _doctorNameMeta =
      const VerificationMeta('doctorName');
  @override
  late final GeneratedColumn<String> doctorName = GeneratedColumn<String>(
      'doctor_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _detailsMeta =
      const VerificationMeta('details');
  @override
  late final GeneratedColumn<String> details = GeneratedColumn<String>(
      'details', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtUtcMeta =
      const VerificationMeta('createdAtUtc');
  @override
  late final GeneratedColumn<DateTime> createdAtUtc = GeneratedColumn<DateTime>(
      'created_at_utc', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, caseId, doctorId, doctorName, details, createdAtUtc];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'case_updates';
  @override
  VerificationContext validateIntegrity(Insertable<CaseUpdate> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('case_id')) {
      context.handle(_caseIdMeta,
          caseId.isAcceptableOrUnknown(data['case_id']!, _caseIdMeta));
    } else if (isInserting) {
      context.missing(_caseIdMeta);
    }
    if (data.containsKey('doctor_id')) {
      context.handle(_doctorIdMeta,
          doctorId.isAcceptableOrUnknown(data['doctor_id']!, _doctorIdMeta));
    } else if (isInserting) {
      context.missing(_doctorIdMeta);
    }
    if (data.containsKey('doctor_name')) {
      context.handle(
          _doctorNameMeta,
          doctorName.isAcceptableOrUnknown(
              data['doctor_name']!, _doctorNameMeta));
    } else if (isInserting) {
      context.missing(_doctorNameMeta);
    }
    if (data.containsKey('details')) {
      context.handle(_detailsMeta,
          details.isAcceptableOrUnknown(data['details']!, _detailsMeta));
    } else if (isInserting) {
      context.missing(_detailsMeta);
    }
    if (data.containsKey('created_at_utc')) {
      context.handle(
          _createdAtUtcMeta,
          createdAtUtc.isAcceptableOrUnknown(
              data['created_at_utc']!, _createdAtUtcMeta));
    } else if (isInserting) {
      context.missing(_createdAtUtcMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CaseUpdate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CaseUpdate(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      caseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}case_id'])!,
      doctorId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}doctor_id'])!,
      doctorName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}doctor_name'])!,
      details: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}details'])!,
      createdAtUtc: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}created_at_utc'])!,
    );
  }

  @override
  $CaseUpdatesTable createAlias(String alias) {
    return $CaseUpdatesTable(attachedDatabase, alias);
  }
}

class CaseUpdate extends DataClass implements Insertable<CaseUpdate> {
  final String id;
  final String caseId;
  final String doctorId;
  final String doctorName;
  final String details;
  final DateTime createdAtUtc;
  const CaseUpdate(
      {required this.id,
      required this.caseId,
      required this.doctorId,
      required this.doctorName,
      required this.details,
      required this.createdAtUtc});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['case_id'] = Variable<String>(caseId);
    map['doctor_id'] = Variable<String>(doctorId);
    map['doctor_name'] = Variable<String>(doctorName);
    map['details'] = Variable<String>(details);
    map['created_at_utc'] = Variable<DateTime>(createdAtUtc);
    return map;
  }

  CaseUpdatesCompanion toCompanion(bool nullToAbsent) {
    return CaseUpdatesCompanion(
      id: Value(id),
      caseId: Value(caseId),
      doctorId: Value(doctorId),
      doctorName: Value(doctorName),
      details: Value(details),
      createdAtUtc: Value(createdAtUtc),
    );
  }

  factory CaseUpdate.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CaseUpdate(
      id: serializer.fromJson<String>(json['id']),
      caseId: serializer.fromJson<String>(json['caseId']),
      doctorId: serializer.fromJson<String>(json['doctorId']),
      doctorName: serializer.fromJson<String>(json['doctorName']),
      details: serializer.fromJson<String>(json['details']),
      createdAtUtc: serializer.fromJson<DateTime>(json['createdAtUtc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'caseId': serializer.toJson<String>(caseId),
      'doctorId': serializer.toJson<String>(doctorId),
      'doctorName': serializer.toJson<String>(doctorName),
      'details': serializer.toJson<String>(details),
      'createdAtUtc': serializer.toJson<DateTime>(createdAtUtc),
    };
  }

  CaseUpdate copyWith(
          {String? id,
          String? caseId,
          String? doctorId,
          String? doctorName,
          String? details,
          DateTime? createdAtUtc}) =>
      CaseUpdate(
        id: id ?? this.id,
        caseId: caseId ?? this.caseId,
        doctorId: doctorId ?? this.doctorId,
        doctorName: doctorName ?? this.doctorName,
        details: details ?? this.details,
        createdAtUtc: createdAtUtc ?? this.createdAtUtc,
      );
  CaseUpdate copyWithCompanion(CaseUpdatesCompanion data) {
    return CaseUpdate(
      id: data.id.present ? data.id.value : this.id,
      caseId: data.caseId.present ? data.caseId.value : this.caseId,
      doctorId: data.doctorId.present ? data.doctorId.value : this.doctorId,
      doctorName:
          data.doctorName.present ? data.doctorName.value : this.doctorName,
      details: data.details.present ? data.details.value : this.details,
      createdAtUtc: data.createdAtUtc.present
          ? data.createdAtUtc.value
          : this.createdAtUtc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CaseUpdate(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('doctorId: $doctorId, ')
          ..write('doctorName: $doctorName, ')
          ..write('details: $details, ')
          ..write('createdAtUtc: $createdAtUtc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, caseId, doctorId, doctorName, details, createdAtUtc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CaseUpdate &&
          other.id == this.id &&
          other.caseId == this.caseId &&
          other.doctorId == this.doctorId &&
          other.doctorName == this.doctorName &&
          other.details == this.details &&
          other.createdAtUtc == this.createdAtUtc);
}

class CaseUpdatesCompanion extends UpdateCompanion<CaseUpdate> {
  final Value<String> id;
  final Value<String> caseId;
  final Value<String> doctorId;
  final Value<String> doctorName;
  final Value<String> details;
  final Value<DateTime> createdAtUtc;
  final Value<int> rowid;
  const CaseUpdatesCompanion({
    this.id = const Value.absent(),
    this.caseId = const Value.absent(),
    this.doctorId = const Value.absent(),
    this.doctorName = const Value.absent(),
    this.details = const Value.absent(),
    this.createdAtUtc = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CaseUpdatesCompanion.insert({
    required String id,
    required String caseId,
    required String doctorId,
    required String doctorName,
    required String details,
    required DateTime createdAtUtc,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        caseId = Value(caseId),
        doctorId = Value(doctorId),
        doctorName = Value(doctorName),
        details = Value(details),
        createdAtUtc = Value(createdAtUtc);
  static Insertable<CaseUpdate> custom({
    Expression<String>? id,
    Expression<String>? caseId,
    Expression<String>? doctorId,
    Expression<String>? doctorName,
    Expression<String>? details,
    Expression<DateTime>? createdAtUtc,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (caseId != null) 'case_id': caseId,
      if (doctorId != null) 'doctor_id': doctorId,
      if (doctorName != null) 'doctor_name': doctorName,
      if (details != null) 'details': details,
      if (createdAtUtc != null) 'created_at_utc': createdAtUtc,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CaseUpdatesCompanion copyWith(
      {Value<String>? id,
      Value<String>? caseId,
      Value<String>? doctorId,
      Value<String>? doctorName,
      Value<String>? details,
      Value<DateTime>? createdAtUtc,
      Value<int>? rowid}) {
    return CaseUpdatesCompanion(
      id: id ?? this.id,
      caseId: caseId ?? this.caseId,
      doctorId: doctorId ?? this.doctorId,
      doctorName: doctorName ?? this.doctorName,
      details: details ?? this.details,
      createdAtUtc: createdAtUtc ?? this.createdAtUtc,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (caseId.present) {
      map['case_id'] = Variable<String>(caseId.value);
    }
    if (doctorId.present) {
      map['doctor_id'] = Variable<String>(doctorId.value);
    }
    if (doctorName.present) {
      map['doctor_name'] = Variable<String>(doctorName.value);
    }
    if (details.present) {
      map['details'] = Variable<String>(details.value);
    }
    if (createdAtUtc.present) {
      map['created_at_utc'] = Variable<DateTime>(createdAtUtc.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CaseUpdatesCompanion(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('doctorId: $doctorId, ')
          ..write('doctorName: $doctorName, ')
          ..write('details: $details, ')
          ..write('createdAtUtc: $createdAtUtc, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AuditLogsTable extends AuditLogs
    with TableInfo<$AuditLogsTable, AuditLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _actorIdMeta =
      const VerificationMeta('actorId');
  @override
  late final GeneratedColumn<String> actorId = GeneratedColumn<String>(
      'actor_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
      'action', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entityMeta = const VerificationMeta('entity');
  @override
  late final GeneratedColumn<String> entity = GeneratedColumn<String>(
      'entity', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entityIdMeta =
      const VerificationMeta('entityId');
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
      'entity_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _beforeJsonMeta =
      const VerificationMeta('beforeJson');
  @override
  late final GeneratedColumn<String> beforeJson = GeneratedColumn<String>(
      'before_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _afterJsonMeta =
      const VerificationMeta('afterJson');
  @override
  late final GeneratedColumn<String> afterJson = GeneratedColumn<String>(
      'after_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtUtcMeta =
      const VerificationMeta('createdAtUtc');
  @override
  late final GeneratedColumn<DateTime> createdAtUtc = GeneratedColumn<DateTime>(
      'created_at_utc', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        actorId,
        action,
        entity,
        entityId,
        beforeJson,
        afterJson,
        createdAtUtc
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_logs';
  @override
  VerificationContext validateIntegrity(Insertable<AuditLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('actor_id')) {
      context.handle(_actorIdMeta,
          actorId.isAcceptableOrUnknown(data['actor_id']!, _actorIdMeta));
    } else if (isInserting) {
      context.missing(_actorIdMeta);
    }
    if (data.containsKey('action')) {
      context.handle(_actionMeta,
          action.isAcceptableOrUnknown(data['action']!, _actionMeta));
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('entity')) {
      context.handle(_entityMeta,
          entity.isAcceptableOrUnknown(data['entity']!, _entityMeta));
    } else if (isInserting) {
      context.missing(_entityMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(_entityIdMeta,
          entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta));
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('before_json')) {
      context.handle(
          _beforeJsonMeta,
          beforeJson.isAcceptableOrUnknown(
              data['before_json']!, _beforeJsonMeta));
    }
    if (data.containsKey('after_json')) {
      context.handle(_afterJsonMeta,
          afterJson.isAcceptableOrUnknown(data['after_json']!, _afterJsonMeta));
    }
    if (data.containsKey('created_at_utc')) {
      context.handle(
          _createdAtUtcMeta,
          createdAtUtc.isAcceptableOrUnknown(
              data['created_at_utc']!, _createdAtUtcMeta));
    } else if (isInserting) {
      context.missing(_createdAtUtcMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      actorId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}actor_id'])!,
      action: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action'])!,
      entity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity'])!,
      entityId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_id'])!,
      beforeJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}before_json']),
      afterJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}after_json']),
      createdAtUtc: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}created_at_utc'])!,
    );
  }

  @override
  $AuditLogsTable createAlias(String alias) {
    return $AuditLogsTable(attachedDatabase, alias);
  }
}

class AuditLog extends DataClass implements Insertable<AuditLog> {
  final String id;
  final String actorId;
  final String action;
  final String entity;
  final String entityId;
  final String? beforeJson;
  final String? afterJson;
  final DateTime createdAtUtc;
  const AuditLog(
      {required this.id,
      required this.actorId,
      required this.action,
      required this.entity,
      required this.entityId,
      this.beforeJson,
      this.afterJson,
      required this.createdAtUtc});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['actor_id'] = Variable<String>(actorId);
    map['action'] = Variable<String>(action);
    map['entity'] = Variable<String>(entity);
    map['entity_id'] = Variable<String>(entityId);
    if (!nullToAbsent || beforeJson != null) {
      map['before_json'] = Variable<String>(beforeJson);
    }
    if (!nullToAbsent || afterJson != null) {
      map['after_json'] = Variable<String>(afterJson);
    }
    map['created_at_utc'] = Variable<DateTime>(createdAtUtc);
    return map;
  }

  AuditLogsCompanion toCompanion(bool nullToAbsent) {
    return AuditLogsCompanion(
      id: Value(id),
      actorId: Value(actorId),
      action: Value(action),
      entity: Value(entity),
      entityId: Value(entityId),
      beforeJson: beforeJson == null && nullToAbsent
          ? const Value.absent()
          : Value(beforeJson),
      afterJson: afterJson == null && nullToAbsent
          ? const Value.absent()
          : Value(afterJson),
      createdAtUtc: Value(createdAtUtc),
    );
  }

  factory AuditLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditLog(
      id: serializer.fromJson<String>(json['id']),
      actorId: serializer.fromJson<String>(json['actorId']),
      action: serializer.fromJson<String>(json['action']),
      entity: serializer.fromJson<String>(json['entity']),
      entityId: serializer.fromJson<String>(json['entityId']),
      beforeJson: serializer.fromJson<String?>(json['beforeJson']),
      afterJson: serializer.fromJson<String?>(json['afterJson']),
      createdAtUtc: serializer.fromJson<DateTime>(json['createdAtUtc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'actorId': serializer.toJson<String>(actorId),
      'action': serializer.toJson<String>(action),
      'entity': serializer.toJson<String>(entity),
      'entityId': serializer.toJson<String>(entityId),
      'beforeJson': serializer.toJson<String?>(beforeJson),
      'afterJson': serializer.toJson<String?>(afterJson),
      'createdAtUtc': serializer.toJson<DateTime>(createdAtUtc),
    };
  }

  AuditLog copyWith(
          {String? id,
          String? actorId,
          String? action,
          String? entity,
          String? entityId,
          Value<String?> beforeJson = const Value.absent(),
          Value<String?> afterJson = const Value.absent(),
          DateTime? createdAtUtc}) =>
      AuditLog(
        id: id ?? this.id,
        actorId: actorId ?? this.actorId,
        action: action ?? this.action,
        entity: entity ?? this.entity,
        entityId: entityId ?? this.entityId,
        beforeJson: beforeJson.present ? beforeJson.value : this.beforeJson,
        afterJson: afterJson.present ? afterJson.value : this.afterJson,
        createdAtUtc: createdAtUtc ?? this.createdAtUtc,
      );
  AuditLog copyWithCompanion(AuditLogsCompanion data) {
    return AuditLog(
      id: data.id.present ? data.id.value : this.id,
      actorId: data.actorId.present ? data.actorId.value : this.actorId,
      action: data.action.present ? data.action.value : this.action,
      entity: data.entity.present ? data.entity.value : this.entity,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      beforeJson:
          data.beforeJson.present ? data.beforeJson.value : this.beforeJson,
      afterJson: data.afterJson.present ? data.afterJson.value : this.afterJson,
      createdAtUtc: data.createdAtUtc.present
          ? data.createdAtUtc.value
          : this.createdAtUtc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditLog(')
          ..write('id: $id, ')
          ..write('actorId: $actorId, ')
          ..write('action: $action, ')
          ..write('entity: $entity, ')
          ..write('entityId: $entityId, ')
          ..write('beforeJson: $beforeJson, ')
          ..write('afterJson: $afterJson, ')
          ..write('createdAtUtc: $createdAtUtc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, actorId, action, entity, entityId,
      beforeJson, afterJson, createdAtUtc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditLog &&
          other.id == this.id &&
          other.actorId == this.actorId &&
          other.action == this.action &&
          other.entity == this.entity &&
          other.entityId == this.entityId &&
          other.beforeJson == this.beforeJson &&
          other.afterJson == this.afterJson &&
          other.createdAtUtc == this.createdAtUtc);
}

class AuditLogsCompanion extends UpdateCompanion<AuditLog> {
  final Value<String> id;
  final Value<String> actorId;
  final Value<String> action;
  final Value<String> entity;
  final Value<String> entityId;
  final Value<String?> beforeJson;
  final Value<String?> afterJson;
  final Value<DateTime> createdAtUtc;
  final Value<int> rowid;
  const AuditLogsCompanion({
    this.id = const Value.absent(),
    this.actorId = const Value.absent(),
    this.action = const Value.absent(),
    this.entity = const Value.absent(),
    this.entityId = const Value.absent(),
    this.beforeJson = const Value.absent(),
    this.afterJson = const Value.absent(),
    this.createdAtUtc = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AuditLogsCompanion.insert({
    required String id,
    required String actorId,
    required String action,
    required String entity,
    required String entityId,
    this.beforeJson = const Value.absent(),
    this.afterJson = const Value.absent(),
    required DateTime createdAtUtc,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        actorId = Value(actorId),
        action = Value(action),
        entity = Value(entity),
        entityId = Value(entityId),
        createdAtUtc = Value(createdAtUtc);
  static Insertable<AuditLog> custom({
    Expression<String>? id,
    Expression<String>? actorId,
    Expression<String>? action,
    Expression<String>? entity,
    Expression<String>? entityId,
    Expression<String>? beforeJson,
    Expression<String>? afterJson,
    Expression<DateTime>? createdAtUtc,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (actorId != null) 'actor_id': actorId,
      if (action != null) 'action': action,
      if (entity != null) 'entity': entity,
      if (entityId != null) 'entity_id': entityId,
      if (beforeJson != null) 'before_json': beforeJson,
      if (afterJson != null) 'after_json': afterJson,
      if (createdAtUtc != null) 'created_at_utc': createdAtUtc,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AuditLogsCompanion copyWith(
      {Value<String>? id,
      Value<String>? actorId,
      Value<String>? action,
      Value<String>? entity,
      Value<String>? entityId,
      Value<String?>? beforeJson,
      Value<String?>? afterJson,
      Value<DateTime>? createdAtUtc,
      Value<int>? rowid}) {
    return AuditLogsCompanion(
      id: id ?? this.id,
      actorId: actorId ?? this.actorId,
      action: action ?? this.action,
      entity: entity ?? this.entity,
      entityId: entityId ?? this.entityId,
      beforeJson: beforeJson ?? this.beforeJson,
      afterJson: afterJson ?? this.afterJson,
      createdAtUtc: createdAtUtc ?? this.createdAtUtc,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (actorId.present) {
      map['actor_id'] = Variable<String>(actorId.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (entity.present) {
      map['entity'] = Variable<String>(entity.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (beforeJson.present) {
      map['before_json'] = Variable<String>(beforeJson.value);
    }
    if (afterJson.present) {
      map['after_json'] = Variable<String>(afterJson.value);
    }
    if (createdAtUtc.present) {
      map['created_at_utc'] = Variable<DateTime>(createdAtUtc.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogsCompanion(')
          ..write('id: $id, ')
          ..write('actorId: $actorId, ')
          ..write('action: $action, ')
          ..write('entity: $entity, ')
          ..write('entityId: $entityId, ')
          ..write('beforeJson: $beforeJson, ')
          ..write('afterJson: $afterJson, ')
          ..write('createdAtUtc: $createdAtUtc, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTable extends SyncQueue
    with TableInfo<$SyncQueueTable, SyncQueueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _endpointMeta =
      const VerificationMeta('endpoint');
  @override
  late final GeneratedColumn<String> endpoint = GeneratedColumn<String>(
      'endpoint', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _payloadJsonMeta =
      const VerificationMeta('payloadJson');
  @override
  late final GeneratedColumn<String> payloadJson = GeneratedColumn<String>(
      'payload_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _attemptsMeta =
      const VerificationMeta('attempts');
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
      'attempts', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastErrorMeta =
      const VerificationMeta('lastError');
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
      'last_error', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, endpoint, payloadJson, attempts, lastError, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(Insertable<SyncQueueData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('endpoint')) {
      context.handle(_endpointMeta,
          endpoint.isAcceptableOrUnknown(data['endpoint']!, _endpointMeta));
    } else if (isInserting) {
      context.missing(_endpointMeta);
    }
    if (data.containsKey('payload_json')) {
      context.handle(
          _payloadJsonMeta,
          payloadJson.isAcceptableOrUnknown(
              data['payload_json']!, _payloadJsonMeta));
    } else if (isInserting) {
      context.missing(_payloadJsonMeta);
    }
    if (data.containsKey('attempts')) {
      context.handle(_attemptsMeta,
          attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta));
    }
    if (data.containsKey('last_error')) {
      context.handle(_lastErrorMeta,
          lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      endpoint: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}endpoint'])!,
      payloadJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload_json'])!,
      attempts: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}attempts'])!,
      lastError: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_error']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $SyncQueueTable createAlias(String alias) {
    return $SyncQueueTable(attachedDatabase, alias);
  }
}

class SyncQueueData extends DataClass implements Insertable<SyncQueueData> {
  final String id;
  final String endpoint;
  final String payloadJson;
  final int attempts;
  final String? lastError;
  final DateTime createdAt;
  const SyncQueueData(
      {required this.id,
      required this.endpoint,
      required this.payloadJson,
      required this.attempts,
      this.lastError,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['endpoint'] = Variable<String>(endpoint);
    map['payload_json'] = Variable<String>(payloadJson);
    map['attempts'] = Variable<int>(attempts);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SyncQueueCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueCompanion(
      id: Value(id),
      endpoint: Value(endpoint),
      payloadJson: Value(payloadJson),
      attempts: Value(attempts),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
      createdAt: Value(createdAt),
    );
  }

  factory SyncQueueData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueData(
      id: serializer.fromJson<String>(json['id']),
      endpoint: serializer.fromJson<String>(json['endpoint']),
      payloadJson: serializer.fromJson<String>(json['payloadJson']),
      attempts: serializer.fromJson<int>(json['attempts']),
      lastError: serializer.fromJson<String?>(json['lastError']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'endpoint': serializer.toJson<String>(endpoint),
      'payloadJson': serializer.toJson<String>(payloadJson),
      'attempts': serializer.toJson<int>(attempts),
      'lastError': serializer.toJson<String?>(lastError),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SyncQueueData copyWith(
          {String? id,
          String? endpoint,
          String? payloadJson,
          int? attempts,
          Value<String?> lastError = const Value.absent(),
          DateTime? createdAt}) =>
      SyncQueueData(
        id: id ?? this.id,
        endpoint: endpoint ?? this.endpoint,
        payloadJson: payloadJson ?? this.payloadJson,
        attempts: attempts ?? this.attempts,
        lastError: lastError.present ? lastError.value : this.lastError,
        createdAt: createdAt ?? this.createdAt,
      );
  SyncQueueData copyWithCompanion(SyncQueueCompanion data) {
    return SyncQueueData(
      id: data.id.present ? data.id.value : this.id,
      endpoint: data.endpoint.present ? data.endpoint.value : this.endpoint,
      payloadJson:
          data.payloadJson.present ? data.payloadJson.value : this.payloadJson,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueData(')
          ..write('id: $id, ')
          ..write('endpoint: $endpoint, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('attempts: $attempts, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, endpoint, payloadJson, attempts, lastError, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueData &&
          other.id == this.id &&
          other.endpoint == this.endpoint &&
          other.payloadJson == this.payloadJson &&
          other.attempts == this.attempts &&
          other.lastError == this.lastError &&
          other.createdAt == this.createdAt);
}

class SyncQueueCompanion extends UpdateCompanion<SyncQueueData> {
  final Value<String> id;
  final Value<String> endpoint;
  final Value<String> payloadJson;
  final Value<int> attempts;
  final Value<String?> lastError;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const SyncQueueCompanion({
    this.id = const Value.absent(),
    this.endpoint = const Value.absent(),
    this.payloadJson = const Value.absent(),
    this.attempts = const Value.absent(),
    this.lastError = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncQueueCompanion.insert({
    required String id,
    required String endpoint,
    required String payloadJson,
    this.attempts = const Value.absent(),
    this.lastError = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        endpoint = Value(endpoint),
        payloadJson = Value(payloadJson),
        createdAt = Value(createdAt);
  static Insertable<SyncQueueData> custom({
    Expression<String>? id,
    Expression<String>? endpoint,
    Expression<String>? payloadJson,
    Expression<int>? attempts,
    Expression<String>? lastError,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (endpoint != null) 'endpoint': endpoint,
      if (payloadJson != null) 'payload_json': payloadJson,
      if (attempts != null) 'attempts': attempts,
      if (lastError != null) 'last_error': lastError,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncQueueCompanion copyWith(
      {Value<String>? id,
      Value<String>? endpoint,
      Value<String>? payloadJson,
      Value<int>? attempts,
      Value<String?>? lastError,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return SyncQueueCompanion(
      id: id ?? this.id,
      endpoint: endpoint ?? this.endpoint,
      payloadJson: payloadJson ?? this.payloadJson,
      attempts: attempts ?? this.attempts,
      lastError: lastError ?? this.lastError,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (endpoint.present) {
      map['endpoint'] = Variable<String>(endpoint.value);
    }
    if (payloadJson.present) {
      map['payload_json'] = Variable<String>(payloadJson.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueCompanion(')
          ..write('id: $id, ')
          ..write('endpoint: $endpoint, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('attempts: $attempts, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DeviceStatesTable extends DeviceStates
    with TableInfo<$DeviceStatesTable, DeviceState> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DeviceStatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deviceIdMeta =
      const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
      'device_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastPullAtMeta =
      const VerificationMeta('lastPullAt');
  @override
  late final GeneratedColumn<DateTime> lastPullAt = GeneratedColumn<DateTime>(
      'last_pull_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastPushAtMeta =
      const VerificationMeta('lastPushAt');
  @override
  late final GeneratedColumn<DateTime> lastPushAt = GeneratedColumn<DateTime>(
      'last_push_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _checksumMeta =
      const VerificationMeta('checksum');
  @override
  late final GeneratedColumn<String> checksum = GeneratedColumn<String>(
      'checksum', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, deviceId, lastPullAt, lastPushAt, checksum, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'device_states';
  @override
  VerificationContext validateIntegrity(Insertable<DeviceState> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('last_pull_at')) {
      context.handle(
          _lastPullAtMeta,
          lastPullAt.isAcceptableOrUnknown(
              data['last_pull_at']!, _lastPullAtMeta));
    }
    if (data.containsKey('last_push_at')) {
      context.handle(
          _lastPushAtMeta,
          lastPushAt.isAcceptableOrUnknown(
              data['last_push_at']!, _lastPushAtMeta));
    }
    if (data.containsKey('checksum')) {
      context.handle(_checksumMeta,
          checksum.isAcceptableOrUnknown(data['checksum']!, _checksumMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DeviceState map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeviceState(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      deviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_id'])!,
      lastPullAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_pull_at']),
      lastPushAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_push_at']),
      checksum: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}checksum']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $DeviceStatesTable createAlias(String alias) {
    return $DeviceStatesTable(attachedDatabase, alias);
  }
}

class DeviceState extends DataClass implements Insertable<DeviceState> {
  final String id;
  final String deviceId;
  final DateTime? lastPullAt;
  final DateTime? lastPushAt;
  final String? checksum;
  final DateTime updatedAt;
  const DeviceState(
      {required this.id,
      required this.deviceId,
      this.lastPullAt,
      this.lastPushAt,
      this.checksum,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['device_id'] = Variable<String>(deviceId);
    if (!nullToAbsent || lastPullAt != null) {
      map['last_pull_at'] = Variable<DateTime>(lastPullAt);
    }
    if (!nullToAbsent || lastPushAt != null) {
      map['last_push_at'] = Variable<DateTime>(lastPushAt);
    }
    if (!nullToAbsent || checksum != null) {
      map['checksum'] = Variable<String>(checksum);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DeviceStatesCompanion toCompanion(bool nullToAbsent) {
    return DeviceStatesCompanion(
      id: Value(id),
      deviceId: Value(deviceId),
      lastPullAt: lastPullAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPullAt),
      lastPushAt: lastPushAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPushAt),
      checksum: checksum == null && nullToAbsent
          ? const Value.absent()
          : Value(checksum),
      updatedAt: Value(updatedAt),
    );
  }

  factory DeviceState.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeviceState(
      id: serializer.fromJson<String>(json['id']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      lastPullAt: serializer.fromJson<DateTime?>(json['lastPullAt']),
      lastPushAt: serializer.fromJson<DateTime?>(json['lastPushAt']),
      checksum: serializer.fromJson<String?>(json['checksum']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'deviceId': serializer.toJson<String>(deviceId),
      'lastPullAt': serializer.toJson<DateTime?>(lastPullAt),
      'lastPushAt': serializer.toJson<DateTime?>(lastPushAt),
      'checksum': serializer.toJson<String?>(checksum),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DeviceState copyWith(
          {String? id,
          String? deviceId,
          Value<DateTime?> lastPullAt = const Value.absent(),
          Value<DateTime?> lastPushAt = const Value.absent(),
          Value<String?> checksum = const Value.absent(),
          DateTime? updatedAt}) =>
      DeviceState(
        id: id ?? this.id,
        deviceId: deviceId ?? this.deviceId,
        lastPullAt: lastPullAt.present ? lastPullAt.value : this.lastPullAt,
        lastPushAt: lastPushAt.present ? lastPushAt.value : this.lastPushAt,
        checksum: checksum.present ? checksum.value : this.checksum,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  DeviceState copyWithCompanion(DeviceStatesCompanion data) {
    return DeviceState(
      id: data.id.present ? data.id.value : this.id,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      lastPullAt:
          data.lastPullAt.present ? data.lastPullAt.value : this.lastPullAt,
      lastPushAt:
          data.lastPushAt.present ? data.lastPushAt.value : this.lastPushAt,
      checksum: data.checksum.present ? data.checksum.value : this.checksum,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DeviceState(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('lastPullAt: $lastPullAt, ')
          ..write('lastPushAt: $lastPushAt, ')
          ..write('checksum: $checksum, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, deviceId, lastPullAt, lastPushAt, checksum, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeviceState &&
          other.id == this.id &&
          other.deviceId == this.deviceId &&
          other.lastPullAt == this.lastPullAt &&
          other.lastPushAt == this.lastPushAt &&
          other.checksum == this.checksum &&
          other.updatedAt == this.updatedAt);
}

class DeviceStatesCompanion extends UpdateCompanion<DeviceState> {
  final Value<String> id;
  final Value<String> deviceId;
  final Value<DateTime?> lastPullAt;
  final Value<DateTime?> lastPushAt;
  final Value<String?> checksum;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const DeviceStatesCompanion({
    this.id = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.lastPullAt = const Value.absent(),
    this.lastPushAt = const Value.absent(),
    this.checksum = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DeviceStatesCompanion.insert({
    required String id,
    required String deviceId,
    this.lastPullAt = const Value.absent(),
    this.lastPushAt = const Value.absent(),
    this.checksum = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        deviceId = Value(deviceId),
        updatedAt = Value(updatedAt);
  static Insertable<DeviceState> custom({
    Expression<String>? id,
    Expression<String>? deviceId,
    Expression<DateTime>? lastPullAt,
    Expression<DateTime>? lastPushAt,
    Expression<String>? checksum,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deviceId != null) 'device_id': deviceId,
      if (lastPullAt != null) 'last_pull_at': lastPullAt,
      if (lastPushAt != null) 'last_push_at': lastPushAt,
      if (checksum != null) 'checksum': checksum,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DeviceStatesCompanion copyWith(
      {Value<String>? id,
      Value<String>? deviceId,
      Value<DateTime?>? lastPullAt,
      Value<DateTime?>? lastPushAt,
      Value<String?>? checksum,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return DeviceStatesCompanion(
      id: id ?? this.id,
      deviceId: deviceId ?? this.deviceId,
      lastPullAt: lastPullAt ?? this.lastPullAt,
      lastPushAt: lastPushAt ?? this.lastPushAt,
      checksum: checksum ?? this.checksum,
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
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (lastPullAt.present) {
      map['last_pull_at'] = Variable<DateTime>(lastPullAt.value);
    }
    if (lastPushAt.present) {
      map['last_push_at'] = Variable<DateTime>(lastPushAt.value);
    }
    if (checksum.present) {
      map['checksum'] = Variable<String>(checksum.value);
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
    return (StringBuffer('DeviceStatesCompanion(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('lastPullAt: $lastPullAt, ')
          ..write('lastPushAt: $lastPushAt, ')
          ..write('checksum: $checksum, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(Insertable<AppSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final String key;
  final String value;
  final DateTime updatedAt;
  const AppSetting(
      {required this.key, required this.value, required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory AppSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AppSetting copyWith({String? key, String? value, DateTime? updatedAt}) =>
      AppSetting(
        key: key ?? this.key,
        value: value ?? this.value,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<String> key;
  final Value<String> value;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String key,
    required String value,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : key = Value(key),
        value = Value(value),
        updatedAt = Value(updatedAt);
  static Insertable<AppSetting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith(
      {Value<String>? key,
      Value<String>? value,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return AppSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
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
    return (StringBuffer('AppSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DrugsTable extends Drugs with TableInfo<$DrugsTable, Drug> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DrugsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _atcCodeMeta =
      const VerificationMeta('atcCode');
  @override
  late final GeneratedColumn<String> atcCode = GeneratedColumn<String>(
      'atc_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _defaultRouteMeta =
      const VerificationMeta('defaultRoute');
  @override
  late final GeneratedColumn<String> defaultRoute = GeneratedColumn<String>(
      'default_route', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, atcCode, defaultRoute, notes, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drugs';
  @override
  VerificationContext validateIntegrity(Insertable<Drug> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('atc_code')) {
      context.handle(_atcCodeMeta,
          atcCode.isAcceptableOrUnknown(data['atc_code']!, _atcCodeMeta));
    }
    if (data.containsKey('default_route')) {
      context.handle(
          _defaultRouteMeta,
          defaultRoute.isAcceptableOrUnknown(
              data['default_route']!, _defaultRouteMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Drug map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Drug(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      atcCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}atc_code']),
      defaultRoute: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}default_route']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $DrugsTable createAlias(String alias) {
    return $DrugsTable(attachedDatabase, alias);
  }
}

class Drug extends DataClass implements Insertable<Drug> {
  final String id;
  final String name;
  final String? atcCode;
  final String? defaultRoute;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Drug(
      {required this.id,
      required this.name,
      this.atcCode,
      this.defaultRoute,
      this.notes,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || atcCode != null) {
      map['atc_code'] = Variable<String>(atcCode);
    }
    if (!nullToAbsent || defaultRoute != null) {
      map['default_route'] = Variable<String>(defaultRoute);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DrugsCompanion toCompanion(bool nullToAbsent) {
    return DrugsCompanion(
      id: Value(id),
      name: Value(name),
      atcCode: atcCode == null && nullToAbsent
          ? const Value.absent()
          : Value(atcCode),
      defaultRoute: defaultRoute == null && nullToAbsent
          ? const Value.absent()
          : Value(defaultRoute),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Drug.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Drug(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      atcCode: serializer.fromJson<String?>(json['atcCode']),
      defaultRoute: serializer.fromJson<String?>(json['defaultRoute']),
      notes: serializer.fromJson<String?>(json['notes']),
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
      'atcCode': serializer.toJson<String?>(atcCode),
      'defaultRoute': serializer.toJson<String?>(defaultRoute),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Drug copyWith(
          {String? id,
          String? name,
          Value<String?> atcCode = const Value.absent(),
          Value<String?> defaultRoute = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Drug(
        id: id ?? this.id,
        name: name ?? this.name,
        atcCode: atcCode.present ? atcCode.value : this.atcCode,
        defaultRoute:
            defaultRoute.present ? defaultRoute.value : this.defaultRoute,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Drug copyWithCompanion(DrugsCompanion data) {
    return Drug(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      atcCode: data.atcCode.present ? data.atcCode.value : this.atcCode,
      defaultRoute: data.defaultRoute.present
          ? data.defaultRoute.value
          : this.defaultRoute,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Drug(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('atcCode: $atcCode, ')
          ..write('defaultRoute: $defaultRoute, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, atcCode, defaultRoute, notes, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Drug &&
          other.id == this.id &&
          other.name == this.name &&
          other.atcCode == this.atcCode &&
          other.defaultRoute == this.defaultRoute &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DrugsCompanion extends UpdateCompanion<Drug> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> atcCode;
  final Value<String?> defaultRoute;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const DrugsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.atcCode = const Value.absent(),
    this.defaultRoute = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DrugsCompanion.insert({
    required String id,
    required String name,
    this.atcCode = const Value.absent(),
    this.defaultRoute = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Drug> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? atcCode,
    Expression<String>? defaultRoute,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (atcCode != null) 'atc_code': atcCode,
      if (defaultRoute != null) 'default_route': defaultRoute,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DrugsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? atcCode,
      Value<String?>? defaultRoute,
      Value<String?>? notes,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return DrugsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      atcCode: atcCode ?? this.atcCode,
      defaultRoute: defaultRoute ?? this.defaultRoute,
      notes: notes ?? this.notes,
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
    if (atcCode.present) {
      map['atc_code'] = Variable<String>(atcCode.value);
    }
    if (defaultRoute.present) {
      map['default_route'] = Variable<String>(defaultRoute.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
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
    return (StringBuffer('DrugsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('atcCode: $atcCode, ')
          ..write('defaultRoute: $defaultRoute, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DrugConcentrationsTable extends DrugConcentrations
    with TableInfo<$DrugConcentrationsTable, DrugConcentration> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DrugConcentrationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _drugIdMeta = const VerificationMeta('drugId');
  @override
  late final GeneratedColumn<String> drugId = GeneratedColumn<String>(
      'drug_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mgPerMlMeta =
      const VerificationMeta('mgPerMl');
  @override
  late final GeneratedColumn<double> mgPerMl = GeneratedColumn<double>(
      'mg_per_ml', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _displayTextMeta =
      const VerificationMeta('displayText');
  @override
  late final GeneratedColumn<String> displayText = GeneratedColumn<String>(
      'display_text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _routeMeta = const VerificationMeta('route');
  @override
  late final GeneratedColumn<String> route = GeneratedColumn<String>(
      'route', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, drugId, mgPerMl, displayText, route];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drug_concentrations';
  @override
  VerificationContext validateIntegrity(Insertable<DrugConcentration> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('drug_id')) {
      context.handle(_drugIdMeta,
          drugId.isAcceptableOrUnknown(data['drug_id']!, _drugIdMeta));
    } else if (isInserting) {
      context.missing(_drugIdMeta);
    }
    if (data.containsKey('mg_per_ml')) {
      context.handle(_mgPerMlMeta,
          mgPerMl.isAcceptableOrUnknown(data['mg_per_ml']!, _mgPerMlMeta));
    } else if (isInserting) {
      context.missing(_mgPerMlMeta);
    }
    if (data.containsKey('display_text')) {
      context.handle(
          _displayTextMeta,
          displayText.isAcceptableOrUnknown(
              data['display_text']!, _displayTextMeta));
    } else if (isInserting) {
      context.missing(_displayTextMeta);
    }
    if (data.containsKey('route')) {
      context.handle(
          _routeMeta, route.isAcceptableOrUnknown(data['route']!, _routeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DrugConcentration map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DrugConcentration(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      drugId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}drug_id'])!,
      mgPerMl: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}mg_per_ml'])!,
      displayText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_text'])!,
      route: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}route']),
    );
  }

  @override
  $DrugConcentrationsTable createAlias(String alias) {
    return $DrugConcentrationsTable(attachedDatabase, alias);
  }
}

class DrugConcentration extends DataClass
    implements Insertable<DrugConcentration> {
  final String id;
  final String drugId;
  final double mgPerMl;
  final String displayText;
  final String? route;
  const DrugConcentration(
      {required this.id,
      required this.drugId,
      required this.mgPerMl,
      required this.displayText,
      this.route});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['drug_id'] = Variable<String>(drugId);
    map['mg_per_ml'] = Variable<double>(mgPerMl);
    map['display_text'] = Variable<String>(displayText);
    if (!nullToAbsent || route != null) {
      map['route'] = Variable<String>(route);
    }
    return map;
  }

  DrugConcentrationsCompanion toCompanion(bool nullToAbsent) {
    return DrugConcentrationsCompanion(
      id: Value(id),
      drugId: Value(drugId),
      mgPerMl: Value(mgPerMl),
      displayText: Value(displayText),
      route:
          route == null && nullToAbsent ? const Value.absent() : Value(route),
    );
  }

  factory DrugConcentration.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DrugConcentration(
      id: serializer.fromJson<String>(json['id']),
      drugId: serializer.fromJson<String>(json['drugId']),
      mgPerMl: serializer.fromJson<double>(json['mgPerMl']),
      displayText: serializer.fromJson<String>(json['displayText']),
      route: serializer.fromJson<String?>(json['route']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'drugId': serializer.toJson<String>(drugId),
      'mgPerMl': serializer.toJson<double>(mgPerMl),
      'displayText': serializer.toJson<String>(displayText),
      'route': serializer.toJson<String?>(route),
    };
  }

  DrugConcentration copyWith(
          {String? id,
          String? drugId,
          double? mgPerMl,
          String? displayText,
          Value<String?> route = const Value.absent()}) =>
      DrugConcentration(
        id: id ?? this.id,
        drugId: drugId ?? this.drugId,
        mgPerMl: mgPerMl ?? this.mgPerMl,
        displayText: displayText ?? this.displayText,
        route: route.present ? route.value : this.route,
      );
  DrugConcentration copyWithCompanion(DrugConcentrationsCompanion data) {
    return DrugConcentration(
      id: data.id.present ? data.id.value : this.id,
      drugId: data.drugId.present ? data.drugId.value : this.drugId,
      mgPerMl: data.mgPerMl.present ? data.mgPerMl.value : this.mgPerMl,
      displayText:
          data.displayText.present ? data.displayText.value : this.displayText,
      route: data.route.present ? data.route.value : this.route,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DrugConcentration(')
          ..write('id: $id, ')
          ..write('drugId: $drugId, ')
          ..write('mgPerMl: $mgPerMl, ')
          ..write('displayText: $displayText, ')
          ..write('route: $route')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, drugId, mgPerMl, displayText, route);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DrugConcentration &&
          other.id == this.id &&
          other.drugId == this.drugId &&
          other.mgPerMl == this.mgPerMl &&
          other.displayText == this.displayText &&
          other.route == this.route);
}

class DrugConcentrationsCompanion extends UpdateCompanion<DrugConcentration> {
  final Value<String> id;
  final Value<String> drugId;
  final Value<double> mgPerMl;
  final Value<String> displayText;
  final Value<String?> route;
  final Value<int> rowid;
  const DrugConcentrationsCompanion({
    this.id = const Value.absent(),
    this.drugId = const Value.absent(),
    this.mgPerMl = const Value.absent(),
    this.displayText = const Value.absent(),
    this.route = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DrugConcentrationsCompanion.insert({
    required String id,
    required String drugId,
    required double mgPerMl,
    required String displayText,
    this.route = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        drugId = Value(drugId),
        mgPerMl = Value(mgPerMl),
        displayText = Value(displayText);
  static Insertable<DrugConcentration> custom({
    Expression<String>? id,
    Expression<String>? drugId,
    Expression<double>? mgPerMl,
    Expression<String>? displayText,
    Expression<String>? route,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (drugId != null) 'drug_id': drugId,
      if (mgPerMl != null) 'mg_per_ml': mgPerMl,
      if (displayText != null) 'display_text': displayText,
      if (route != null) 'route': route,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DrugConcentrationsCompanion copyWith(
      {Value<String>? id,
      Value<String>? drugId,
      Value<double>? mgPerMl,
      Value<String>? displayText,
      Value<String?>? route,
      Value<int>? rowid}) {
    return DrugConcentrationsCompanion(
      id: id ?? this.id,
      drugId: drugId ?? this.drugId,
      mgPerMl: mgPerMl ?? this.mgPerMl,
      displayText: displayText ?? this.displayText,
      route: route ?? this.route,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (drugId.present) {
      map['drug_id'] = Variable<String>(drugId.value);
    }
    if (mgPerMl.present) {
      map['mg_per_ml'] = Variable<double>(mgPerMl.value);
    }
    if (displayText.present) {
      map['display_text'] = Variable<String>(displayText.value);
    }
    if (route.present) {
      map['route'] = Variable<String>(route.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DrugConcentrationsCompanion(')
          ..write('id: $id, ')
          ..write('drugId: $drugId, ')
          ..write('mgPerMl: $mgPerMl, ')
          ..write('displayText: $displayText, ')
          ..write('route: $route, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DoseRulesTable extends DoseRules
    with TableInfo<$DoseRulesTable, DoseRule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DoseRulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _drugIdMeta = const VerificationMeta('drugId');
  @override
  late final GeneratedColumn<String> drugId = GeneratedColumn<String>(
      'drug_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _basisMeta = const VerificationMeta('basis');
  @override
  late final GeneratedColumn<String> basis = GeneratedColumn<String>(
      'basis', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _minPerKgMeta =
      const VerificationMeta('minPerKg');
  @override
  late final GeneratedColumn<double> minPerKg = GeneratedColumn<double>(
      'min_per_kg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _maxPerKgMeta =
      const VerificationMeta('maxPerKg');
  @override
  late final GeneratedColumn<double> maxPerKg = GeneratedColumn<double>(
      'max_per_kg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _maxPerDoseAbsMeta =
      const VerificationMeta('maxPerDoseAbs');
  @override
  late final GeneratedColumn<double> maxPerDoseAbs = GeneratedColumn<double>(
      'max_per_dose_abs', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _maxPerDayAbsMeta =
      const VerificationMeta('maxPerDayAbs');
  @override
  late final GeneratedColumn<double> maxPerDayAbs = GeneratedColumn<double>(
      'max_per_day_abs', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _roundingRuleMeta =
      const VerificationMeta('roundingRule');
  @override
  late final GeneratedColumn<String> roundingRule = GeneratedColumn<String>(
      'rounding_rule', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ageMinMonthsMeta =
      const VerificationMeta('ageMinMonths');
  @override
  late final GeneratedColumn<int> ageMinMonths = GeneratedColumn<int>(
      'age_min_months', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _ageMaxMonthsMeta =
      const VerificationMeta('ageMaxMonths');
  @override
  late final GeneratedColumn<int> ageMaxMonths = GeneratedColumn<int>(
      'age_max_months', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _renalAdjJsonMeta =
      const VerificationMeta('renalAdjJson');
  @override
  late final GeneratedColumn<String> renalAdjJson = GeneratedColumn<String>(
      'renal_adj_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _hepaticAdjJsonMeta =
      const VerificationMeta('hepaticAdjJson');
  @override
  late final GeneratedColumn<String> hepaticAdjJson = GeneratedColumn<String>(
      'hepatic_adj_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        drugId,
        basis,
        minPerKg,
        maxPerKg,
        maxPerDoseAbs,
        maxPerDayAbs,
        roundingRule,
        ageMinMonths,
        ageMaxMonths,
        renalAdjJson,
        hepaticAdjJson
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dose_rules';
  @override
  VerificationContext validateIntegrity(Insertable<DoseRule> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('drug_id')) {
      context.handle(_drugIdMeta,
          drugId.isAcceptableOrUnknown(data['drug_id']!, _drugIdMeta));
    } else if (isInserting) {
      context.missing(_drugIdMeta);
    }
    if (data.containsKey('basis')) {
      context.handle(
          _basisMeta, basis.isAcceptableOrUnknown(data['basis']!, _basisMeta));
    } else if (isInserting) {
      context.missing(_basisMeta);
    }
    if (data.containsKey('min_per_kg')) {
      context.handle(_minPerKgMeta,
          minPerKg.isAcceptableOrUnknown(data['min_per_kg']!, _minPerKgMeta));
    }
    if (data.containsKey('max_per_kg')) {
      context.handle(_maxPerKgMeta,
          maxPerKg.isAcceptableOrUnknown(data['max_per_kg']!, _maxPerKgMeta));
    }
    if (data.containsKey('max_per_dose_abs')) {
      context.handle(
          _maxPerDoseAbsMeta,
          maxPerDoseAbs.isAcceptableOrUnknown(
              data['max_per_dose_abs']!, _maxPerDoseAbsMeta));
    }
    if (data.containsKey('max_per_day_abs')) {
      context.handle(
          _maxPerDayAbsMeta,
          maxPerDayAbs.isAcceptableOrUnknown(
              data['max_per_day_abs']!, _maxPerDayAbsMeta));
    }
    if (data.containsKey('rounding_rule')) {
      context.handle(
          _roundingRuleMeta,
          roundingRule.isAcceptableOrUnknown(
              data['rounding_rule']!, _roundingRuleMeta));
    }
    if (data.containsKey('age_min_months')) {
      context.handle(
          _ageMinMonthsMeta,
          ageMinMonths.isAcceptableOrUnknown(
              data['age_min_months']!, _ageMinMonthsMeta));
    }
    if (data.containsKey('age_max_months')) {
      context.handle(
          _ageMaxMonthsMeta,
          ageMaxMonths.isAcceptableOrUnknown(
              data['age_max_months']!, _ageMaxMonthsMeta));
    }
    if (data.containsKey('renal_adj_json')) {
      context.handle(
          _renalAdjJsonMeta,
          renalAdjJson.isAcceptableOrUnknown(
              data['renal_adj_json']!, _renalAdjJsonMeta));
    }
    if (data.containsKey('hepatic_adj_json')) {
      context.handle(
          _hepaticAdjJsonMeta,
          hepaticAdjJson.isAcceptableOrUnknown(
              data['hepatic_adj_json']!, _hepaticAdjJsonMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DoseRule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DoseRule(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      drugId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}drug_id'])!,
      basis: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}basis'])!,
      minPerKg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}min_per_kg']),
      maxPerKg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}max_per_kg']),
      maxPerDoseAbs: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}max_per_dose_abs']),
      maxPerDayAbs: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}max_per_day_abs']),
      roundingRule: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rounding_rule']),
      ageMinMonths: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age_min_months']),
      ageMaxMonths: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age_max_months']),
      renalAdjJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}renal_adj_json']),
      hepaticAdjJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}hepatic_adj_json']),
    );
  }

  @override
  $DoseRulesTable createAlias(String alias) {
    return $DoseRulesTable(attachedDatabase, alias);
  }
}

class DoseRule extends DataClass implements Insertable<DoseRule> {
  final String id;
  final String drugId;
  final String basis;
  final double? minPerKg;
  final double? maxPerKg;
  final double? maxPerDoseAbs;
  final double? maxPerDayAbs;
  final String? roundingRule;
  final int? ageMinMonths;
  final int? ageMaxMonths;
  final String? renalAdjJson;
  final String? hepaticAdjJson;
  const DoseRule(
      {required this.id,
      required this.drugId,
      required this.basis,
      this.minPerKg,
      this.maxPerKg,
      this.maxPerDoseAbs,
      this.maxPerDayAbs,
      this.roundingRule,
      this.ageMinMonths,
      this.ageMaxMonths,
      this.renalAdjJson,
      this.hepaticAdjJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['drug_id'] = Variable<String>(drugId);
    map['basis'] = Variable<String>(basis);
    if (!nullToAbsent || minPerKg != null) {
      map['min_per_kg'] = Variable<double>(minPerKg);
    }
    if (!nullToAbsent || maxPerKg != null) {
      map['max_per_kg'] = Variable<double>(maxPerKg);
    }
    if (!nullToAbsent || maxPerDoseAbs != null) {
      map['max_per_dose_abs'] = Variable<double>(maxPerDoseAbs);
    }
    if (!nullToAbsent || maxPerDayAbs != null) {
      map['max_per_day_abs'] = Variable<double>(maxPerDayAbs);
    }
    if (!nullToAbsent || roundingRule != null) {
      map['rounding_rule'] = Variable<String>(roundingRule);
    }
    if (!nullToAbsent || ageMinMonths != null) {
      map['age_min_months'] = Variable<int>(ageMinMonths);
    }
    if (!nullToAbsent || ageMaxMonths != null) {
      map['age_max_months'] = Variable<int>(ageMaxMonths);
    }
    if (!nullToAbsent || renalAdjJson != null) {
      map['renal_adj_json'] = Variable<String>(renalAdjJson);
    }
    if (!nullToAbsent || hepaticAdjJson != null) {
      map['hepatic_adj_json'] = Variable<String>(hepaticAdjJson);
    }
    return map;
  }

  DoseRulesCompanion toCompanion(bool nullToAbsent) {
    return DoseRulesCompanion(
      id: Value(id),
      drugId: Value(drugId),
      basis: Value(basis),
      minPerKg: minPerKg == null && nullToAbsent
          ? const Value.absent()
          : Value(minPerKg),
      maxPerKg: maxPerKg == null && nullToAbsent
          ? const Value.absent()
          : Value(maxPerKg),
      maxPerDoseAbs: maxPerDoseAbs == null && nullToAbsent
          ? const Value.absent()
          : Value(maxPerDoseAbs),
      maxPerDayAbs: maxPerDayAbs == null && nullToAbsent
          ? const Value.absent()
          : Value(maxPerDayAbs),
      roundingRule: roundingRule == null && nullToAbsent
          ? const Value.absent()
          : Value(roundingRule),
      ageMinMonths: ageMinMonths == null && nullToAbsent
          ? const Value.absent()
          : Value(ageMinMonths),
      ageMaxMonths: ageMaxMonths == null && nullToAbsent
          ? const Value.absent()
          : Value(ageMaxMonths),
      renalAdjJson: renalAdjJson == null && nullToAbsent
          ? const Value.absent()
          : Value(renalAdjJson),
      hepaticAdjJson: hepaticAdjJson == null && nullToAbsent
          ? const Value.absent()
          : Value(hepaticAdjJson),
    );
  }

  factory DoseRule.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DoseRule(
      id: serializer.fromJson<String>(json['id']),
      drugId: serializer.fromJson<String>(json['drugId']),
      basis: serializer.fromJson<String>(json['basis']),
      minPerKg: serializer.fromJson<double?>(json['minPerKg']),
      maxPerKg: serializer.fromJson<double?>(json['maxPerKg']),
      maxPerDoseAbs: serializer.fromJson<double?>(json['maxPerDoseAbs']),
      maxPerDayAbs: serializer.fromJson<double?>(json['maxPerDayAbs']),
      roundingRule: serializer.fromJson<String?>(json['roundingRule']),
      ageMinMonths: serializer.fromJson<int?>(json['ageMinMonths']),
      ageMaxMonths: serializer.fromJson<int?>(json['ageMaxMonths']),
      renalAdjJson: serializer.fromJson<String?>(json['renalAdjJson']),
      hepaticAdjJson: serializer.fromJson<String?>(json['hepaticAdjJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'drugId': serializer.toJson<String>(drugId),
      'basis': serializer.toJson<String>(basis),
      'minPerKg': serializer.toJson<double?>(minPerKg),
      'maxPerKg': serializer.toJson<double?>(maxPerKg),
      'maxPerDoseAbs': serializer.toJson<double?>(maxPerDoseAbs),
      'maxPerDayAbs': serializer.toJson<double?>(maxPerDayAbs),
      'roundingRule': serializer.toJson<String?>(roundingRule),
      'ageMinMonths': serializer.toJson<int?>(ageMinMonths),
      'ageMaxMonths': serializer.toJson<int?>(ageMaxMonths),
      'renalAdjJson': serializer.toJson<String?>(renalAdjJson),
      'hepaticAdjJson': serializer.toJson<String?>(hepaticAdjJson),
    };
  }

  DoseRule copyWith(
          {String? id,
          String? drugId,
          String? basis,
          Value<double?> minPerKg = const Value.absent(),
          Value<double?> maxPerKg = const Value.absent(),
          Value<double?> maxPerDoseAbs = const Value.absent(),
          Value<double?> maxPerDayAbs = const Value.absent(),
          Value<String?> roundingRule = const Value.absent(),
          Value<int?> ageMinMonths = const Value.absent(),
          Value<int?> ageMaxMonths = const Value.absent(),
          Value<String?> renalAdjJson = const Value.absent(),
          Value<String?> hepaticAdjJson = const Value.absent()}) =>
      DoseRule(
        id: id ?? this.id,
        drugId: drugId ?? this.drugId,
        basis: basis ?? this.basis,
        minPerKg: minPerKg.present ? minPerKg.value : this.minPerKg,
        maxPerKg: maxPerKg.present ? maxPerKg.value : this.maxPerKg,
        maxPerDoseAbs:
            maxPerDoseAbs.present ? maxPerDoseAbs.value : this.maxPerDoseAbs,
        maxPerDayAbs:
            maxPerDayAbs.present ? maxPerDayAbs.value : this.maxPerDayAbs,
        roundingRule:
            roundingRule.present ? roundingRule.value : this.roundingRule,
        ageMinMonths:
            ageMinMonths.present ? ageMinMonths.value : this.ageMinMonths,
        ageMaxMonths:
            ageMaxMonths.present ? ageMaxMonths.value : this.ageMaxMonths,
        renalAdjJson:
            renalAdjJson.present ? renalAdjJson.value : this.renalAdjJson,
        hepaticAdjJson:
            hepaticAdjJson.present ? hepaticAdjJson.value : this.hepaticAdjJson,
      );
  DoseRule copyWithCompanion(DoseRulesCompanion data) {
    return DoseRule(
      id: data.id.present ? data.id.value : this.id,
      drugId: data.drugId.present ? data.drugId.value : this.drugId,
      basis: data.basis.present ? data.basis.value : this.basis,
      minPerKg: data.minPerKg.present ? data.minPerKg.value : this.minPerKg,
      maxPerKg: data.maxPerKg.present ? data.maxPerKg.value : this.maxPerKg,
      maxPerDoseAbs: data.maxPerDoseAbs.present
          ? data.maxPerDoseAbs.value
          : this.maxPerDoseAbs,
      maxPerDayAbs: data.maxPerDayAbs.present
          ? data.maxPerDayAbs.value
          : this.maxPerDayAbs,
      roundingRule: data.roundingRule.present
          ? data.roundingRule.value
          : this.roundingRule,
      ageMinMonths: data.ageMinMonths.present
          ? data.ageMinMonths.value
          : this.ageMinMonths,
      ageMaxMonths: data.ageMaxMonths.present
          ? data.ageMaxMonths.value
          : this.ageMaxMonths,
      renalAdjJson: data.renalAdjJson.present
          ? data.renalAdjJson.value
          : this.renalAdjJson,
      hepaticAdjJson: data.hepaticAdjJson.present
          ? data.hepaticAdjJson.value
          : this.hepaticAdjJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DoseRule(')
          ..write('id: $id, ')
          ..write('drugId: $drugId, ')
          ..write('basis: $basis, ')
          ..write('minPerKg: $minPerKg, ')
          ..write('maxPerKg: $maxPerKg, ')
          ..write('maxPerDoseAbs: $maxPerDoseAbs, ')
          ..write('maxPerDayAbs: $maxPerDayAbs, ')
          ..write('roundingRule: $roundingRule, ')
          ..write('ageMinMonths: $ageMinMonths, ')
          ..write('ageMaxMonths: $ageMaxMonths, ')
          ..write('renalAdjJson: $renalAdjJson, ')
          ..write('hepaticAdjJson: $hepaticAdjJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      drugId,
      basis,
      minPerKg,
      maxPerKg,
      maxPerDoseAbs,
      maxPerDayAbs,
      roundingRule,
      ageMinMonths,
      ageMaxMonths,
      renalAdjJson,
      hepaticAdjJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DoseRule &&
          other.id == this.id &&
          other.drugId == this.drugId &&
          other.basis == this.basis &&
          other.minPerKg == this.minPerKg &&
          other.maxPerKg == this.maxPerKg &&
          other.maxPerDoseAbs == this.maxPerDoseAbs &&
          other.maxPerDayAbs == this.maxPerDayAbs &&
          other.roundingRule == this.roundingRule &&
          other.ageMinMonths == this.ageMinMonths &&
          other.ageMaxMonths == this.ageMaxMonths &&
          other.renalAdjJson == this.renalAdjJson &&
          other.hepaticAdjJson == this.hepaticAdjJson);
}

class DoseRulesCompanion extends UpdateCompanion<DoseRule> {
  final Value<String> id;
  final Value<String> drugId;
  final Value<String> basis;
  final Value<double?> minPerKg;
  final Value<double?> maxPerKg;
  final Value<double?> maxPerDoseAbs;
  final Value<double?> maxPerDayAbs;
  final Value<String?> roundingRule;
  final Value<int?> ageMinMonths;
  final Value<int?> ageMaxMonths;
  final Value<String?> renalAdjJson;
  final Value<String?> hepaticAdjJson;
  final Value<int> rowid;
  const DoseRulesCompanion({
    this.id = const Value.absent(),
    this.drugId = const Value.absent(),
    this.basis = const Value.absent(),
    this.minPerKg = const Value.absent(),
    this.maxPerKg = const Value.absent(),
    this.maxPerDoseAbs = const Value.absent(),
    this.maxPerDayAbs = const Value.absent(),
    this.roundingRule = const Value.absent(),
    this.ageMinMonths = const Value.absent(),
    this.ageMaxMonths = const Value.absent(),
    this.renalAdjJson = const Value.absent(),
    this.hepaticAdjJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DoseRulesCompanion.insert({
    required String id,
    required String drugId,
    required String basis,
    this.minPerKg = const Value.absent(),
    this.maxPerKg = const Value.absent(),
    this.maxPerDoseAbs = const Value.absent(),
    this.maxPerDayAbs = const Value.absent(),
    this.roundingRule = const Value.absent(),
    this.ageMinMonths = const Value.absent(),
    this.ageMaxMonths = const Value.absent(),
    this.renalAdjJson = const Value.absent(),
    this.hepaticAdjJson = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        drugId = Value(drugId),
        basis = Value(basis);
  static Insertable<DoseRule> custom({
    Expression<String>? id,
    Expression<String>? drugId,
    Expression<String>? basis,
    Expression<double>? minPerKg,
    Expression<double>? maxPerKg,
    Expression<double>? maxPerDoseAbs,
    Expression<double>? maxPerDayAbs,
    Expression<String>? roundingRule,
    Expression<int>? ageMinMonths,
    Expression<int>? ageMaxMonths,
    Expression<String>? renalAdjJson,
    Expression<String>? hepaticAdjJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (drugId != null) 'drug_id': drugId,
      if (basis != null) 'basis': basis,
      if (minPerKg != null) 'min_per_kg': minPerKg,
      if (maxPerKg != null) 'max_per_kg': maxPerKg,
      if (maxPerDoseAbs != null) 'max_per_dose_abs': maxPerDoseAbs,
      if (maxPerDayAbs != null) 'max_per_day_abs': maxPerDayAbs,
      if (roundingRule != null) 'rounding_rule': roundingRule,
      if (ageMinMonths != null) 'age_min_months': ageMinMonths,
      if (ageMaxMonths != null) 'age_max_months': ageMaxMonths,
      if (renalAdjJson != null) 'renal_adj_json': renalAdjJson,
      if (hepaticAdjJson != null) 'hepatic_adj_json': hepaticAdjJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DoseRulesCompanion copyWith(
      {Value<String>? id,
      Value<String>? drugId,
      Value<String>? basis,
      Value<double?>? minPerKg,
      Value<double?>? maxPerKg,
      Value<double?>? maxPerDoseAbs,
      Value<double?>? maxPerDayAbs,
      Value<String?>? roundingRule,
      Value<int?>? ageMinMonths,
      Value<int?>? ageMaxMonths,
      Value<String?>? renalAdjJson,
      Value<String?>? hepaticAdjJson,
      Value<int>? rowid}) {
    return DoseRulesCompanion(
      id: id ?? this.id,
      drugId: drugId ?? this.drugId,
      basis: basis ?? this.basis,
      minPerKg: minPerKg ?? this.minPerKg,
      maxPerKg: maxPerKg ?? this.maxPerKg,
      maxPerDoseAbs: maxPerDoseAbs ?? this.maxPerDoseAbs,
      maxPerDayAbs: maxPerDayAbs ?? this.maxPerDayAbs,
      roundingRule: roundingRule ?? this.roundingRule,
      ageMinMonths: ageMinMonths ?? this.ageMinMonths,
      ageMaxMonths: ageMaxMonths ?? this.ageMaxMonths,
      renalAdjJson: renalAdjJson ?? this.renalAdjJson,
      hepaticAdjJson: hepaticAdjJson ?? this.hepaticAdjJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (drugId.present) {
      map['drug_id'] = Variable<String>(drugId.value);
    }
    if (basis.present) {
      map['basis'] = Variable<String>(basis.value);
    }
    if (minPerKg.present) {
      map['min_per_kg'] = Variable<double>(minPerKg.value);
    }
    if (maxPerKg.present) {
      map['max_per_kg'] = Variable<double>(maxPerKg.value);
    }
    if (maxPerDoseAbs.present) {
      map['max_per_dose_abs'] = Variable<double>(maxPerDoseAbs.value);
    }
    if (maxPerDayAbs.present) {
      map['max_per_day_abs'] = Variable<double>(maxPerDayAbs.value);
    }
    if (roundingRule.present) {
      map['rounding_rule'] = Variable<String>(roundingRule.value);
    }
    if (ageMinMonths.present) {
      map['age_min_months'] = Variable<int>(ageMinMonths.value);
    }
    if (ageMaxMonths.present) {
      map['age_max_months'] = Variable<int>(ageMaxMonths.value);
    }
    if (renalAdjJson.present) {
      map['renal_adj_json'] = Variable<String>(renalAdjJson.value);
    }
    if (hepaticAdjJson.present) {
      map['hepatic_adj_json'] = Variable<String>(hepaticAdjJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoseRulesCompanion(')
          ..write('id: $id, ')
          ..write('drugId: $drugId, ')
          ..write('basis: $basis, ')
          ..write('minPerKg: $minPerKg, ')
          ..write('maxPerKg: $maxPerKg, ')
          ..write('maxPerDoseAbs: $maxPerDoseAbs, ')
          ..write('maxPerDayAbs: $maxPerDayAbs, ')
          ..write('roundingRule: $roundingRule, ')
          ..write('ageMinMonths: $ageMinMonths, ')
          ..write('ageMaxMonths: $ageMaxMonths, ')
          ..write('renalAdjJson: $renalAdjJson, ')
          ..write('hepaticAdjJson: $hepaticAdjJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  $LocalDatabaseManager get managers => $LocalDatabaseManager(this);
  late final $HospitalsTable hospitals = $HospitalsTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $SubscriptionsTable subscriptions = $SubscriptionsTable(this);
  late final $PatientsTable patients = $PatientsTable(this);
  late final $CaseSheetsTable caseSheets = $CaseSheetsTable(this);
  late final $CaseUpdatesTable caseUpdates = $CaseUpdatesTable(this);
  late final $AuditLogsTable auditLogs = $AuditLogsTable(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  late final $DeviceStatesTable deviceStates = $DeviceStatesTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final $DrugsTable drugs = $DrugsTable(this);
  late final $DrugConcentrationsTable drugConcentrations =
      $DrugConcentrationsTable(this);
  late final $DoseRulesTable doseRules = $DoseRulesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        hospitals,
        users,
        subscriptions,
        patients,
        caseSheets,
        caseUpdates,
        auditLogs,
        syncQueue,
        deviceStates,
        appSettings,
        drugs,
        drugConcentrations,
        doseRules
      ];
}

typedef $$HospitalsTableCreateCompanionBuilder = HospitalsCompanion Function({
  required String id,
  required String name,
  required String code,
  required String uid,
  required String plan,
  required String status,
  Value<String?> ownerUserId,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$HospitalsTableUpdateCompanionBuilder = HospitalsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> code,
  Value<String> uid,
  Value<String> plan,
  Value<String> status,
  Value<String?> ownerUserId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$HospitalsTableFilterComposer
    extends Composer<_$LocalDatabase, $HospitalsTable> {
  $$HospitalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get plan => $composableBuilder(
      column: $table.plan, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ownerUserId => $composableBuilder(
      column: $table.ownerUserId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$HospitalsTableOrderingComposer
    extends Composer<_$LocalDatabase, $HospitalsTable> {
  $$HospitalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get plan => $composableBuilder(
      column: $table.plan, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ownerUserId => $composableBuilder(
      column: $table.ownerUserId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$HospitalsTableAnnotationComposer
    extends Composer<_$LocalDatabase, $HospitalsTable> {
  $$HospitalsTableAnnotationComposer({
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

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get plan =>
      $composableBuilder(column: $table.plan, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get ownerUserId => $composableBuilder(
      column: $table.ownerUserId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$HospitalsTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $HospitalsTable,
    Hospital,
    $$HospitalsTableFilterComposer,
    $$HospitalsTableOrderingComposer,
    $$HospitalsTableAnnotationComposer,
    $$HospitalsTableCreateCompanionBuilder,
    $$HospitalsTableUpdateCompanionBuilder,
    (Hospital, BaseReferences<_$LocalDatabase, $HospitalsTable, Hospital>),
    Hospital,
    PrefetchHooks Function()> {
  $$HospitalsTableTableManager(_$LocalDatabase db, $HospitalsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HospitalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HospitalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HospitalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> code = const Value.absent(),
            Value<String> uid = const Value.absent(),
            Value<String> plan = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> ownerUserId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HospitalsCompanion(
            id: id,
            name: name,
            code: code,
            uid: uid,
            plan: plan,
            status: status,
            ownerUserId: ownerUserId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String code,
            required String uid,
            required String plan,
            required String status,
            Value<String?> ownerUserId = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              HospitalsCompanion.insert(
            id: id,
            name: name,
            code: code,
            uid: uid,
            plan: plan,
            status: status,
            ownerUserId: ownerUserId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HospitalsTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $HospitalsTable,
    Hospital,
    $$HospitalsTableFilterComposer,
    $$HospitalsTableOrderingComposer,
    $$HospitalsTableAnnotationComposer,
    $$HospitalsTableCreateCompanionBuilder,
    $$HospitalsTableUpdateCompanionBuilder,
    (Hospital, BaseReferences<_$LocalDatabase, $HospitalsTable, Hospital>),
    Hospital,
    PrefetchHooks Function()>;
typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  required String id,
  required String name,
  required String email,
  Value<String?> phone,
  required String role,
  Value<String?> hospitalId,
  required String status,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> email,
  Value<String?> phone,
  Value<String> role,
  Value<String?> hospitalId,
  Value<String> status,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$UsersTableFilterComposer
    extends Composer<_$LocalDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hospitalId => $composableBuilder(
      column: $table.hospitalId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$UsersTableOrderingComposer
    extends Composer<_$LocalDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hospitalId => $composableBuilder(
      column: $table.hospitalId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$LocalDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
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

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get hospitalId => $composableBuilder(
      column: $table.hospitalId, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UsersTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$LocalDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()> {
  $$UsersTableTableManager(_$LocalDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String> role = const Value.absent(),
            Value<String?> hospitalId = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            name: name,
            email: email,
            phone: phone,
            role: role,
            hospitalId: hospitalId,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String email,
            Value<String?> phone = const Value.absent(),
            required String role,
            Value<String?> hospitalId = const Value.absent(),
            required String status,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            id: id,
            name: name,
            email: email,
            phone: phone,
            role: role,
            hospitalId: hospitalId,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$LocalDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()>;
typedef $$SubscriptionsTableCreateCompanionBuilder = SubscriptionsCompanion
    Function({
  required String id,
  required String subjectType,
  required String subjectId,
  required String planCode,
  required DateTime periodStart,
  required DateTime periodEnd,
  required String status,
  Value<int?> seats,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$SubscriptionsTableUpdateCompanionBuilder = SubscriptionsCompanion
    Function({
  Value<String> id,
  Value<String> subjectType,
  Value<String> subjectId,
  Value<String> planCode,
  Value<DateTime> periodStart,
  Value<DateTime> periodEnd,
  Value<String> status,
  Value<int?> seats,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$SubscriptionsTableFilterComposer
    extends Composer<_$LocalDatabase, $SubscriptionsTable> {
  $$SubscriptionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subjectType => $composableBuilder(
      column: $table.subjectType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subjectId => $composableBuilder(
      column: $table.subjectId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get planCode => $composableBuilder(
      column: $table.planCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get periodStart => $composableBuilder(
      column: $table.periodStart, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get periodEnd => $composableBuilder(
      column: $table.periodEnd, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get seats => $composableBuilder(
      column: $table.seats, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$SubscriptionsTableOrderingComposer
    extends Composer<_$LocalDatabase, $SubscriptionsTable> {
  $$SubscriptionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subjectType => $composableBuilder(
      column: $table.subjectType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subjectId => $composableBuilder(
      column: $table.subjectId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get planCode => $composableBuilder(
      column: $table.planCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get periodStart => $composableBuilder(
      column: $table.periodStart, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get periodEnd => $composableBuilder(
      column: $table.periodEnd, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get seats => $composableBuilder(
      column: $table.seats, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$SubscriptionsTableAnnotationComposer
    extends Composer<_$LocalDatabase, $SubscriptionsTable> {
  $$SubscriptionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get subjectType => $composableBuilder(
      column: $table.subjectType, builder: (column) => column);

  GeneratedColumn<String> get subjectId =>
      $composableBuilder(column: $table.subjectId, builder: (column) => column);

  GeneratedColumn<String> get planCode =>
      $composableBuilder(column: $table.planCode, builder: (column) => column);

  GeneratedColumn<DateTime> get periodStart => $composableBuilder(
      column: $table.periodStart, builder: (column) => column);

  GeneratedColumn<DateTime> get periodEnd =>
      $composableBuilder(column: $table.periodEnd, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get seats =>
      $composableBuilder(column: $table.seats, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SubscriptionsTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $SubscriptionsTable,
    Subscription,
    $$SubscriptionsTableFilterComposer,
    $$SubscriptionsTableOrderingComposer,
    $$SubscriptionsTableAnnotationComposer,
    $$SubscriptionsTableCreateCompanionBuilder,
    $$SubscriptionsTableUpdateCompanionBuilder,
    (
      Subscription,
      BaseReferences<_$LocalDatabase, $SubscriptionsTable, Subscription>
    ),
    Subscription,
    PrefetchHooks Function()> {
  $$SubscriptionsTableTableManager(
      _$LocalDatabase db, $SubscriptionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubscriptionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubscriptionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubscriptionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> subjectType = const Value.absent(),
            Value<String> subjectId = const Value.absent(),
            Value<String> planCode = const Value.absent(),
            Value<DateTime> periodStart = const Value.absent(),
            Value<DateTime> periodEnd = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int?> seats = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SubscriptionsCompanion(
            id: id,
            subjectType: subjectType,
            subjectId: subjectId,
            planCode: planCode,
            periodStart: periodStart,
            periodEnd: periodEnd,
            status: status,
            seats: seats,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String subjectType,
            required String subjectId,
            required String planCode,
            required DateTime periodStart,
            required DateTime periodEnd,
            required String status,
            Value<int?> seats = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              SubscriptionsCompanion.insert(
            id: id,
            subjectType: subjectType,
            subjectId: subjectId,
            planCode: planCode,
            periodStart: periodStart,
            periodEnd: periodEnd,
            status: status,
            seats: seats,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SubscriptionsTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $SubscriptionsTable,
    Subscription,
    $$SubscriptionsTableFilterComposer,
    $$SubscriptionsTableOrderingComposer,
    $$SubscriptionsTableAnnotationComposer,
    $$SubscriptionsTableCreateCompanionBuilder,
    $$SubscriptionsTableUpdateCompanionBuilder,
    (
      Subscription,
      BaseReferences<_$LocalDatabase, $SubscriptionsTable, Subscription>
    ),
    Subscription,
    PrefetchHooks Function()>;
typedef $$PatientsTableCreateCompanionBuilder = PatientsCompanion Function({
  required String id,
  Value<String?> hospitalId,
  Value<String?> ownerUserId,
  Value<String?> mrn,
  Value<String?> initials,
  Value<String?> fullName,
  Value<DateTime?> dob,
  Value<String?> sex,
  Value<double?> weightKg,
  Value<double?> heightCm,
  Value<String?> allergies,
  Value<String?> createdBy,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$PatientsTableUpdateCompanionBuilder = PatientsCompanion Function({
  Value<String> id,
  Value<String?> hospitalId,
  Value<String?> ownerUserId,
  Value<String?> mrn,
  Value<String?> initials,
  Value<String?> fullName,
  Value<DateTime?> dob,
  Value<String?> sex,
  Value<double?> weightKg,
  Value<double?> heightCm,
  Value<String?> allergies,
  Value<String?> createdBy,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$PatientsTableFilterComposer
    extends Composer<_$LocalDatabase, $PatientsTable> {
  $$PatientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hospitalId => $composableBuilder(
      column: $table.hospitalId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ownerUserId => $composableBuilder(
      column: $table.ownerUserId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mrn => $composableBuilder(
      column: $table.mrn, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get initials => $composableBuilder(
      column: $table.initials, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dob => $composableBuilder(
      column: $table.dob, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sex => $composableBuilder(
      column: $table.sex, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weightKg => $composableBuilder(
      column: $table.weightKg, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get heightCm => $composableBuilder(
      column: $table.heightCm, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get allergies => $composableBuilder(
      column: $table.allergies, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$PatientsTableOrderingComposer
    extends Composer<_$LocalDatabase, $PatientsTable> {
  $$PatientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hospitalId => $composableBuilder(
      column: $table.hospitalId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ownerUserId => $composableBuilder(
      column: $table.ownerUserId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mrn => $composableBuilder(
      column: $table.mrn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get initials => $composableBuilder(
      column: $table.initials, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dob => $composableBuilder(
      column: $table.dob, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sex => $composableBuilder(
      column: $table.sex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weightKg => $composableBuilder(
      column: $table.weightKg, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get heightCm => $composableBuilder(
      column: $table.heightCm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get allergies => $composableBuilder(
      column: $table.allergies, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$PatientsTableAnnotationComposer
    extends Composer<_$LocalDatabase, $PatientsTable> {
  $$PatientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get hospitalId => $composableBuilder(
      column: $table.hospitalId, builder: (column) => column);

  GeneratedColumn<String> get ownerUserId => $composableBuilder(
      column: $table.ownerUserId, builder: (column) => column);

  GeneratedColumn<String> get mrn =>
      $composableBuilder(column: $table.mrn, builder: (column) => column);

  GeneratedColumn<String> get initials =>
      $composableBuilder(column: $table.initials, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<DateTime> get dob =>
      $composableBuilder(column: $table.dob, builder: (column) => column);

  GeneratedColumn<String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<double> get heightCm =>
      $composableBuilder(column: $table.heightCm, builder: (column) => column);

  GeneratedColumn<String> get allergies =>
      $composableBuilder(column: $table.allergies, builder: (column) => column);

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PatientsTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $PatientsTable,
    Patient,
    $$PatientsTableFilterComposer,
    $$PatientsTableOrderingComposer,
    $$PatientsTableAnnotationComposer,
    $$PatientsTableCreateCompanionBuilder,
    $$PatientsTableUpdateCompanionBuilder,
    (Patient, BaseReferences<_$LocalDatabase, $PatientsTable, Patient>),
    Patient,
    PrefetchHooks Function()> {
  $$PatientsTableTableManager(_$LocalDatabase db, $PatientsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PatientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PatientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PatientsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> hospitalId = const Value.absent(),
            Value<String?> ownerUserId = const Value.absent(),
            Value<String?> mrn = const Value.absent(),
            Value<String?> initials = const Value.absent(),
            Value<String?> fullName = const Value.absent(),
            Value<DateTime?> dob = const Value.absent(),
            Value<String?> sex = const Value.absent(),
            Value<double?> weightKg = const Value.absent(),
            Value<double?> heightCm = const Value.absent(),
            Value<String?> allergies = const Value.absent(),
            Value<String?> createdBy = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PatientsCompanion(
            id: id,
            hospitalId: hospitalId,
            ownerUserId: ownerUserId,
            mrn: mrn,
            initials: initials,
            fullName: fullName,
            dob: dob,
            sex: sex,
            weightKg: weightKg,
            heightCm: heightCm,
            allergies: allergies,
            createdBy: createdBy,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> hospitalId = const Value.absent(),
            Value<String?> ownerUserId = const Value.absent(),
            Value<String?> mrn = const Value.absent(),
            Value<String?> initials = const Value.absent(),
            Value<String?> fullName = const Value.absent(),
            Value<DateTime?> dob = const Value.absent(),
            Value<String?> sex = const Value.absent(),
            Value<double?> weightKg = const Value.absent(),
            Value<double?> heightCm = const Value.absent(),
            Value<String?> allergies = const Value.absent(),
            Value<String?> createdBy = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              PatientsCompanion.insert(
            id: id,
            hospitalId: hospitalId,
            ownerUserId: ownerUserId,
            mrn: mrn,
            initials: initials,
            fullName: fullName,
            dob: dob,
            sex: sex,
            weightKg: weightKg,
            heightCm: heightCm,
            allergies: allergies,
            createdBy: createdBy,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PatientsTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $PatientsTable,
    Patient,
    $$PatientsTableFilterComposer,
    $$PatientsTableOrderingComposer,
    $$PatientsTableAnnotationComposer,
    $$PatientsTableCreateCompanionBuilder,
    $$PatientsTableUpdateCompanionBuilder,
    (Patient, BaseReferences<_$LocalDatabase, $PatientsTable, Patient>),
    Patient,
    PrefetchHooks Function()>;
typedef $$CaseSheetsTableCreateCompanionBuilder = CaseSheetsCompanion Function({
  required String id,
  required String patientId,
  Value<String?> createdBy,
  Value<int> currentVersion,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$CaseSheetsTableUpdateCompanionBuilder = CaseSheetsCompanion Function({
  Value<String> id,
  Value<String> patientId,
  Value<String?> createdBy,
  Value<int> currentVersion,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$CaseSheetsTableFilterComposer
    extends Composer<_$LocalDatabase, $CaseSheetsTable> {
  $$CaseSheetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get patientId => $composableBuilder(
      column: $table.patientId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentVersion => $composableBuilder(
      column: $table.currentVersion,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$CaseSheetsTableOrderingComposer
    extends Composer<_$LocalDatabase, $CaseSheetsTable> {
  $$CaseSheetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get patientId => $composableBuilder(
      column: $table.patientId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentVersion => $composableBuilder(
      column: $table.currentVersion,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$CaseSheetsTableAnnotationComposer
    extends Composer<_$LocalDatabase, $CaseSheetsTable> {
  $$CaseSheetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get patientId =>
      $composableBuilder(column: $table.patientId, builder: (column) => column);

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<int> get currentVersion => $composableBuilder(
      column: $table.currentVersion, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CaseSheetsTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $CaseSheetsTable,
    CaseSheet,
    $$CaseSheetsTableFilterComposer,
    $$CaseSheetsTableOrderingComposer,
    $$CaseSheetsTableAnnotationComposer,
    $$CaseSheetsTableCreateCompanionBuilder,
    $$CaseSheetsTableUpdateCompanionBuilder,
    (CaseSheet, BaseReferences<_$LocalDatabase, $CaseSheetsTable, CaseSheet>),
    CaseSheet,
    PrefetchHooks Function()> {
  $$CaseSheetsTableTableManager(_$LocalDatabase db, $CaseSheetsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CaseSheetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CaseSheetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CaseSheetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> patientId = const Value.absent(),
            Value<String?> createdBy = const Value.absent(),
            Value<int> currentVersion = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CaseSheetsCompanion(
            id: id,
            patientId: patientId,
            createdBy: createdBy,
            currentVersion: currentVersion,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String patientId,
            Value<String?> createdBy = const Value.absent(),
            Value<int> currentVersion = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              CaseSheetsCompanion.insert(
            id: id,
            patientId: patientId,
            createdBy: createdBy,
            currentVersion: currentVersion,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CaseSheetsTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $CaseSheetsTable,
    CaseSheet,
    $$CaseSheetsTableFilterComposer,
    $$CaseSheetsTableOrderingComposer,
    $$CaseSheetsTableAnnotationComposer,
    $$CaseSheetsTableCreateCompanionBuilder,
    $$CaseSheetsTableUpdateCompanionBuilder,
    (CaseSheet, BaseReferences<_$LocalDatabase, $CaseSheetsTable, CaseSheet>),
    CaseSheet,
    PrefetchHooks Function()>;
typedef $$CaseUpdatesTableCreateCompanionBuilder = CaseUpdatesCompanion
    Function({
  required String id,
  required String caseId,
  required String doctorId,
  required String doctorName,
  required String details,
  required DateTime createdAtUtc,
  Value<int> rowid,
});
typedef $$CaseUpdatesTableUpdateCompanionBuilder = CaseUpdatesCompanion
    Function({
  Value<String> id,
  Value<String> caseId,
  Value<String> doctorId,
  Value<String> doctorName,
  Value<String> details,
  Value<DateTime> createdAtUtc,
  Value<int> rowid,
});

class $$CaseUpdatesTableFilterComposer
    extends Composer<_$LocalDatabase, $CaseUpdatesTable> {
  $$CaseUpdatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get caseId => $composableBuilder(
      column: $table.caseId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get doctorId => $composableBuilder(
      column: $table.doctorId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get doctorName => $composableBuilder(
      column: $table.doctorName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get details => $composableBuilder(
      column: $table.details, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAtUtc => $composableBuilder(
      column: $table.createdAtUtc, builder: (column) => ColumnFilters(column));
}

class $$CaseUpdatesTableOrderingComposer
    extends Composer<_$LocalDatabase, $CaseUpdatesTable> {
  $$CaseUpdatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get caseId => $composableBuilder(
      column: $table.caseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get doctorId => $composableBuilder(
      column: $table.doctorId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get doctorName => $composableBuilder(
      column: $table.doctorName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get details => $composableBuilder(
      column: $table.details, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAtUtc => $composableBuilder(
      column: $table.createdAtUtc,
      builder: (column) => ColumnOrderings(column));
}

class $$CaseUpdatesTableAnnotationComposer
    extends Composer<_$LocalDatabase, $CaseUpdatesTable> {
  $$CaseUpdatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get caseId =>
      $composableBuilder(column: $table.caseId, builder: (column) => column);

  GeneratedColumn<String> get doctorId =>
      $composableBuilder(column: $table.doctorId, builder: (column) => column);

  GeneratedColumn<String> get doctorName => $composableBuilder(
      column: $table.doctorName, builder: (column) => column);

  GeneratedColumn<String> get details =>
      $composableBuilder(column: $table.details, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAtUtc => $composableBuilder(
      column: $table.createdAtUtc, builder: (column) => column);
}

class $$CaseUpdatesTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $CaseUpdatesTable,
    CaseUpdate,
    $$CaseUpdatesTableFilterComposer,
    $$CaseUpdatesTableOrderingComposer,
    $$CaseUpdatesTableAnnotationComposer,
    $$CaseUpdatesTableCreateCompanionBuilder,
    $$CaseUpdatesTableUpdateCompanionBuilder,
    (
      CaseUpdate,
      BaseReferences<_$LocalDatabase, $CaseUpdatesTable, CaseUpdate>
    ),
    CaseUpdate,
    PrefetchHooks Function()> {
  $$CaseUpdatesTableTableManager(_$LocalDatabase db, $CaseUpdatesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CaseUpdatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CaseUpdatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CaseUpdatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> caseId = const Value.absent(),
            Value<String> doctorId = const Value.absent(),
            Value<String> doctorName = const Value.absent(),
            Value<String> details = const Value.absent(),
            Value<DateTime> createdAtUtc = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CaseUpdatesCompanion(
            id: id,
            caseId: caseId,
            doctorId: doctorId,
            doctorName: doctorName,
            details: details,
            createdAtUtc: createdAtUtc,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String caseId,
            required String doctorId,
            required String doctorName,
            required String details,
            required DateTime createdAtUtc,
            Value<int> rowid = const Value.absent(),
          }) =>
              CaseUpdatesCompanion.insert(
            id: id,
            caseId: caseId,
            doctorId: doctorId,
            doctorName: doctorName,
            details: details,
            createdAtUtc: createdAtUtc,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CaseUpdatesTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $CaseUpdatesTable,
    CaseUpdate,
    $$CaseUpdatesTableFilterComposer,
    $$CaseUpdatesTableOrderingComposer,
    $$CaseUpdatesTableAnnotationComposer,
    $$CaseUpdatesTableCreateCompanionBuilder,
    $$CaseUpdatesTableUpdateCompanionBuilder,
    (
      CaseUpdate,
      BaseReferences<_$LocalDatabase, $CaseUpdatesTable, CaseUpdate>
    ),
    CaseUpdate,
    PrefetchHooks Function()>;
typedef $$AuditLogsTableCreateCompanionBuilder = AuditLogsCompanion Function({
  required String id,
  required String actorId,
  required String action,
  required String entity,
  required String entityId,
  Value<String?> beforeJson,
  Value<String?> afterJson,
  required DateTime createdAtUtc,
  Value<int> rowid,
});
typedef $$AuditLogsTableUpdateCompanionBuilder = AuditLogsCompanion Function({
  Value<String> id,
  Value<String> actorId,
  Value<String> action,
  Value<String> entity,
  Value<String> entityId,
  Value<String?> beforeJson,
  Value<String?> afterJson,
  Value<DateTime> createdAtUtc,
  Value<int> rowid,
});

class $$AuditLogsTableFilterComposer
    extends Composer<_$LocalDatabase, $AuditLogsTable> {
  $$AuditLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get actorId => $composableBuilder(
      column: $table.actorId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get action => $composableBuilder(
      column: $table.action, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entity => $composableBuilder(
      column: $table.entity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get beforeJson => $composableBuilder(
      column: $table.beforeJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get afterJson => $composableBuilder(
      column: $table.afterJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAtUtc => $composableBuilder(
      column: $table.createdAtUtc, builder: (column) => ColumnFilters(column));
}

class $$AuditLogsTableOrderingComposer
    extends Composer<_$LocalDatabase, $AuditLogsTable> {
  $$AuditLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get actorId => $composableBuilder(
      column: $table.actorId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get action => $composableBuilder(
      column: $table.action, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entity => $composableBuilder(
      column: $table.entity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get beforeJson => $composableBuilder(
      column: $table.beforeJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get afterJson => $composableBuilder(
      column: $table.afterJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAtUtc => $composableBuilder(
      column: $table.createdAtUtc,
      builder: (column) => ColumnOrderings(column));
}

class $$AuditLogsTableAnnotationComposer
    extends Composer<_$LocalDatabase, $AuditLogsTable> {
  $$AuditLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get actorId =>
      $composableBuilder(column: $table.actorId, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get entity =>
      $composableBuilder(column: $table.entity, builder: (column) => column);

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get beforeJson => $composableBuilder(
      column: $table.beforeJson, builder: (column) => column);

  GeneratedColumn<String> get afterJson =>
      $composableBuilder(column: $table.afterJson, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAtUtc => $composableBuilder(
      column: $table.createdAtUtc, builder: (column) => column);
}

class $$AuditLogsTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $AuditLogsTable,
    AuditLog,
    $$AuditLogsTableFilterComposer,
    $$AuditLogsTableOrderingComposer,
    $$AuditLogsTableAnnotationComposer,
    $$AuditLogsTableCreateCompanionBuilder,
    $$AuditLogsTableUpdateCompanionBuilder,
    (AuditLog, BaseReferences<_$LocalDatabase, $AuditLogsTable, AuditLog>),
    AuditLog,
    PrefetchHooks Function()> {
  $$AuditLogsTableTableManager(_$LocalDatabase db, $AuditLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> actorId = const Value.absent(),
            Value<String> action = const Value.absent(),
            Value<String> entity = const Value.absent(),
            Value<String> entityId = const Value.absent(),
            Value<String?> beforeJson = const Value.absent(),
            Value<String?> afterJson = const Value.absent(),
            Value<DateTime> createdAtUtc = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AuditLogsCompanion(
            id: id,
            actorId: actorId,
            action: action,
            entity: entity,
            entityId: entityId,
            beforeJson: beforeJson,
            afterJson: afterJson,
            createdAtUtc: createdAtUtc,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String actorId,
            required String action,
            required String entity,
            required String entityId,
            Value<String?> beforeJson = const Value.absent(),
            Value<String?> afterJson = const Value.absent(),
            required DateTime createdAtUtc,
            Value<int> rowid = const Value.absent(),
          }) =>
              AuditLogsCompanion.insert(
            id: id,
            actorId: actorId,
            action: action,
            entity: entity,
            entityId: entityId,
            beforeJson: beforeJson,
            afterJson: afterJson,
            createdAtUtc: createdAtUtc,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AuditLogsTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $AuditLogsTable,
    AuditLog,
    $$AuditLogsTableFilterComposer,
    $$AuditLogsTableOrderingComposer,
    $$AuditLogsTableAnnotationComposer,
    $$AuditLogsTableCreateCompanionBuilder,
    $$AuditLogsTableUpdateCompanionBuilder,
    (AuditLog, BaseReferences<_$LocalDatabase, $AuditLogsTable, AuditLog>),
    AuditLog,
    PrefetchHooks Function()>;
typedef $$SyncQueueTableCreateCompanionBuilder = SyncQueueCompanion Function({
  required String id,
  required String endpoint,
  required String payloadJson,
  Value<int> attempts,
  Value<String?> lastError,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$SyncQueueTableUpdateCompanionBuilder = SyncQueueCompanion Function({
  Value<String> id,
  Value<String> endpoint,
  Value<String> payloadJson,
  Value<int> attempts,
  Value<String?> lastError,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$SyncQueueTableFilterComposer
    extends Composer<_$LocalDatabase, $SyncQueueTable> {
  $$SyncQueueTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get endpoint => $composableBuilder(
      column: $table.endpoint, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payloadJson => $composableBuilder(
      column: $table.payloadJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get attempts => $composableBuilder(
      column: $table.attempts, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$SyncQueueTableOrderingComposer
    extends Composer<_$LocalDatabase, $SyncQueueTable> {
  $$SyncQueueTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get endpoint => $composableBuilder(
      column: $table.endpoint, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payloadJson => $composableBuilder(
      column: $table.payloadJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get attempts => $composableBuilder(
      column: $table.attempts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$SyncQueueTableAnnotationComposer
    extends Composer<_$LocalDatabase, $SyncQueueTable> {
  $$SyncQueueTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get endpoint =>
      $composableBuilder(column: $table.endpoint, builder: (column) => column);

  GeneratedColumn<String> get payloadJson => $composableBuilder(
      column: $table.payloadJson, builder: (column) => column);

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SyncQueueTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $SyncQueueTable,
    SyncQueueData,
    $$SyncQueueTableFilterComposer,
    $$SyncQueueTableOrderingComposer,
    $$SyncQueueTableAnnotationComposer,
    $$SyncQueueTableCreateCompanionBuilder,
    $$SyncQueueTableUpdateCompanionBuilder,
    (
      SyncQueueData,
      BaseReferences<_$LocalDatabase, $SyncQueueTable, SyncQueueData>
    ),
    SyncQueueData,
    PrefetchHooks Function()> {
  $$SyncQueueTableTableManager(_$LocalDatabase db, $SyncQueueTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> endpoint = const Value.absent(),
            Value<String> payloadJson = const Value.absent(),
            Value<int> attempts = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SyncQueueCompanion(
            id: id,
            endpoint: endpoint,
            payloadJson: payloadJson,
            attempts: attempts,
            lastError: lastError,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String endpoint,
            required String payloadJson,
            Value<int> attempts = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
            required DateTime createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              SyncQueueCompanion.insert(
            id: id,
            endpoint: endpoint,
            payloadJson: payloadJson,
            attempts: attempts,
            lastError: lastError,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncQueueTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $SyncQueueTable,
    SyncQueueData,
    $$SyncQueueTableFilterComposer,
    $$SyncQueueTableOrderingComposer,
    $$SyncQueueTableAnnotationComposer,
    $$SyncQueueTableCreateCompanionBuilder,
    $$SyncQueueTableUpdateCompanionBuilder,
    (
      SyncQueueData,
      BaseReferences<_$LocalDatabase, $SyncQueueTable, SyncQueueData>
    ),
    SyncQueueData,
    PrefetchHooks Function()>;
typedef $$DeviceStatesTableCreateCompanionBuilder = DeviceStatesCompanion
    Function({
  required String id,
  required String deviceId,
  Value<DateTime?> lastPullAt,
  Value<DateTime?> lastPushAt,
  Value<String?> checksum,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$DeviceStatesTableUpdateCompanionBuilder = DeviceStatesCompanion
    Function({
  Value<String> id,
  Value<String> deviceId,
  Value<DateTime?> lastPullAt,
  Value<DateTime?> lastPushAt,
  Value<String?> checksum,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$DeviceStatesTableFilterComposer
    extends Composer<_$LocalDatabase, $DeviceStatesTable> {
  $$DeviceStatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastPullAt => $composableBuilder(
      column: $table.lastPullAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastPushAt => $composableBuilder(
      column: $table.lastPushAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get checksum => $composableBuilder(
      column: $table.checksum, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$DeviceStatesTableOrderingComposer
    extends Composer<_$LocalDatabase, $DeviceStatesTable> {
  $$DeviceStatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastPullAt => $composableBuilder(
      column: $table.lastPullAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastPushAt => $composableBuilder(
      column: $table.lastPushAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get checksum => $composableBuilder(
      column: $table.checksum, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$DeviceStatesTableAnnotationComposer
    extends Composer<_$LocalDatabase, $DeviceStatesTable> {
  $$DeviceStatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<DateTime> get lastPullAt => $composableBuilder(
      column: $table.lastPullAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastPushAt => $composableBuilder(
      column: $table.lastPushAt, builder: (column) => column);

  GeneratedColumn<String> get checksum =>
      $composableBuilder(column: $table.checksum, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$DeviceStatesTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $DeviceStatesTable,
    DeviceState,
    $$DeviceStatesTableFilterComposer,
    $$DeviceStatesTableOrderingComposer,
    $$DeviceStatesTableAnnotationComposer,
    $$DeviceStatesTableCreateCompanionBuilder,
    $$DeviceStatesTableUpdateCompanionBuilder,
    (
      DeviceState,
      BaseReferences<_$LocalDatabase, $DeviceStatesTable, DeviceState>
    ),
    DeviceState,
    PrefetchHooks Function()> {
  $$DeviceStatesTableTableManager(_$LocalDatabase db, $DeviceStatesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DeviceStatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DeviceStatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DeviceStatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> deviceId = const Value.absent(),
            Value<DateTime?> lastPullAt = const Value.absent(),
            Value<DateTime?> lastPushAt = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DeviceStatesCompanion(
            id: id,
            deviceId: deviceId,
            lastPullAt: lastPullAt,
            lastPushAt: lastPushAt,
            checksum: checksum,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String deviceId,
            Value<DateTime?> lastPullAt = const Value.absent(),
            Value<DateTime?> lastPushAt = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              DeviceStatesCompanion.insert(
            id: id,
            deviceId: deviceId,
            lastPullAt: lastPullAt,
            lastPushAt: lastPushAt,
            checksum: checksum,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DeviceStatesTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $DeviceStatesTable,
    DeviceState,
    $$DeviceStatesTableFilterComposer,
    $$DeviceStatesTableOrderingComposer,
    $$DeviceStatesTableAnnotationComposer,
    $$DeviceStatesTableCreateCompanionBuilder,
    $$DeviceStatesTableUpdateCompanionBuilder,
    (
      DeviceState,
      BaseReferences<_$LocalDatabase, $DeviceStatesTable, DeviceState>
    ),
    DeviceState,
    PrefetchHooks Function()>;
typedef $$AppSettingsTableCreateCompanionBuilder = AppSettingsCompanion
    Function({
  required String key,
  required String value,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$AppSettingsTableUpdateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<String> key,
  Value<String> value,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$AppSettingsTableFilterComposer
    extends Composer<_$LocalDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$LocalDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$LocalDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AppSettingsTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (
      AppSetting,
      BaseReferences<_$LocalDatabase, $AppSettingsTable, AppSetting>
    ),
    AppSetting,
    PrefetchHooks Function()> {
  $$AppSettingsTableTableManager(_$LocalDatabase db, $AppSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppSettingsCompanion(
            key: key,
            value: value,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String key,
            required String value,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              AppSettingsCompanion.insert(
            key: key,
            value: value,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppSettingsTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (
      AppSetting,
      BaseReferences<_$LocalDatabase, $AppSettingsTable, AppSetting>
    ),
    AppSetting,
    PrefetchHooks Function()>;
typedef $$DrugsTableCreateCompanionBuilder = DrugsCompanion Function({
  required String id,
  required String name,
  Value<String?> atcCode,
  Value<String?> defaultRoute,
  Value<String?> notes,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$DrugsTableUpdateCompanionBuilder = DrugsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> atcCode,
  Value<String?> defaultRoute,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$DrugsTableFilterComposer
    extends Composer<_$LocalDatabase, $DrugsTable> {
  $$DrugsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get atcCode => $composableBuilder(
      column: $table.atcCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get defaultRoute => $composableBuilder(
      column: $table.defaultRoute, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$DrugsTableOrderingComposer
    extends Composer<_$LocalDatabase, $DrugsTable> {
  $$DrugsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get atcCode => $composableBuilder(
      column: $table.atcCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get defaultRoute => $composableBuilder(
      column: $table.defaultRoute,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$DrugsTableAnnotationComposer
    extends Composer<_$LocalDatabase, $DrugsTable> {
  $$DrugsTableAnnotationComposer({
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

  GeneratedColumn<String> get atcCode =>
      $composableBuilder(column: $table.atcCode, builder: (column) => column);

  GeneratedColumn<String> get defaultRoute => $composableBuilder(
      column: $table.defaultRoute, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$DrugsTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $DrugsTable,
    Drug,
    $$DrugsTableFilterComposer,
    $$DrugsTableOrderingComposer,
    $$DrugsTableAnnotationComposer,
    $$DrugsTableCreateCompanionBuilder,
    $$DrugsTableUpdateCompanionBuilder,
    (Drug, BaseReferences<_$LocalDatabase, $DrugsTable, Drug>),
    Drug,
    PrefetchHooks Function()> {
  $$DrugsTableTableManager(_$LocalDatabase db, $DrugsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DrugsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DrugsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DrugsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> atcCode = const Value.absent(),
            Value<String?> defaultRoute = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DrugsCompanion(
            id: id,
            name: name,
            atcCode: atcCode,
            defaultRoute: defaultRoute,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> atcCode = const Value.absent(),
            Value<String?> defaultRoute = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              DrugsCompanion.insert(
            id: id,
            name: name,
            atcCode: atcCode,
            defaultRoute: defaultRoute,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DrugsTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $DrugsTable,
    Drug,
    $$DrugsTableFilterComposer,
    $$DrugsTableOrderingComposer,
    $$DrugsTableAnnotationComposer,
    $$DrugsTableCreateCompanionBuilder,
    $$DrugsTableUpdateCompanionBuilder,
    (Drug, BaseReferences<_$LocalDatabase, $DrugsTable, Drug>),
    Drug,
    PrefetchHooks Function()>;
typedef $$DrugConcentrationsTableCreateCompanionBuilder
    = DrugConcentrationsCompanion Function({
  required String id,
  required String drugId,
  required double mgPerMl,
  required String displayText,
  Value<String?> route,
  Value<int> rowid,
});
typedef $$DrugConcentrationsTableUpdateCompanionBuilder
    = DrugConcentrationsCompanion Function({
  Value<String> id,
  Value<String> drugId,
  Value<double> mgPerMl,
  Value<String> displayText,
  Value<String?> route,
  Value<int> rowid,
});

class $$DrugConcentrationsTableFilterComposer
    extends Composer<_$LocalDatabase, $DrugConcentrationsTable> {
  $$DrugConcentrationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get drugId => $composableBuilder(
      column: $table.drugId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get mgPerMl => $composableBuilder(
      column: $table.mgPerMl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get displayText => $composableBuilder(
      column: $table.displayText, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get route => $composableBuilder(
      column: $table.route, builder: (column) => ColumnFilters(column));
}

class $$DrugConcentrationsTableOrderingComposer
    extends Composer<_$LocalDatabase, $DrugConcentrationsTable> {
  $$DrugConcentrationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get drugId => $composableBuilder(
      column: $table.drugId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get mgPerMl => $composableBuilder(
      column: $table.mgPerMl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get displayText => $composableBuilder(
      column: $table.displayText, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get route => $composableBuilder(
      column: $table.route, builder: (column) => ColumnOrderings(column));
}

class $$DrugConcentrationsTableAnnotationComposer
    extends Composer<_$LocalDatabase, $DrugConcentrationsTable> {
  $$DrugConcentrationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get drugId =>
      $composableBuilder(column: $table.drugId, builder: (column) => column);

  GeneratedColumn<double> get mgPerMl =>
      $composableBuilder(column: $table.mgPerMl, builder: (column) => column);

  GeneratedColumn<String> get displayText => $composableBuilder(
      column: $table.displayText, builder: (column) => column);

  GeneratedColumn<String> get route =>
      $composableBuilder(column: $table.route, builder: (column) => column);
}

class $$DrugConcentrationsTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $DrugConcentrationsTable,
    DrugConcentration,
    $$DrugConcentrationsTableFilterComposer,
    $$DrugConcentrationsTableOrderingComposer,
    $$DrugConcentrationsTableAnnotationComposer,
    $$DrugConcentrationsTableCreateCompanionBuilder,
    $$DrugConcentrationsTableUpdateCompanionBuilder,
    (
      DrugConcentration,
      BaseReferences<_$LocalDatabase, $DrugConcentrationsTable,
          DrugConcentration>
    ),
    DrugConcentration,
    PrefetchHooks Function()> {
  $$DrugConcentrationsTableTableManager(
      _$LocalDatabase db, $DrugConcentrationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DrugConcentrationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DrugConcentrationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DrugConcentrationsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> drugId = const Value.absent(),
            Value<double> mgPerMl = const Value.absent(),
            Value<String> displayText = const Value.absent(),
            Value<String?> route = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DrugConcentrationsCompanion(
            id: id,
            drugId: drugId,
            mgPerMl: mgPerMl,
            displayText: displayText,
            route: route,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String drugId,
            required double mgPerMl,
            required String displayText,
            Value<String?> route = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DrugConcentrationsCompanion.insert(
            id: id,
            drugId: drugId,
            mgPerMl: mgPerMl,
            displayText: displayText,
            route: route,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DrugConcentrationsTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $DrugConcentrationsTable,
    DrugConcentration,
    $$DrugConcentrationsTableFilterComposer,
    $$DrugConcentrationsTableOrderingComposer,
    $$DrugConcentrationsTableAnnotationComposer,
    $$DrugConcentrationsTableCreateCompanionBuilder,
    $$DrugConcentrationsTableUpdateCompanionBuilder,
    (
      DrugConcentration,
      BaseReferences<_$LocalDatabase, $DrugConcentrationsTable,
          DrugConcentration>
    ),
    DrugConcentration,
    PrefetchHooks Function()>;
typedef $$DoseRulesTableCreateCompanionBuilder = DoseRulesCompanion Function({
  required String id,
  required String drugId,
  required String basis,
  Value<double?> minPerKg,
  Value<double?> maxPerKg,
  Value<double?> maxPerDoseAbs,
  Value<double?> maxPerDayAbs,
  Value<String?> roundingRule,
  Value<int?> ageMinMonths,
  Value<int?> ageMaxMonths,
  Value<String?> renalAdjJson,
  Value<String?> hepaticAdjJson,
  Value<int> rowid,
});
typedef $$DoseRulesTableUpdateCompanionBuilder = DoseRulesCompanion Function({
  Value<String> id,
  Value<String> drugId,
  Value<String> basis,
  Value<double?> minPerKg,
  Value<double?> maxPerKg,
  Value<double?> maxPerDoseAbs,
  Value<double?> maxPerDayAbs,
  Value<String?> roundingRule,
  Value<int?> ageMinMonths,
  Value<int?> ageMaxMonths,
  Value<String?> renalAdjJson,
  Value<String?> hepaticAdjJson,
  Value<int> rowid,
});

class $$DoseRulesTableFilterComposer
    extends Composer<_$LocalDatabase, $DoseRulesTable> {
  $$DoseRulesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get drugId => $composableBuilder(
      column: $table.drugId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get basis => $composableBuilder(
      column: $table.basis, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get minPerKg => $composableBuilder(
      column: $table.minPerKg, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get maxPerKg => $composableBuilder(
      column: $table.maxPerKg, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get maxPerDoseAbs => $composableBuilder(
      column: $table.maxPerDoseAbs, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get maxPerDayAbs => $composableBuilder(
      column: $table.maxPerDayAbs, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get roundingRule => $composableBuilder(
      column: $table.roundingRule, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get ageMinMonths => $composableBuilder(
      column: $table.ageMinMonths, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get ageMaxMonths => $composableBuilder(
      column: $table.ageMaxMonths, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get renalAdjJson => $composableBuilder(
      column: $table.renalAdjJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hepaticAdjJson => $composableBuilder(
      column: $table.hepaticAdjJson,
      builder: (column) => ColumnFilters(column));
}

class $$DoseRulesTableOrderingComposer
    extends Composer<_$LocalDatabase, $DoseRulesTable> {
  $$DoseRulesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get drugId => $composableBuilder(
      column: $table.drugId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get basis => $composableBuilder(
      column: $table.basis, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get minPerKg => $composableBuilder(
      column: $table.minPerKg, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get maxPerKg => $composableBuilder(
      column: $table.maxPerKg, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get maxPerDoseAbs => $composableBuilder(
      column: $table.maxPerDoseAbs,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get maxPerDayAbs => $composableBuilder(
      column: $table.maxPerDayAbs,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get roundingRule => $composableBuilder(
      column: $table.roundingRule,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get ageMinMonths => $composableBuilder(
      column: $table.ageMinMonths,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get ageMaxMonths => $composableBuilder(
      column: $table.ageMaxMonths,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get renalAdjJson => $composableBuilder(
      column: $table.renalAdjJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hepaticAdjJson => $composableBuilder(
      column: $table.hepaticAdjJson,
      builder: (column) => ColumnOrderings(column));
}

class $$DoseRulesTableAnnotationComposer
    extends Composer<_$LocalDatabase, $DoseRulesTable> {
  $$DoseRulesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get drugId =>
      $composableBuilder(column: $table.drugId, builder: (column) => column);

  GeneratedColumn<String> get basis =>
      $composableBuilder(column: $table.basis, builder: (column) => column);

  GeneratedColumn<double> get minPerKg =>
      $composableBuilder(column: $table.minPerKg, builder: (column) => column);

  GeneratedColumn<double> get maxPerKg =>
      $composableBuilder(column: $table.maxPerKg, builder: (column) => column);

  GeneratedColumn<double> get maxPerDoseAbs => $composableBuilder(
      column: $table.maxPerDoseAbs, builder: (column) => column);

  GeneratedColumn<double> get maxPerDayAbs => $composableBuilder(
      column: $table.maxPerDayAbs, builder: (column) => column);

  GeneratedColumn<String> get roundingRule => $composableBuilder(
      column: $table.roundingRule, builder: (column) => column);

  GeneratedColumn<int> get ageMinMonths => $composableBuilder(
      column: $table.ageMinMonths, builder: (column) => column);

  GeneratedColumn<int> get ageMaxMonths => $composableBuilder(
      column: $table.ageMaxMonths, builder: (column) => column);

  GeneratedColumn<String> get renalAdjJson => $composableBuilder(
      column: $table.renalAdjJson, builder: (column) => column);

  GeneratedColumn<String> get hepaticAdjJson => $composableBuilder(
      column: $table.hepaticAdjJson, builder: (column) => column);
}

class $$DoseRulesTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $DoseRulesTable,
    DoseRule,
    $$DoseRulesTableFilterComposer,
    $$DoseRulesTableOrderingComposer,
    $$DoseRulesTableAnnotationComposer,
    $$DoseRulesTableCreateCompanionBuilder,
    $$DoseRulesTableUpdateCompanionBuilder,
    (DoseRule, BaseReferences<_$LocalDatabase, $DoseRulesTable, DoseRule>),
    DoseRule,
    PrefetchHooks Function()> {
  $$DoseRulesTableTableManager(_$LocalDatabase db, $DoseRulesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DoseRulesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DoseRulesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DoseRulesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> drugId = const Value.absent(),
            Value<String> basis = const Value.absent(),
            Value<double?> minPerKg = const Value.absent(),
            Value<double?> maxPerKg = const Value.absent(),
            Value<double?> maxPerDoseAbs = const Value.absent(),
            Value<double?> maxPerDayAbs = const Value.absent(),
            Value<String?> roundingRule = const Value.absent(),
            Value<int?> ageMinMonths = const Value.absent(),
            Value<int?> ageMaxMonths = const Value.absent(),
            Value<String?> renalAdjJson = const Value.absent(),
            Value<String?> hepaticAdjJson = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DoseRulesCompanion(
            id: id,
            drugId: drugId,
            basis: basis,
            minPerKg: minPerKg,
            maxPerKg: maxPerKg,
            maxPerDoseAbs: maxPerDoseAbs,
            maxPerDayAbs: maxPerDayAbs,
            roundingRule: roundingRule,
            ageMinMonths: ageMinMonths,
            ageMaxMonths: ageMaxMonths,
            renalAdjJson: renalAdjJson,
            hepaticAdjJson: hepaticAdjJson,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String drugId,
            required String basis,
            Value<double?> minPerKg = const Value.absent(),
            Value<double?> maxPerKg = const Value.absent(),
            Value<double?> maxPerDoseAbs = const Value.absent(),
            Value<double?> maxPerDayAbs = const Value.absent(),
            Value<String?> roundingRule = const Value.absent(),
            Value<int?> ageMinMonths = const Value.absent(),
            Value<int?> ageMaxMonths = const Value.absent(),
            Value<String?> renalAdjJson = const Value.absent(),
            Value<String?> hepaticAdjJson = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DoseRulesCompanion.insert(
            id: id,
            drugId: drugId,
            basis: basis,
            minPerKg: minPerKg,
            maxPerKg: maxPerKg,
            maxPerDoseAbs: maxPerDoseAbs,
            maxPerDayAbs: maxPerDayAbs,
            roundingRule: roundingRule,
            ageMinMonths: ageMinMonths,
            ageMaxMonths: ageMaxMonths,
            renalAdjJson: renalAdjJson,
            hepaticAdjJson: hepaticAdjJson,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DoseRulesTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $DoseRulesTable,
    DoseRule,
    $$DoseRulesTableFilterComposer,
    $$DoseRulesTableOrderingComposer,
    $$DoseRulesTableAnnotationComposer,
    $$DoseRulesTableCreateCompanionBuilder,
    $$DoseRulesTableUpdateCompanionBuilder,
    (DoseRule, BaseReferences<_$LocalDatabase, $DoseRulesTable, DoseRule>),
    DoseRule,
    PrefetchHooks Function()>;

class $LocalDatabaseManager {
  final _$LocalDatabase _db;
  $LocalDatabaseManager(this._db);
  $$HospitalsTableTableManager get hospitals =>
      $$HospitalsTableTableManager(_db, _db.hospitals);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$SubscriptionsTableTableManager get subscriptions =>
      $$SubscriptionsTableTableManager(_db, _db.subscriptions);
  $$PatientsTableTableManager get patients =>
      $$PatientsTableTableManager(_db, _db.patients);
  $$CaseSheetsTableTableManager get caseSheets =>
      $$CaseSheetsTableTableManager(_db, _db.caseSheets);
  $$CaseUpdatesTableTableManager get caseUpdates =>
      $$CaseUpdatesTableTableManager(_db, _db.caseUpdates);
  $$AuditLogsTableTableManager get auditLogs =>
      $$AuditLogsTableTableManager(_db, _db.auditLogs);
  $$SyncQueueTableTableManager get syncQueue =>
      $$SyncQueueTableTableManager(_db, _db.syncQueue);
  $$DeviceStatesTableTableManager get deviceStates =>
      $$DeviceStatesTableTableManager(_db, _db.deviceStates);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$DrugsTableTableManager get drugs =>
      $$DrugsTableTableManager(_db, _db.drugs);
  $$DrugConcentrationsTableTableManager get drugConcentrations =>
      $$DrugConcentrationsTableTableManager(_db, _db.drugConcentrations);
  $$DoseRulesTableTableManager get doseRules =>
      $$DoseRulesTableTableManager(_db, _db.doseRules);
}
