import 'package:doit/Icons/Colors.dart';
import 'package:doit/Screens/Cart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Main_Button extends StatelessWidget {
  final String text;
  const Main_Button({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: theWebColor, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          minimumSize: Size(200, 50),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cart()),
          );
        },
        child: Text(
          text,
          style: GoogleFonts.openSans(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ));
  }
}
