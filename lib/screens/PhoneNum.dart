import 'package:arjun_app/screens/otpauth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Phonenum extends StatefulWidget {
  const Phonenum({super.key});

  @override
  State<Phonenum> createState() => _PhonenumState();
}

class _PhonenumState extends State<Phonenum> {
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              filled: true,
              fillColor: const Color.fromARGB(255, 223, 225, 233),
              hintText: "Enter Mobile No.",
              hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            controller: phoneController,
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.verifyPhoneNumber(
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException ex) {},
                  codeSent: (String verificationId, int? resendtoken) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Otpauth(
                          verificationId: verificationId,
                        ),
                      ),
                    );
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                  phoneNumber: phoneController.text.toString());
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
