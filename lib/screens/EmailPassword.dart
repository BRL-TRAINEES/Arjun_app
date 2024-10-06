import 'package:arjun_app/widget/textinput.dart';
import 'package:flutter/material.dart';

class EmailSignUp extends StatefulWidget {
  const EmailSignUp({super.key});

  @override
  State<EmailSignUp> createState() => _EmailSignUpState();
}

class _EmailSignUpState extends State<EmailSignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sign Up",
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
            onPressed: () {},
            child: const Text(
              "Sign Up",
              style: TextStyle(
                  color: Color.fromARGB(255, 15, 15, 15), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
