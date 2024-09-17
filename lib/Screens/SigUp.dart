import 'package:doit/Icons/Colors.dart';
import 'package:doit/Icons/Main_Button.dart';
import 'package:doit/Icons/Photo.dart';
import 'package:doit/Screens/Cart.dart';
import 'package:doit/Screens/Home.dart';
import 'package:doit/Screens/Login.dart';
import 'package:flutter/material.dart';

class SigUp extends StatefulWidget {
  const SigUp({super.key});

  @override
  State<SigUp> createState() => _SigUpState();
}

final TextEditingController _dateController = TextEditingController();

class _SigUpState extends State<SigUp> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>(); // Key for the form
    final _emailContrall = TextEditingController();
    final _paswordContrall = TextEditingController();
    final _firstNameContrall = TextEditingController();
    final _lastNameContrall = TextEditingController();
    final _birthDateContrall = _dateController;
    final _genderController = TextEditingController();
    final _phoneContrall = TextEditingController();

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime(2100),
      );
      if (picked != null) {
        setState(() {
          _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
        });
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(BackLog),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Image.asset(
          //   BackLog,
          //   fit: BoxFit.cover,
          // ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(25.0), // Optional: rounded corners
                  boxShadow: [
                    // Optional: add shadow for better visibility
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, 4), // Shadow position
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Row(
                          children: [
                            Image.asset(thelogo),
                            Expanded(
                              child: Center(
                                child: Container(
                                  child: Text(
                                    'Sign Up  ',
                                    style: TextStyle(
                                        color: theWebColor,
                                        fontSize: 32,
                                        fontFamily: 'Jomolhari'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                keyboardType: TextInputType.name,
                                controller: _firstNameContrall,
                                decoration: InputDecoration(
                                  labelText: "first  anme",
                                  //   icon: Icon(Icons.email),
                                  hintText: 'Enter your name',
                                  // border: OutlineInputBorder()
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  // if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  //     .hasMatch(value)) {
                                  //   return 'Please enter a valid email';
                                  // }
                                  return null;
                                },
                              ),
                              SizedBox(height: 30),
                              TextFormField(
                                keyboardType: TextInputType.name,
                                controller: _lastNameContrall,
                                decoration: InputDecoration(
                                  labelText: "last name",
                                  //   icon: Icon(Icons.email),
                                  hintText: 'last name',
                                  // border: OutlineInputBorder()
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  // if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  //     .hasMatch(value)) {
                                  //   return 'Please enter a valid email';
                                  // }
                                  return null;
                                },
                              ),
                              SizedBox(height: 30),
                              TextFormField(
                                // keyboardType: TextInputType.datetime,
                                controller: _dateController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: 'Select Date',
                                  suffixIcon: Icon(Icons.calendar_today),
                                ),
                                onTap: () => _selectDate(context),
                              ),
                              SizedBox(height: 30),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailContrall,
                                decoration: InputDecoration(
                                  labelText: "email",
                                  //   icon: Icon(Icons.email),
                                  hintText: 'Enter your email',
                                  // border: OutlineInputBorder()
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 30),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                controller: _paswordContrall,
                                decoration: InputDecoration(
                                    labelText: "password",
                                    //  helperText: "entre password"
                                  ),
                                //obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Edit  good password';
                                  }
                                  // if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  //     .hasMatch(value)) {
                                  //   return 'Please enter a valid email';
                                  // }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: _phoneContrall,
                                decoration: InputDecoration(
                                  labelText: "Phone number",
                                  //   icon: Icon(Icons.email),
                                  hintText: 'Phone number',
                                  // border: OutlineInputBorder()
                                  
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  // if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  //     .hasMatch(value)) {
                                  //   return 'Please enter a valid email';
                                  // }
                                  return null;
                                },
                              ),
                              SizedBox(height: 30),
                              GestureDetector(
                                  onTap: () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Cart()),
                                        )
                                      },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Main_Button(text: "Sign Up"),
                                  )

                                  ///
                                  ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(' have account ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        )),
                                    InkWell(
                                      onTap: () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Cart()),
                                        )
                                      },
                                      child: Text(
                                        'Sing UP',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ).copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            ///////////////  how  put  button continaer here outside this coloum and inside this white contianer
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
