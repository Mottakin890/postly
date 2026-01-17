import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool obsecureText;
  const MyTextField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.obsecureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      obscureText: obsecureText,
      decoration: InputDecoration(
        hintText: hintText
      ),
    );
  }
}
