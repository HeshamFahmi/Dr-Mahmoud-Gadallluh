import 'package:flutter/material.dart';
import 'dart:async';
import 'package:DrMahmoudGadallah/main.dart';
import 'package:shimmer/shimmer.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _mockCheckForSession().then((status) {
      if (status) {
        _navigateToHome();
      } else {
        _navigateToLogin();
      }
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(seconds: 5), () {});

    return true;
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SizedBox(
              height: 600,
            ),
            Opacity(
                opacity: 1,
                child: Image.asset(
                  'assets/ss.png',
                  width: 660,
                  height: 300,
                )),
            Shimmer.fromColors(
              // period: Duration(milliseconds: 1500),
              baseColor: HexColor("#00BFA6"),
              highlightColor: HexColor("#00BFA6"),
              child: Container(
                padding: EdgeInsets.only(top: 600),
                child: Text(
                  "اهلا بكم في العيادة"
                  //  "عيادة دكتور محمد بكري "

                  ,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontSize: 35.0,
                      fontFamily: 'Pacifico',
                      shadows: <Shadow>[
                        Shadow(
                            blurRadius: 50.0,
                            color: Colors.black87,
                            offset: Offset.fromDirection(100, 12))
                      ]),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
