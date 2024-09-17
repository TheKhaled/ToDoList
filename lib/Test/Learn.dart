import 'package:doit/Icons/Photo.dart';
import 'package:flutter/material.dart';

class Learn extends StatelessWidget {
  const Learn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("hello"),
            Text("hello"),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(logoAPP))),
            )
          ],
        ),
      ),
    );
  }
}
