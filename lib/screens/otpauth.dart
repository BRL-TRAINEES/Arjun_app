import 'package:arjun_app/screens/wrapper.dart';
import 'package:arjun_app/widget/textinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Otpauth extends StatefulWidget {
  final String verificationId;
  const Otpauth({super.key, required this.verificationId});

  @override
  State<Otpauth> createState() => _OtpauthState();
}

class _OtpauthState extends State<Otpauth> {
  final TextEditingController OTPController = TextEditingController();

  signIn() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: OTPController.text,
    );

    try {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) => {
                Get.offAll(Wrapper()),
              });
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.code);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'OTP Verification',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextInput(
            controller: OTPController,
            hintText: 'Enter OTP sent',
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: (() => signIn()),
            child: const Text(
              "Verify",
              style: TextStyle(
                  color: Color.fromARGB(255, 20, 19, 19), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
