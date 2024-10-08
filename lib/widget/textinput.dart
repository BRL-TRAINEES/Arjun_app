import 'package:arjun_app/widget/passcheck.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool isnew;

  const TextInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.isnew = true,
  });

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool _isObscured = true;
  String strengthMessage = "";

  void onTextChanged(String text) {
    if (widget.isPassword) {
      setState(() {
        strengthMessage = checkPasswordStrength(text);
      });
    }
  }

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.controller,
          obscureText: widget.isPassword && _isObscured,
          onChanged: onTextChanged,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey[600]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.blueAccent, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _toggleVisibility,
                  )
                : null,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
        ),
        if (widget.isPassword && widget.isnew)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              strengthMessage,
              style: TextStyle(
                color: strengthMessage == "Strong password"
                    ? Colors.green
                    : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
