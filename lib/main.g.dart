// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Notification extends _Notification
    with RealmEntity, RealmObjectBase, RealmObject {
  Notification(
    String message,
  ) {
    RealmObjectBase.set(this, 'message', message);
  }

  Notification._();

  @override
  String get message => RealmObjectBase.get<String>(this, 'message') as String;
  @override
  set message(String value) => RealmObjectBase.set(this, 'message', value);

  @override
  Stream<RealmObjectChanges<Notification>> get changes =>
      RealmObjectBase.getChanges<Notification>(this);

  @override
  Notification freeze() => RealmObjectBase.freezeObject<Notification>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Notification._);
    return const SchemaObject(
        ObjectType.realmObject, Notification, 'Notification', [
      SchemaProperty('message', RealmPropertyType.string),
    ]);
  }
}
