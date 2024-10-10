import 'package:arjun_app/widget/textinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class forgot extends StatefulWidget {
  const forgot({super.key});

  @override
  State<forgot> createState() => _forgotState();
}

class _forgotState extends State<forgot> {
  TextEditingController emailController = TextEditingController();

  reset() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text)
        .then((onValue) => {
              Get.snackbar(
                'verification link sent',
                'check your mail',
                margin: EdgeInsets.all(35),
                backgroundColor: Colors.yellow,
                snackPosition: SnackPosition.BOTTOM,
              )
            });
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Forgot Password",
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextInput(
                controller: emailController, hintText: 'Enter Email Address'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (() => reset()),
            child: const Text(
              "Send reset link",
              style: TextStyle(
                  color: Color.fromARGB(255, 15, 15, 15), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
