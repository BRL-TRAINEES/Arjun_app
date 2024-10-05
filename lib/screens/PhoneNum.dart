import 'package:arjun_app/widget/textinput.dart';
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
          Textinput(
              controller: phoneController, hintText: 'Enter phone number'),
          ElevatedButton(
            onPressed: () {},
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
