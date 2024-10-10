import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'EmailLogin.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  void initState() {
    sendverifylink();
    super.initState();
  }

  sendverifylink() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification().then((onValue) => {
          Get.snackbar(
            'verification link sent',
            'check your mail',
            margin: EdgeInsets.all(35),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,
          )
        });
  }

  reload() async {
    await FirebaseAuth.instance.currentUser!
        .reload()
        .then((onValue) => {Get.offAll(EmailSignIn())});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Id Verification"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Text(
            "click on the link sent in mail to get verified & then click reload button below",
            style: TextStyle(
                fontSize: 27, fontWeight: FontWeight.bold, color: Colors.amber),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => reload()),
        child: Icon(Icons.restart_alt_outlined),
      ),
    );
  }
}
