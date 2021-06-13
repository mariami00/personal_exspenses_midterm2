import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:personal_expenses_midterm2/screens/login/login.dart';
import 'package:personal_expenses_midterm2/themes/thems.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes().buildTheme(),
      title: 'Personal Expenses',
      home: Login(),
    );
  }
}

