import 'package:doit/Icons/Colors.dart';
import 'package:doit/Icons/Form.dart';
import 'package:doit/Icons/Photo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(thelogo),
          ),
          backgroundColor: theWebColor,
          title: Text(
            "Check Out",
            style: GoogleFonts.openSans(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [TheForm()],
              ),
            ),
          ),
        ));
  }
}
