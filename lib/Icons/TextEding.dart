import 'package:flutter/material.dart';

TextFormField TextFiled = TextFormField(
  keyboardType: TextInputType.emailAddress,
  decoration: InputDecoration(
    labelText: "Email",
    //   icon: Icon(Icons.email),
    hintText: 'Enter your email',
    // border: OutlineInputBorder()
  ),
  validator: (value) {
    return null;
  },
);

TextFormField creatTeaxtFiled({
  required String labelText,
  required String hentText,
  TextEditingController? contrall,
  required TextInputType keyboardTyp,
}) {
  return TextFormField(
    keyboardType: keyboardTyp,
    controller: contrall,
    decoration: InputDecoration(
      labelText: labelText,

      hintText: hentText,
      // border: OutlineInputBorder()
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
  );
  ;
}
