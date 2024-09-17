import 'package:doit/Icons/Colors.dart';
import 'package:doit/Icons/DataOfAddress.dart';
import 'package:doit/Icons/Form.dart';
import 'package:doit/Icons/Main_Button.dart';
import 'package:doit/Icons/Photo.dart';
import 'package:doit/Icons/TextEding.dart';
import 'package:doit/Icons/WedigtOfPay.dart';
import 'package:doit/Screens/AddAddress.dart';
import 'package:doit/Screens/Login.dart';
import 'package:doit/Test/PayPay.dart';
import 'package:doit/Test/TODO/TheTodo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  String _selectedPaymentMethod = "delivery";
  int _selectedAddress = 0;
  @override
  Widget build(BuildContext context) {
    // final nameControl = TextEditingController();
    // final _emailContrall = TextEditingController();
    // final _phoneContrall = TextEditingController();
    // final _whatsappPhoneContrall = TextEditingController();
    // final _addressContrall = TextEditingController();
    // final _cityContrall = TextEditingController();
    // final _stateContrall = TextEditingController();
    // final _zipContrall = TextEditingController();
    // final _countryContrall = TextEditingController();
    // final _cardNumberContrall = TextEditingController();

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
      body: Container(
        //  margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(10),
        color: Color(0xffF4F4F4),

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.,
            children: [
              Container(
                // margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                //height: 10,
                color: Colors.white70,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Summary",
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
                      indent: 20,
                      endIndent: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Items"),
                        Text("20     "),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Cost "),
                        Text("120 \$ "),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery Cost"),
                        Text("30 \$ "),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Cost"),
                        Text("150 \$"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  children: [
                    PaymentOption(
                      title: "Pay on delivery",
                      icon: Icons.attach_money,
                      isSelected: _selectedPaymentMethod == "delivery",
                      onTap: () {
                        setState(() {
                          _selectedPaymentMethod = "delivery";
                        });
                      },
                    ),

                    PaymentOption(
                      title: "Debit/Credit Card",
                      icon: Icons.credit_card,
                      isSelected: _selectedPaymentMethod == "Card",
                      onTap: () {
                        setState(() {
                          _selectedPaymentMethod =
                              "Card"; // Ensure this updates
                        });
                      },
                    )

                    // Add other widgets like the "Order Now" button here
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delever To",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          child: Text(
                            DataOfAddress.isEmpty ? "Add Address" : "Change",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.all(20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Delever To "),
                                                InkWell(
                                                  child: Icon(Icons.close),
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                )
                                              ],
                                            ),
                                          ),
                                          DataOfAddress.isEmpty
                                              ? Center(
                                                  child: Text(
                                                      "add a new  address"),
                                                )
                                              : ListView.builder(
                                                  shrinkWrap:
                                                      true, // Allows the ListView to size itself based on the items
                                                  physics:
                                                      NeverScrollableScrollPhysics(), // Disable inner scrolling to avoid conflict
                                                  itemCount:
                                                      DataOfAddress.length,
                                                  itemBuilder: (context, i) {
                                                    // var i = DataOfAddress[index];
                                                    return InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _selectedAddress = i;
                                                        });
                                                        Navigator.pop(
                                                            context); // Close the bottom sheet
                                                      },
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        margin: EdgeInsets.only(
                                                            top: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                          width: 0.5,
                                                          color:
                                                              _selectedAddress ==
                                                                      i
                                                                  ? theWebColor
                                                                  : Colors.grey
                                                                      .shade300,
                                                        )),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .location_on_outlined,
                                                                  color: _selectedAddress ==
                                                                          i
                                                                      ? theWebColor
                                                                      : Colors
                                                                          .grey,
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      DataOfAddress[
                                                                              i]
                                                                          .city,
                                                                    ),
                                                                    Text(DataOfAddress[
                                                                            i]
                                                                        .street)
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            Icon(
                                                              _selectedAddress ==
                                                                      i
                                                                  ? Icons
                                                                      .check_circle
                                                                  : Icons
                                                                      .check_circle_outline_sharp,
                                                              color: _selectedAddress ==
                                                                      i
                                                                  ? theWebColor
                                                                  : Colors.grey,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          InkWell(
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              margin:
                                                  EdgeInsets.only(bottom: 18),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: theWebColor)),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              AddAddress()));
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.add,
                                                        color: theWebColor),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "Add new address",
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                            ///////////////////////
                          },
                        )
                      ],
                    ),
                    DataOfAddress.isNotEmpty
                        ? Row(
                            children: [
                              Icon(Icons.location_on_outlined),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                //  mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start, //
                                children: [
                                  Text(DataOfAddress[_selectedAddress].city),
                                  Text(DataOfAddress[_selectedAddress].street),
                                ],
                              )
                            ],
                          )
                        : InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddAddress()));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.add, color: theWebColor),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Add new address",
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          ),
                  ],
                ),
              ),
              Container(
                // margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(10),

                // child: TheForm()
              ),
              SizedBox(height: 5),
              //   Spacer(),
              Container(
                child: Main_Button(text: "Place Order"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
