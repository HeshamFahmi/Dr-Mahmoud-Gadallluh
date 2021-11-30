import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
//import 'package:flutter_with_firebase/login.dart';
import 'login.dart';
import 'dashboard.dart';
import 'signup.dart';

//import 'package:splashscreen/splashscreen.dart';
import 'fristpage.dart';
import 'package:DrMahmoudGadallah/fristpage.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        // '/dashboard':(context)=>DashboardScreen(),
        "dashboard": (context) {
          return DashboardScreen();
        },
        //'/Reservation': (context) => Reservation(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 0.0),
                  child: Text('Hello',
                      style: TextStyle(
                          fontSize: 45.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(32.0, 60.0, 0.0, 0.0),
                  child: Text('There',
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(130.0, 60.0, 0.0, 0.0),
                  child: Text('.',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(top: 2, left: 30, right: 30),
            child: Image.asset(
              'assets/ss.png',
              width: 200,
              height: 240,
            ),
          ),
          SizedBox(
            height: 120,
          ),
          Container(
            margin: EdgeInsets.only(left: 50, right: 50),
            height: 50,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: HexColor("#00BFA6")),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: InkWell(
              onTap: openLogin,
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Container(
            margin: EdgeInsets.only(left: 51, right: 50),
            height: 50,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: HexColor("#00BFA6"),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: InkWell(
              onTap: openSignUp,
              child: Center(
                child: Text(
                  "Sign UP",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  void openSignUp() {
    Navigator.pushNamed(context, '/signup');
  }

  void openLogin() {
    Navigator.pushNamed(context, '/login');
  }
}
