import 'package:arjun_app/screens/wrapper.dart';
import 'package:arjun_app/widget/textinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailSignIn extends StatefulWidget {
  const EmailSignIn({super.key});

  @override
  State<EmailSignIn> createState() => _EmailSignInState();
}

class _EmailSignInState extends State<EmailSignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passController.text);
    Get.offAll(Wrapper());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sign In",
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Textinput(
                controller: emailController, hintText: 'Enter Email Address'),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Textinput(
                controller: passController, hintText: 'Enter Password'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (() => signIn()),
            child: const Text(
              "Sign In",
              style: TextStyle(
                  color: Color.fromARGB(255, 10, 10, 10), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
