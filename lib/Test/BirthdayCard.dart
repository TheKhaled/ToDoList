import 'package:doit/Icons/Photo.dart';
import 'package:flutter/material.dart';

class BirthDayCard extends StatelessWidget {
  const BirthDayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD2BCD5),
      body: Center(
        child: Image.asset(
          Birthday,
          // fit: BoxFit.cover,
        ),
      ),
    );
  }
}

///  backgroundColor: Color(0xFF  -----   ),               