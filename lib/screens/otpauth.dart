import 'dart:math';

import 'package:arjun_app/screens/homescreen.dart';
import 'package:arjun_app/widget/textinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Otpauth extends StatefulWidget {
  String verificationId;
  Otpauth({super.key, required this.verificationId});

  @override
  State<Otpauth> createState() => _PhonenumState();
}

class _PhonenumState extends State<Otpauth> {
  final TextEditingController OTPController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Textinput(
            controller: OTPController,
            hintText: 'Enter OTP',
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                PhoneAuthCredential credential =
                    await PhoneAuthProvider.credential(
                        verificationId: widget.verificationId,
                        smsCode: OTPController.text.toString());
                FirebaseAuth.instance
                    .signInWithCredential(credential)
                    .then((onValue) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homescreen()));
                });
              } catch (ex) {
                log(ex.toString() as num);
              }
            },
            child: const Text(
              "OK",
              style: TextStyle(
                  color: Color.fromARGB(255, 20, 19, 19), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
