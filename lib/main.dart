import 'package:flutter/material.dart';
import 'package:todo_app_pfa/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}