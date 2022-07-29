import 'package:flutter/material.dart';

class TextFieldLogin extends StatelessWidget {
  final String hintText;
  final TextInputType? textInputType;
  final IconData? iconData;
  final bool obscureText;
  var controller = TextEditingController();

  TextFieldLogin(
      {required this.hintText,
      this.textInputType,
      this.iconData,
      this.obscureText = false,
      required this.controller});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
      child: TextField(
        controller: controller,
        maxLines: 1,
        style: TextStyle(fontFamily: 'Roboto', color: Colors.black45),
        keyboardType: textInputType,
        showCursor: false,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15),
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Color(0xFFA3A3A3), fontSize: 18, fontFamily: 'Roboto'),
          fillColor: const Color(0xFFF2F2F2),
          filled: true,
          suffixIcon: Icon(
            iconData,
            size: 40,
            color: Color(0xFFA3A3A3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: const Color(0xFFDFDFDF), width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color(0xFFDFDFDF),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
