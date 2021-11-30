import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:DrMahmoudGadallah/dashboard.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_database/firebase_database.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({this.app});
  final FirebaseApp app;
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool hidePwd = true;

  final referenceDatase = FirebaseDatabase.instance;
  void initState() {
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  TextEditingController _namecontroller = TextEditingController();

  TextEditingController _homeaddresscontroller = TextEditingController();

  TextEditingController _agecontroller = TextEditingController();

  TextEditingController _phonenumber = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    _namecontroller.dispose();

    _homeaddresscontroller.dispose();

    _agecontroller.dispose();
    _phonenumber.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ref = referenceDatase.reference().child("users");
    // ignore: todo
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
            margin: EdgeInsets.all(5),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: HexColor("#FF0000").withOpacity(0.5),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 0, left: 0),
                child: Text('New Account',
                    style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: HexColor("#00BFA6"))),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                  child: Container(
                height: double.infinity,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assets/ss.png"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.15), BlendMode.dstATop),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Form(
                    key: _formkey,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(children: <Widget>[
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 20),
                            child: TextFormField(
                              controller: _emailcontroller,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: HexColor("#00BFA6"),
                              ),
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                labelText: "Email Address",
                                labelStyle: TextStyle(
                                  color: HexColor("#00BFA6"),
                                  fontSize: 18.0,
                                  // backgroundColor:HexColor("#DFB063"),
                                ),
                                hintText: "Enter your Email",
                                hintStyle: TextStyle(
                                  color: HexColor("#00BFA6"),
                                ),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10),
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: BorderSide(
                                      color: HexColor("#00BFA6"), width: 2.0),
                                ),
                                focusedBorder: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: HexColor("#00BFA6"), width: 2.0),
                                ),
                              ),
                              validator: (item) {
                                return item.contains("@")
                                    ? null
                                    : "Enter the correct email";
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 20),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextFormField(
                                    textAlign: TextAlign.left,
                                    controller: _passwordcontroller,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: HexColor("#00BFA6"),
                                    ),
                                    decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      labelText: "password",
                                      labelStyle: TextStyle(
                                        color: HexColor("#00BFA6"),
                                        fontSize: 18.0,
                                        // backgroundColor:HexColor("#DFB063"),
                                      ),
                                      hintText: "Enter your password",
                                      hintStyle: TextStyle(
                                        color: HexColor("#00BFA6"),
                                      ),
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10),
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: BorderSide(
                                            color: HexColor("#00BFA6"),
                                            width: 2.0),
                                      ),
                                      focusedBorder: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: HexColor("#00BFA6"),
                                            width: 2.0),
                                      ),
                                    ),
                                    obscureText: hidePwd,
                                    validator: (item) {
                                      return item.length > 6
                                          ? null
                                          : "The password must be 6 digits";
                                    },
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  child: IconButton(
                                      onPressed: togglePwdVisibility,
                                      icon: IconButton(
                                        icon: hidePwd == true
                                            ? Icon(Icons.visibility_off)
                                            : Icon(Icons.visibility),
                                        onPressed: () {},
                                      )),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 20),
                            child: TextFormField(
                              controller: _namecontroller,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: HexColor("#00BFA6"),
                              ),
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                labelText: "Name",
                                labelStyle: TextStyle(
                                  color: HexColor("#00BFA6"),
                                  fontSize: 18.0,
                                  // backgroundColor:HexColor("#DFB063"),
                                ),
                                hintText: "Enter your Name",
                                hintStyle: TextStyle(
                                  color: HexColor("#00BFA6"),
                                ),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10),
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: BorderSide(
                                      color: HexColor("#00BFA6"), width: 2.0),
                                ),
                                focusedBorder: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: HexColor("#00BFA6"), width: 2.0),
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter the correct Name';
                                }
                                return value;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 20),
                            child: TextFormField(
                              textDirection: TextDirection.ltr,
                              controller: _agecontroller,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: HexColor("#00BFA6"),
                              ),
                              textAlign: TextAlign.left,
                              autofocus: true,
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                labelText: "Age",
                                labelStyle: TextStyle(
                                  color: HexColor("#00BFA6"),
                                  fontSize: 18.0,

                                  // backgroundColor:HexColor("#DFB063"),
                                ),
                                hintText: "Enter your age",
                                hintStyle: TextStyle(
                                  color: HexColor("#00BFA6"),
                                ),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10),
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: BorderSide(
                                      color: HexColor("#00BFA6"), width: 2.0),
                                ),
                                focusedBorder: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: HexColor("#00BFA6"), width: 2.0),
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter the correct age';
                                }
                                return value;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                left: 40,
                                right: 40,
                              ),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                color: Colors.blue,
                                child: Text(
                                  'تسجيل حساب جديد',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                onPressed: () async {
                                  if (_formkey.currentState.validate()) {
                                    var result = await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: _emailcontroller.text,
                                            password: _passwordcontroller.text);

                                    if (result != null) {
                                      FirebaseUser user = await FirebaseAuth
                                          .instance
                                          .currentUser();
                                      ref
                                          .child(
                                        user.uid,
                                      )
                                          .set({
                                        "Name": _namecontroller.text,
                                        "Home Address":
                                            _homeaddresscontroller.text,
                                        "Age": _agecontroller.text,
                                        "email": _emailcontroller.text,
                                        "Phone Number": _phonenumber.text,
                                      });
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DashboardScreen()),
                                      );
                                    } else {
                                      print("fsdgdf");
                                    }
                                  }
                                },
                              ))
                        ])),
                  ),
                ),
              )),
            ],
          ),
        ));
  }

  void togglePwdVisibility() {
    hidePwd = !hidePwd;
    setState(() {});
  }
}
