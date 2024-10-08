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

  bool isloading = false;

  signIn() async {
    setState(() {
      isloading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passController.text);
      Get.offAll(Wrapper());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("error", e.code, backgroundColor: Colors.amber);
    } catch (e) {
      Get.snackbar("error", e.toString(), backgroundColor: Colors.amber);
    }
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
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
                  child: TextInput(
                      controller: emailController,
                      hintText: 'Enter Email Address'),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInput(
                    controller: passController,
                    hintText: 'Enter Password',
                    isPassword: true,
                  ),
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
