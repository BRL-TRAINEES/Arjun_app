import 'package:flutter/material.dart';
import './screens/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter firebase auth',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const LogInScreen(),
      routes: const {},
    );
  }
}
