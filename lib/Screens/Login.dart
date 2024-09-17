import 'package:doit/Icons/Colors.dart';
import 'package:doit/Icons/Main_Button.dart';
import 'package:doit/Icons/Photo.dart';
import 'package:doit/Screens/Home.dart';
import 'package:doit/Screens/SigUp.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>(); // Key for the form
    final _emailContrall = TextEditingController();
    final _paswordContrall = TextEditingController();
    return Scaffold(
      // appBar: AppBar(),
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
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        25.0), // Optional: rounded corners
                    boxShadow: [
                      // Optional: add shadow for better visibility
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0, 4), // Shadow position
                      ),
                    ],
                  ),
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
                                    'Sign in  ',
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontFamily: 'Jomolhari',
                                        color: theWebColor),
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
                                obscureText: true,
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
                              Container(
                                margin: EdgeInsets.all(5),
                                alignment: Alignment.topRight,
                                child: Text('Forget Password',
                                    style: TextStyle(fontFamily: 'Jomolhari')),
                              ),
                              SizedBox(height: 20),
                              // Container(
                              //   width: 165,
                              //   height: 63,
                              //   child: ElevatedButton(
                              //     style: ElevatedButton.styleFrom(
                              //       foregroundColor: Colors.white,
                              //       backgroundColor: Colors.black,
                              //       elevation: 10,
                              //     ),
                              //     onPressed: () {
                              //       if (_formKey.currentState!.validate()) {
                              //         Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (context) => HomeScreen()),
                              //         );
                              //         ScaffoldMessenger.of(context)
                              //             .showSnackBar(SnackBar(
                              //                 content:
                              //                     Text('Processing Data')));
                              //       }
                              //     },
                              //     child: Text(
                              //       'Sign in ',
                              //       style: TextStyle(fontSize: 25),
                              //     ),
                              //   ),
                              // ),
                              Main_Button(text: "Sig in"),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Create account ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        )),
                                    InkWell(
                                      onTap: () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SigUp()),
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
