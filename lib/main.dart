import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:realm/realm.dart';

part 'main.g.dart';

@RealmModel()
class _Notification {
  late String message;
}

final realm = Realm(Configuration.inMemory([Notification.schema]));

void main() {
  // create some notifications in a background isolate
  Isolate.run(() async {
    while (true) {
      // note we are in another isolate, hence another heap, and
      // the realm instance here is new.
      realm.write(() => realm.add(Notification('Hello')));
      await Future.delayed(const Duration(seconds: 1));
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription _subscription;
  var last = 0.obs;

  @override
  void initState() {
    super.initState();
    asyncInit();
  }

  Future<void> asyncInit() async {
    _subscription = notifications().listen((event) {
      last.value = event;
    });
  }

  Stream<int> notifications() {
    return realm.all<Notification>().changes.map((c) => c.results.length);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Obx(() => Text('Last: $last'))),
      ),
    );
  }
}
