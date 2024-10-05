import 'package:arjun_app/widget/textinput.dart';
import 'package:flutter/material.dart';

class Phonenum extends StatefulWidget {
  const Phonenum({super.key});

  @override
  State<Phonenum> createState() => _PhonenumState();
}

class _PhonenumState extends State<Phonenum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Textinput("enter email"),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
