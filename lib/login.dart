import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:DrMahmoudGadallah/ForgotScreen.dart';
import 'package:DrMahmoudGadallah/signup.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dashboard.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePwd = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  void initState() {
    super.initState();
    Future(() async {
      if (await auth.currentUser() != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => DashboardScreen()));
      }
    });
  }

  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            color: Colors.grey.withOpacity(0.5),
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
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 0,
          ),
          Expanded(
              child: Container(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 0),
              child: Form(
                  key: _formkey,
                  child: ListView(
                    children: <Widget>[
                      Center(
                        child: Text('Login',
                            style: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                                color: HexColor("#00BFA6"))),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 0, left: 30, right: 30),
                        child: Image.asset(
                          'assets/ss.png',
                          width: 200,
                          height: 240,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 60,
                        alignment: Alignment.centerRight,
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                        child: TextFormField(
                          controller: _emailcontroller,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: HexColor("#00BFA6"),
                          ),
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: "Email Address",
                            labelStyle: TextStyle(
                              color: HexColor("#00BFA6"),
                              fontSize: 16.0,
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
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 20),
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
                      Container(
                          padding: EdgeInsets.only(top: 5, left: 20),
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            child: Text(
                              'نسيت كلمة السر؟ ',
                              style: TextStyle(color: Colors.blue),
                            ),
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ForgotScreen()));
                            },
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                        height: 50,
                        child: RaisedButton(
                          color: HexColor(("#00BFA6")),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () async {
                            if (_formkey.currentState.validate()) {
                              var result = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: _emailcontroller.text,
                                      password: _passwordcontroller.text);

                              if (result != null) {
                                // pushReplacement

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashboardScreen()),
                                );
                              } else {
                                print('something wrong');
                              }
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            '---- Or ----',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            //  color:Colors.black,
                            border: Border.all(color: HexColor("#00BFA6")),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.white,
                            child: Text(
                              'New Account',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            // padding: EdgeInsets.all(10),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            },

                            // padding: EdgeInsets.all(10),
                          ),
                        ),
                      )

                      /* RaisedButton(
                  color: Colors.blue,
                  child: Text('Register New Account 2 ',style: TextStyle(color: Colors.white),),
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen2() ) );
                  },
                )*/
                    ],
                  )),
            ),
          )),
        ],
      ),
    );
  }

  void togglePwdVisibility() {
    hidePwd = !hidePwd;
    setState(() {});
  }
}
