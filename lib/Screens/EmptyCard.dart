import 'package:doit/Icons/Main_Button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Emptycard extends StatelessWidget {
  const Emptycard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 100,
            color: Colors.grey,
          ),
          SizedBox(height: 20),
          Text(
            "Your cart is empty",
            style: GoogleFonts.openSans(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Looks like you haven't added anything to your cart yet.",
              style: GoogleFonts.openSans(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Main_Button(text: "Shop Now"),
          // ElevatedButton(
          //   onPressed: () {
          //     // Navigate to product page or perform any action
          //   },
          //   child: Text("Shop Now"),
          //   style: ElevatedButton.styleFrom(
          //     foregroundColor: Colors.white,
          //     backgroundColor: const Color.fromARGB(
          //         255, 201, 171, 129), // Text color
          //   ),
          // ),
        ],
      ),
    );
  }
}
