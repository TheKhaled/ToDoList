import 'package:doit/Icons/WedigtOfPay.dart';
import 'package:flutter/material.dart';

class PayPay extends StatefulWidget {
  const PayPay({super.key});

  @override
  State<PayPay> createState() => _PayPayState();
}

class _PayPayState extends State<PayPay> {
  @override
  Widget build(BuildContext context) {
    String _selectedPaymentMethod = "Pay on delivery";

    return Scaffold(
      appBar: AppBar(
        title: Text("Check Out"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            PaymentOption(
              title: "Pay on delivery",
              icon: Icons.attach_money,
              isSelected: _selectedPaymentMethod == "Pay on delivery",
              onTap: () {
                setState(() {
                  _selectedPaymentMethod = "Pay on delivery";
                });
              },
            ),
            PaymentOption(
              title: "Debit/Credit Card",
              icon: Icons.credit_card,
              isSelected: _selectedPaymentMethod == "Debit/Credit Card",
              onTap: () {
                setState(() {
                  _selectedPaymentMethod = "Debit/Credit Card";
                });
              },
            ),
            // Add other widgets like the "Order Now" button here
          ],
        ),
      ),
    );
  }
}
