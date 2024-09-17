import 'dart:math';
import 'package:doit/Icons/Colors.dart';
import 'package:doit/Screens/CheckOut.dart';
import 'package:doit/Screens/EmptyCard.dart';
import 'package:doit/Screens/SplashScreen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:doit/Icons/Main_Button.dart';
import 'package:doit/Icons/Photo.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _count = 1;
  final int _unitPrice = 100;
  int _total = 0;
  void _incramnt(index) {
    setState(() {
      index['count']++;
      index['total'] = index['count'] * index['price'];
    });
  }

  void initState() {
    super.initState();
    _total = _unitPrice * _count;
  }

  void _Decressmant(item) {
    setState(() {
      if (item['count'] > 1) {
        //  _count--;
        //   _total = _count * _unitPrice;
        item['count']--;
        item['total'] = item['count'] * item['price'];
      }
    });
  }

  List<Map<String, dynamic>> items = [
    {
      'name': 'Desk Lamp',
      'price': 35.0,
      'category': 'Home Goods',
      'stock': 30,
      'count': 1,
      'total': 35.0
    },
    {
      'name': 'Coffee Maker',
      'price': 50.0,
      'category': 'Appliances',
      'stock': 15,
      'count': 1,
      'total': 50.0
    },
    {
      'name': 'Bookshelf',
      'price': 120.0,
      'category': 'Furniture',
      'stock': 10,
      'count': 1,
      'total': 120.0
    },
    {
      'name': 'Bluetooth Speaker',
      'price': 80.0,
      'category': 'Electronics',
      'stock': 20,
      'count': 1,
      'total': 80.0
    },
    {
      'name': 'Office Chair',
      'price': 150.0,
      'category': 'Furniture',
      'stock': 5,
      'count': 1,
      'total': 150.0
    },
    {
      'name': 'Smartphone',
      'price': 699.0,
      'category': 'Electronics',
      'stock': 8,
      'count': 1,
      'total': 699.0
    },
    {
      'name': 'Desk Organizer',
      'price': 25.0,
      'category': 'Office Supplies',
      'stock': 25,
      'count': 1,
      'total': 25.0
    },
    {
      'name': 'Wall Art',
      'price': 60.0,
      'category': 'Home Decor',
      'stock': 12,
      'count': 1,
      'total': 60.0
    },
    {
      'name': 'Air Purifier',
      'price': 120.0,
      'category': 'Appliances',
      'stock': 6,
      'count': 1,
      'total': 120.0
    },
    {
      'name': 'Headphones',
      'price': 120.0,
      'category': 'Electronics',
      'stock': 18,
      'count': 1,
      'total': 120.0
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(thelogo),
          ),
          backgroundColor: theWebColor,
          title: Text(
            " My cart",
            style: GoogleFonts.openSans(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: items.isEmpty
            ? Emptycard()
            : Column(
                children: [
                  Container(
                    //   height: MediaQuery.of(context).size.height - 120,
                    child: Expanded(
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return (Container(
                            margin: EdgeInsets.all(15),
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            height: 150,
                            //  color: Colors.white,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: theWebColor, width: .5)),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 100, // Fixed width
                                  height: 100, // Fixed height
                                  child: Image.asset(eventPic2,
                                      fit: BoxFit
                                          .cover), // Adjust path and fit as needed
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        item['name'],
                                        style: GoogleFonts.openSans(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.add),
                                            onPressed: () {
                                              _incramnt(item);
                                            },
                                            iconSize: 18,
                                            color: Colors.black,
                                            padding: EdgeInsets.zero,
                                            //  constraints: BoxConstraints(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Text(
                                              item['count'].toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.remove),
                                            iconSize: 18,
                                            color: Colors.black,
                                            padding: EdgeInsets.zero,
                                            constraints: BoxConstraints(),
                                            onPressed: () {
                                              _Decressmant(item);
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.delete_outline),
                                        onPressed: () {
                                          setState(() {
                                            items.removeAt(index);
                                          });
                                        },
                                        iconSize: 20,
                                        color: theWebColor,
                                        padding: EdgeInsets.zero,
                                        //  constraints: BoxConstraints(),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Text(
                                        item['total'].toString(),
                                        style: GoogleFonts.openSans(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ));
                        },
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: theWebColor, width: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              minimumSize: Size(200, 50),
                            ),
                            onPressed: () {},
                            child: InkWell(
                              onTap: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CheckOut()),
                                )
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'total price is 540',
                                    style: GoogleFonts.openSans(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0,
                                  ),
                                  Text(
                                    '__________________________',
                                    style: GoogleFonts.openSans(
                                      color: const Color.fromARGB(
                                          255, 201, 171, 129),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Go to Checkout",
                                    style: GoogleFonts.openSans(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        // Main_Button(text: 'total price is 540'),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Main_Button(text: 'pay Now'),
                        // SizedBox(
                        //   height: 10,
                        // )
                      ],
                    ),
                  ),
                ],
              )

        //   Positioned(bottom: 0, child: Main_Button(text: "payNow"))
        );
  }
}
