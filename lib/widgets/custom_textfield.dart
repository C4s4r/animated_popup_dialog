import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String textFieldText;

  CustomTextField(this.textFieldText);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode focusNode = FocusNode();
  TextField textField;

  String hint;

  @override
  void initState() {
    hint = widget.textFieldText;

    focusNode.addListener(() {
      setState(() {
        if (focusNode.hasFocus) {
          hint = '';
        } else {
          hint = widget.textFieldText;
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      style: TextStyle(color: const Color.fromRGBO(32, 41, 47, 1), letterSpacing: 0.5),
      cursorColor: const Color.fromRGBO(32, 41, 47, 1),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromRGBO(109, 124, 144, 0.1),
        hoverColor: const Color.fromRGBO(109, 124, 144, 0.1),
        focusColor: Colors.red,
        hintText: hint,
        hintStyle: TextStyle(
          color: const Color.fromRGBO(133, 133, 133, 0.7),
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: const Color.fromRGBO(7, 15, 142, 1), width: 2),
        ),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
      ),
    );
  }
}
