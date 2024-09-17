import 'package:doit/Screens/Cart.dart';
import 'package:doit/Screens/CheckOut.dart';
import 'package:doit/Screens/Homepage.dart';
import 'package:doit/Screens/SplashScreen.dart';
import 'package:doit/Test/TODO/TheTodo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // const String appLogo = 'assets/images/logo.png';
//const String landinf = 'assets/images/landing_background.jpg';

    return MaterialApp(
        // home: BirthDayCard(),
        // home: SplashScreen()
        home: TheTodo());
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    //     title: Text(widget.title),
    //   ),

    //   body: Scrollbar(
    //     //  width: double.infinity,

    //     child: Column(
    //       mainAxisSize: MainAxisSize.max,

    //       //   mainAxisAlignment: MainAxisAlignment.center,
    //       //  crossAxisAlignment: CrossAxisAlignment.end,
    //       children: [
    //         Text("hello"),
    //         Container(
    //           color: Colors.red,
    //           width: 100,
    //           height: 10,
    //           child: Text("hello 1 "),
    //         ),
    //         Container(
    //           color: Colors.red,
    //           width: 100,
    //           height: 10,
    //           child: Text("hello 1 "),
    //         ),
    //         Container(
    //           margin: EdgeInsets.all(10),
    //           color: Colors.red,
    //           width: 100,
    //           height: 100,
    //           child: Text("hello 1 "),
    //         ),
    //         // Image.asset(
    //         //   Birthday,
    //         //   fit: BoxFit.contain,
    //         // ),
    //         //  Image(image: AssetImage(Birthday))
    //       ],
    //     ),
    //   ),

    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _incrementCounter,
    //     tooltip: 'Increment',
    //     child: const Icon(Icons.add),
    //   ), // This trailing comma makes auto-formatting nicer for build methods.
    // );
  }
}

// ElevatedButton(onPressed: () {}, child: Text("Order Now"))

//colum
//MainAxisAlignment    y
//CrossAxisAlignment   x

// row
// MainAxisAlignment   x
// CrossAxisAlignment

// flutter pub get


//  TextButton(
//                     onPressed: () {},
//                     child: Text("ddd"),
//                   )



// ListView.builder(
//   shrinkWrap: true,  // Allows the ListView to size itself based on the items
//   physics: NeverScrollableScrollPhysics(), // Disable inner scrolling to avoid conflict
//   itemCount: DataOfAddress.length,
//   itemBuilder: (context, i) {
//     // your code here
//   },
// )
