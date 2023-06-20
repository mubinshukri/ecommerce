import 'package:flutter/material.dart';

import '../firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: initializeDefault,
            child: const Text('Initialize default app'),
          ),
        ),
      ),
    );
  }

  Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Initialized default app $app');

    final CollectionReference _parcelCollection =
        FirebaseFirestore.instance.collection('courses');

    print(_parcelCollection.snapshots().isEmpty.toString());
  }
}
