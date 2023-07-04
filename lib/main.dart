import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/pages/MainPages/EmployeePage.dart';

// ignore: unused_import
import 'package:sampleproject/pages/MainPages/LoginScreen.dart';

import 'firebase_options.dart';

//import 'package:sampleproject/pages/SignPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(
        title: '',
      ),
    );
  }
}
