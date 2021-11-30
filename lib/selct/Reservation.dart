import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:DrMahmoudGadallah/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hexcolor/hexcolor.dart';

void main() => runApp(Reservation());

/*class Reservation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
     // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}*/
// ignore: non_constant_identifier_names
final DBRef = FirebaseDatabase.instance.reference();
final FirebaseAuth _auth = FirebaseAuth.instance;

var userName;
var userAge;
var userEmail;
var userAddress;

void readUserData() async {
  final FirebaseUser user = await _auth.currentUser();
  final uid = user.uid;
  print(uid);
  DBRef.child("users")
      .child(uid) /*.child("Name")*/ .once()
      .then((DataSnapshot data) {
    Map<dynamic, dynamic> values = data.value;

    userName = values["Name"];
    userAge = values["Age"];
    userEmail = values["email"];
    userAddress = values["Home Address"];
  });
}

void abc() {
  Fluttertoast.showToast(
    msg: "عفوا اكتملت الحجزات هنا ",
  );
}

void ab() {
  Fluttertoast.showToast(
    msg: "تم الحجز ",
    gravity: ToastGravity.TOP,
  );
}

void readUserDataClicks(var date, var btnTime) async {
  DBRef.child("Reservation")
      .child(date)
      .child(btnTime)
      .once()
      .then((DataSnapshot data) {
    Map<dynamic, dynamic> values = data.value;

    print(values.keys.length);

    if (values.keys.length > 10) {
      abc();
    }
  });
}

void writeData(var date, var btnTime) async {
  final FirebaseUser user = await _auth.currentUser();
  final uid = user.uid;

  DBRef.child("Reservation").child(date).child(btnTime).child(uid).set({
    'Name': userName,
    'Email': userEmail,
    'Age': userAge,
    'Address': userAddress,
  });
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("موافق"),
    onPressed: () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DashboardScreen()));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "شكرا ",
      textDirection: TextDirection.rtl,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    content: Text("تم تاكيد الحجز", textDirection: TextDirection.rtl),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class Reservation extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);

  //final String title;

  @override
  _ReservationState createState() => _ReservationState();
}

var from1To2Patients = 0;
var from2To3Patients = 0;
var from3To4Patients = 0;
var from4To5Patients = 0;

var from7To8Patients = 0;
var from8To9Patients = 0;
var from9To10Patients = 0;

class _ReservationState extends State<Reservation> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate) {
      // ok button
      setState(() {
        selectedDate = picked;
      });

      print("ok buttom");
    }

    if (picked == null) {
      // cancel bottom
      print("cancel buttom");
    }
  }

  @override
  Widget build(BuildContext context) {
    readUserData();
    //var date = "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";

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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  );
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
            actions: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey.withOpacity(0.5),
                ),
                child: IconButton(
                  onPressed: () => _selectDate(context),
                  icon: Icon(
                    Icons.calendar_today,
                    color: Colors.black,
                  ),
                ),
              )
            ]),
        body: Container(
          height: double.infinity,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/ss.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.25), BlendMode.dstATop),
            ),
          ),
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  ":اهلا بيك ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  "${selectedDate.toLocal()}".split(' ')[0],
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              IconButton(
                onPressed: () => _selectDate(context),
                icon: Icon(
                  Icons.calendar_today,
                  color: Colors.black,
                ),
              ),
              // SizedBox(height: 5,),

              Center(
                child: Text(
                  " :المواعيد المتاحة ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),

              SizedBox(
                height: 10,
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
                      setState(() {
                        from1To2Patients++;
                        if (from1To2Patients == 11) {
                          from1To2Patients--;
                          abc();
                        }
                        var date =
                            "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
                        writeData(date, "From1To2");
                        readUserDataClicks(date, "From1To2");
                        showAlertDialog(context);
                      });
                    },
                    child: Center(
                      child: Text(
                        "   من 1 الي 2   ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  )),
              // SizedBox(height: 20,),

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
                      setState(() {
                        from2To3Patients++;
                        if (from2To3Patients == 11) {
                          from2To3Patients--;
                          abc();
                        }
                        readUserData();
                        var date =
                            "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
                        writeData(date, "From2To3");
                        readUserDataClicks(date, "From2To3");
                        showAlertDialog(context);
                      });
                    },
                    child: Center(
                      child: Text(
                        " من 2 الي 3 ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  )),
              // SizedBox(height: 20,),

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
                      setState(() {
                        from3To4Patients++;
                        if (from3To4Patients == 11) {
                          from3To4Patients--;
                          abc();
                        }
                        readUserData();
                        var date =
                            "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
                        writeData(date, "From3To4");
                        readUserDataClicks(date, "From3To4");
                        showAlertDialog(context);
                      });
                    },
                    child: Center(
                      child: Text(
                        "   من 3 الي 4   ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  )),
              // SizedBox(height: 20,),

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
                      setState(() {
                        from4To5Patients++;
                        if (from4To5Patients == 11) {
                          from4To5Patients--;
                          abc();
                        }
                        readUserData();
                        var date =
                            "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
                        writeData(date, "From4To5");
                        readUserDataClicks(date, "From4To5");
                        showAlertDialog(context);
                      });
                    },
                    child: Center(
                      child: Text(
                        "   من 4 الي 5   ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  )),
              // SizedBox(height: 20,),

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
                    child: Center(
                      child: Text(
                        "  استراحه  ",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  )),
              // SizedBox(height: 20,),

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
                      setState(() {
                        from7To8Patients++;
                        if (from7To8Patients == 11) {
                          from7To8Patients--;
                          abc();
                        }

                        readUserData();
                        var date =
                            "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
                        writeData(date, "From7To8");
                        readUserDataClicks(date, "From7To8");
                        showAlertDialog(context);
                      });
                    },
                    child: Center(
                      child: Text(
                        "   من 7 الي 8   ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  )),
              // SizedBox(height: 20,),

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
                      setState(() {
                        from8To9Patients++;
                        if (from8To9Patients == 11) {
                          from8To9Patients--;
                          abc();
                        }

                        readUserData();
                        var date =
                            "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
                        writeData(date, "From8To9");
                        readUserDataClicks(date, "From8To9");
                        showAlertDialog(context);
                      });
                    },
                    child: Center(
                      child: Text(
                        "   من 8 الي 9   ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  )),
              // SizedBox(height: 20,),

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
                      setState(() {
                        readUserData();
                        var date =
                            "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
                        writeData(date, "From9To10");
                        readUserDataClicks(date, "From9To10");
                        showAlertDialog(context);
                      });
                    },
                    child: Center(
                      child: Text(
                        "   من 9 الي 10   ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  )),
              // SizedBox(height: 20,),

              SizedBox(
                height: 15,
              )
            ],
          ),
        ));
  }
}
