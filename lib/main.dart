import 'package:arjun_app/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyAr6sCUoJu-77CKj1ylHVE203Y57fydQ4Q', // Your apiKey
      appId: '1:291583480134:android:2360924d1a1289ac841547', // Your appId
      messagingSenderId: '291583480134', // Your messagingSenderId
      projectId: 'fir-auth-83b00', // Your projectId
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter firebase auth',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const Wrapper(),
    );
  }
}
