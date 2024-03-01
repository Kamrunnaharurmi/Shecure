import 'package:flutter/material.dart';
import 'package:shecure/open.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
      apiKey: 'AIzaSyAf5e8ppsGLJ366kUgCHfC-0Bt5vto0z9k',
      appId: '1:222801042680:android:bf59f2fe3e22b38b8a2f0d',
      messagingSenderId: '222801042680',
      projectId: 'shecure-ab9f8',
      storageBucket: "shecure-ab9f8.appspot.com",
  )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: open(),
    );
  }
}
