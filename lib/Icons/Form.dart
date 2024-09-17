import 'package:doit/Icons/Colors.dart';
import 'package:doit/Icons/DataOfAddress.dart';
import 'package:doit/Icons/Main_Button.dart';
import 'package:doit/Icons/TextEding.dart';
import 'package:doit/Test/TODO/TheTodo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TheForm extends StatelessWidget {
  const TheForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final _cityControll = TextEditingController();

    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Shipping Adress",
              style: GoogleFonts.openSans(
                color: theWebColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 0,
              endIndent: 20,
            ),
            creatTeaxtFiled(
                labelText: 'name',
                hentText: "entre your name",
                keyboardTyp: TextInputType.text),
            creatTeaxtFiled(
                labelText: 'phone',
                hentText: "entre your phone",
                keyboardTyp: TextInputType.text),
            creatTeaxtFiled(
                labelText: 'Anthor phone',
                hentText: "entre your phone",
                keyboardTyp: TextInputType.text),
            creatTeaxtFiled(
                labelText: 'address',
                hentText: "entre your address",
                keyboardTyp: TextInputType.text),
            creatTeaxtFiled(
              labelText: 'city',
              hentText: "entre your city",
              keyboardTyp: TextInputType.text,
              contrall: _cityControll,
            ),
            creatTeaxtFiled(
                labelText: 'street',
                hentText: "entre your street",
                keyboardTyp: TextInputType.text),
            creatTeaxtFiled(
                labelText: 'famous place',
                hentText: "entre famous place next to you ",
                keyboardTyp: TextInputType.text),
            SizedBox(height: 15),
            Center(
              child: InkWell(
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TheTodo()),
                      );
                    }
                  },
                  child: Main_Button(text: "Add address")),
            )
          ],
        ));
  }
}
