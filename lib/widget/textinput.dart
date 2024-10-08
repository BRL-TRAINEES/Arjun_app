import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;

  const TextInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  });

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool _isObscured = true;

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword && _isObscured,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey[600]), // Hint text color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
          borderSide: BorderSide(
              color: Colors.blue, width: 2), // Border color and width
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
        contentPadding: const EdgeInsets.symmetric(
            vertical: 15, horizontal: 20), // Padding inside the text field
      ),
    );
  }
}
