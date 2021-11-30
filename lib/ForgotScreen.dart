import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class ForgotScreen extends StatelessWidget {
  TextEditingController editController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Column(children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black87,
                  fontWeight: FontWeight.w700,
                ),
              )),
          SizedBox(
            height: 15,
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "WE will mail you a link...please click on that link to reset your password",
                style: TextStyle(fontSize: 20, color: Colors.black87),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.grey.withOpacity(0.2),
            ),
            child: TextFormField(
              controller: editController,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              decoration: InputDecoration(
                  hintText: "Email",
                  icon: Icon(
                    Icons.person,
                    //color: primaryColor,
                  ),
                  border: InputBorder.none),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Fill Email Input';
                }
                return value;
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: RaisedButton(
              onPressed: () async {
                resetPassword(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.blue,
              child: Text(
                'Reset password',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              padding: EdgeInsets.all(10),
            ),
          )
        ]));
  }

  void resetPassword(BuildContext context) async {
    if (editController.text.length == 0 || !editController.text.contains("@")) {
      Fluttertoast.showToast(msg: "Enter valid email");
      return;
    }

    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: editController.text);
    Fluttertoast.showToast(
        msg:
            "Reset password link has sent your mail please use it to change the password.");
    Navigator.pop(context);
  }
}
