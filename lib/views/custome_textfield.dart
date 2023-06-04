import 'package:flutter/material.dart';

import '../constant.dart';

class CustomTextfield extends StatelessWidget {
  TextEditingController controller;
  TextInputType? textInputType;
  Widget? suffix;
  final String title;
  final Function validator;

  CustomTextfield(
      {required this.title,
        required this.validator,
        required this.controller,
        this.suffix,
        this.textInputType});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      validator: (x) => validator(x),
      decoration: InputDecoration(
        filled: true,
        fillColor: KgreeyColor,
        suffixIcon: suffix,
        hintText: title,
        hintStyle: TextStyle(
          color: KlightgreeyColor,
          fontFamily: 'Courgette-Regular',
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}