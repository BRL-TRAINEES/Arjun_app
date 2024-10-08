import 'package:arjun_app/screens/wrapper.dart';
import 'package:arjun_app/widget/passcheck.dart';
import 'package:arjun_app/widget/textinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailSignUp extends StatefulWidget {
  const EmailSignUp({super.key});

  @override
  State<EmailSignUp> createState() => _EmailSignUpState();
}

class _EmailSignUpState extends State<EmailSignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool isloading = false;

  signUp() async {
    setState(() {
      isloading = true;
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
    return Scaffold(
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
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
                const Padding(
                  padding: EdgeInsets.all(32),
                  child: Center(
                    child: Text(
                      "--password must contain atleast one Uppercase,Lowercase,Number,Special Character amd minimum length of 8 ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: (() => signUp()),
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
