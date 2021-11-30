import 'package:flutter/material.dart';
import 'package:DrMahmoudGadallah/selct/Reservation.dart';
import 'package:DrMahmoudGadallah/selct/doctor.dart';
import 'package:DrMahmoudGadallah/selct/informations.dart';
import 'package:DrMahmoudGadallah/selct/profile.dart';
import 'package:hexcolor/hexcolor.dart';
//import 'package:flutter_app5/selct/Reservation.dart';
//import 'package:flutter_app5/selct/doctor.dart';
import 'login.dart';
//import 'selct/Reservation.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter_app5/selct/informations.dart';
//import 'package:flutter_app5/selct/profile.dart';
import 'package:firebase_database/firebase_database.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreen createState() => _DashboardScreen();
}

var arr = new List(5);

// ignore: non_constant_identifier_names
final DBRef = FirebaseDatabase.instance.reference();
final FirebaseAuth _auth = FirebaseAuth.instance;

readUserData() async {
  final FirebaseUser user = await _auth.currentUser();
  final uid = user.uid;
  print(uid);
  DBRef.child("users").child(uid).once().then((DataSnapshot data) {
    Map<dynamic, dynamic> values = data.value;

    arr[0] = values["Name"];
    arr[1] = values["Age"];
    arr[2] = values["email"];

    print(arr);
  });
}

class _DashboardScreen extends State<DashboardScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    readUserData();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                logout();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginScreen()));
              },
              icon: Icon(Icons.person),
              label: Text(
                "تسجيل الخروج",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ))
        ],
      ),
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Hello",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(19)),
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: 3,
                ),
                child: Image.asset(
                  'assets/ss.png',
                  width: 0,
                  height: 240,
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 50, right: 50),
            height: 50,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: HexColor("#00BFA6"),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: InkWell(
              highlightColor: Colors.pinkAccent.withOpacity(1),
              splashColor: Colors.indigo.shade900,
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Reservation()));
              },
              child: Center(
                child: Text(
                  "المواعيد",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 50, right: 50),
            height: 50,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: HexColor("#00BFA6"),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage(text: arr.toList())),
                );
              },
              child: Center(
                child: Text(
                  "حسابي",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 50, right: 50),
            height: 50,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: HexColor("#00BFA6"),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: InkWell(
              highlightColor: Colors.pinkAccent.withOpacity(1),
              splashColor: Colors.indigo.shade900,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PostsScreen()),
                );
              },
              child: Center(
                child: Text(
                  "اعرف اكتر",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 50, right: 50),
            height: 50,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: HexColor("#00BFA6"),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: InkWell(
              highlightColor: Colors.pinkAccent.withOpacity(1),
              splashColor: Colors.indigo.shade900,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Doctor()),
                );
              },
              child: Center(
                child: Text(
                  "عن العيادة",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
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
