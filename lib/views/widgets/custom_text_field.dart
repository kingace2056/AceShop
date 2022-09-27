import 'package:flutter/material.dart';

import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/constraints/secrets.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.pdesController,
      required this.hint,
      required this.label,
      this.maxLine = 1,
      this.inputType = TextInputType.text})
      : super(key: key);

  final TextEditingController pdesController;
  final String hint;
  final String label;
  final int maxLine;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: pdesController,
      maxLines: maxLine,
      keyboardType: inputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: secSoftGrey,
        hintText: hint,
        label: Text(
          label,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: primaryBlk,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label can\'t be empty';
        } else {
          return null;
        }
      },
    );
  }
}
