import 'package:arjun_app/screens/otpauth.dart';
import 'package:arjun_app/widget/textinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Phonenum extends StatefulWidget {
  const Phonenum({super.key});

  @override
  State<Phonenum> createState() => _PhonenumState();
}

class _PhonenumState extends State<Phonenum> {
  final TextEditingController phoneController = TextEditingController();
  sendotp() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+91' + phoneController.text,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {
            Get.snackbar("Error", e.code);
          },
          codeSent: (String vi, int? token) {
            Get.to(
              Otpauth(
                verificationId: vi,
              ),
            );
          },
          codeAutoRetrievalTimeout: (vi) {});
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.code);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Textinput(
                controller: phoneController, hintText: 'enter Mobile No.'),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              sendotp();
            },
            child: const Text(
              "Send OTP",
              style: TextStyle(
                  color: Color.fromARGB(255, 20, 19, 19), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
