import 'package:arjun_app/screens/EmailLogin.dart';
import 'package:arjun_app/screens/EmailPassword.dart';
import 'package:arjun_app/screens/PhoneNum.dart';
import 'package:arjun_app/screens/forgot.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  login() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("sign up / login Options "),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (() => Get.to(EmailSignUp())),
              child: const Text("Sign Up with Email"),
            ),
            SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: (() => Get.to(EmailSignIn())),
              child: const Text("Login with Email"),
            ),
            SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: (() => Get.to(Phonenum())),
              child: const Text("phone sign in"),
            ),
            SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: (() => Get.to(forgot())),
              child: const Text("Forgot Password"),
            ),
            SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: (() => login()),
              child: const Text("Sign In With Google"),
            ),
          ],
        ),
      )),
    );
  }
}
