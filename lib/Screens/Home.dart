import 'package:doit/Icons/Photo.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>(); // Key for the form
    final _emailContrall = TextEditingController();
    final _paswordContrall = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Text("hello"),
                Text("hello"),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(eventPic1),
                        fit: BoxFit.fill,
                        //
                      )),
                ),
                ClipOval(
                  child: Image.asset(
                    eventPic1, // Replace with your image asset path
                    width: 150.0,
                    height: 150.0,
                    fit: BoxFit.fill,
                  ),
                ),
                CircleAvatar(
                  radius: 105,
                  backgroundColor: Colors.blue,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(eventPic1),
                    radius: 100,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // mainAxisSize: MainAxisSize. ,
                      //
                      children: [
                        Container(
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(8),
                            child: Image(image: AssetImage(thelogo))),
                        SizedBox(width: 30.0),
                        Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 32,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Hello, World!',
                          style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 24.0,
                          ),
                        ),
                        Text(
                          'Sign in  ',
                          style:
                              TextStyle(fontSize: 32, fontFamily: 'Jomolhari'),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _emailContrall,
                          decoration: InputDecoration(
                            labelText: "email",
                            icon: Icon(Icons.email),
                            hintText: 'Enter your email',
                            // border: OutlineInputBorder()
                            border: OutlineInputBorder(),
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
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _paswordContrall,
                          decoration: InputDecoration(
                              labelText: "password",
                              //  helperText: "entre password"
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                          //obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Edit  good password';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Processing Data')));
                            }
                          },
                          child: Text('Submit'),
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
    );
  }
}
