import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:DrMahmoudGadallah/dashboard.dart';

// ignore: non_constant_identifier_names
final DBRef = FirebaseDatabase.instance.reference();

void main() => runApp(Doctor());

var list = new List();

class Doctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white.withOpacity(.2),
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
        ),
        body: ListView(children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Column(
            children: <Widget>[
              ClipPath(
                child: Container(color: Colors.purpleAccent),
                clipper: getClipper(),
              ),
              Center(
                  //  width: 410.0,
                  //  top: MediaQuery.of(context).size.height ,

                  child: Column(
                children: <Widget>[
                  SizedBox(height: 30.0),
                  Text(
                    'د/ محمود محمد جادالله',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Montserrat'),
                  ),
                  SizedBox(height: 5.0),
                  SizedBox(height: 5.0),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                          height: 200,

                          //alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            color: HexColor("#00BFA6"),
                          ),
                          padding: EdgeInsets.only(left: 2, right: 2, top: 10),
                          child: ListView(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    left: 60.0, right: 60.0, top: 2.0),
                                child: Container(
                                  width: 200,
                                  child: Center(
                                      child: Text(
                                    "بيانات عن الطبيب",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: HexColor("#00BFA6"),
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal,

                                      //    fontFamily: 'Montserrat'
                                    ),
                                  )),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),

                              // padding: EdgeInsets.only(
                              //   left: 15.0, right: 15.0, top: 2.0),

                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                      child: Container(
                                    child: Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Container(
                                          // margin: EdgeInsets.only(left: 15),

                                          //alignment: Alignment.centerRight,

                                          child: Text(
                                            "▫ اخصائي النساء والتوليد والعقم"
                                            "\n▫الكشف بالاشعه التليفزيونية",
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal,
                                              //    fontFamily: 'Montserrat'
                                            ),
                                          ),
                                        )),
                                    //     height: 220,
                                  )),
                                ],
                              )
                            ],
                          ))),
                  SizedBox(height: 20.0),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                          height: 300,

                          //alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            color: HexColor("#00BFA6"),
                          ),
                          padding: EdgeInsets.only(left: 2, right: 2, top: 2),
                          child: ListView(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    left: 60.0, right: 60.0, top: 10.0),
                                child: Container(
                                  width: 200,
                                  child: Center(
                                      child: Text(
                                    "بيانات عن العيادة",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: HexColor("#00BFA6"),
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal,

                                      //    fontFamily: 'Montserrat'
                                    ),
                                  )),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),

                              // padding: EdgeInsets.only(
                              //   left: 15.0, right: 15.0, top: 2.0),

                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                      child: Container(
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Container(
                                          // margin: EdgeInsets.only(left: 15),

                                          //alignment: Alignment.centerRight,

                                          child: Text(
                                            "▫العياده مجهزه باحداث الاجهزه الطبيه"
                                            "\n▫أشعة رباعية الأبعاد للاطمئنان على صحة الجنين ."
                                            "\n▫ تشخيص وجراحة لكل مشاكل وعيوب الرحم الخلقية ."
                                            "\n▫يوجد جهاز VINNO G86 "
                                            "\n▫يعمل الجهاز بجميع الانماط بجودة صوره 3D /4D  /5D ويقبل جميع الميزات النسائية و التوليد المتخصصه لكشف التشوهات الجنينة .",
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal,
                                              //    fontFamily: 'Montserrat'
                                            ),
                                          ),
                                        )),
                                    //     height: 220,
                                  )),
                                ],
                              )
                            ],
                          ))),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                          height: 320,

                          //alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            color: HexColor("#00BFA6"),
                          ),
                          padding: EdgeInsets.only(left: 2, right: 2, top: 10),
                          child: ListView(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    left: 60.0, right: 60.0, top: 2.0),
                                child: Container(
                                  width: 200,
                                  child: Center(
                                      child: Text(
                                    "التواصل",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: HexColor("#00BFA6"),
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal,

                                      //    fontFamily: 'Montserrat'
                                    ),
                                  )),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),

                              // padding: EdgeInsets.only(
                              //   left: 15.0, right: 15.0, top: 2.0),

                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                      child: Container(
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Container(
                                          // margin: EdgeInsets.only(left: 15),

                                          //alignment: Alignment.centerRight,

                                          child: Text(
                                            "العنوان :-\n"
                                            "▫بلطيم ، شارع التحرير ، برج عبد الباقي، مقابل صيدلية الدكتور محمد وفرن الصعيدي\n"
                                            "\n"
                                            "▫ت/ : 2511711\n"
                                            "▫موبيل : 01005205633\n"
                                            "او\n"
                                            "▫ تطبيق الهاتف",
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal,
                                              //    fontFamily: 'Montserrat'
                                            ),
                                          ),
                                        )),
                                    //     height: 220,
                                  )),
                                ],
                              )
                            ],
                          ))),
                  SizedBox(height: 10.0),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                          height: 510,

                          //alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.only(left: 2, right: 2, top: 30),
                          child: ListView(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    left: 60.0, right: 60.0, top: 0.0),
                                /*child: Container(
                                  width: 200,
                                  child: Center(
                                      child: Text(
                                        "التواصل",
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          color: Colors.purpleAccent,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,

                                          //    fontFamily: 'Montserrat'
                                        ),
                                      )),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                    color: Colors.white,
                                  ),
                                ),*/
                              ),
                              SizedBox(
                                height: 2,
                              ),

                              // padding: EdgeInsets.only(
                              //   left: 15.0, right: 15.0, top: 2.0),

                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                      child: Container(
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Container(
                                          // margin: EdgeInsets.only(left: 15),

                                          //alignment: Alignment.centerRight,

                                          child: StreamBuilder(
                                            stream: Firestore.instance
                                                .collection('operationsPhotos')
                                                .snapshots(),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<QuerySnapshot>
                                                    snapshot) {
                                              if (!snapshot.hasData)
                                                return Text('Loading');
                                              switch (
                                                  snapshot.connectionState) {
                                                case ConnectionState.waiting:
                                                  return new Text('Loading...');
                                                default:
                                                  return new ListView(
                                                    children: snapshot
                                                        .data.documents
                                                        .map((DocumentSnapshot
                                                            document) {
                                                      document.data.values
                                                          .forEach((result) {
                                                        print(result + " : 4");
                                                        list.add(
                                                            result.toString());
                                                      });

                                                      return new Container(
                                                        constraints:
                                                            BoxConstraints
                                                                .expand(
                                                                    height:
                                                                        200),
                                                        child: Container(
                                                          //   width: 200,
                                                          child: Swiper(
                                                            autoplay: false,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              //list.add(document.data.values.toString());
                                                              //print("Sdsd : " + list.length.toString());
                                                              return new Image
                                                                  .network(
                                                                list[index],
                                                                fit:
                                                                    BoxFit.fill,
                                                              );
                                                            },
                                                            itemCount: 12,
                                                            viewportFraction:
                                                                0.6,
                                                            scale: 0.2,
                                                          ),
                                                          // height: 50,
                                                        ),
                                                      );
                                                    }).toList(),
                                                  );
                                              }
                                            },
                                          ),
                                        )),
                                    height: 300,
                                  )),
                                ],
                              )
                            ],
                          ))),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )),
            ],
          )
        ]));
  }
}

// ignore: camel_case_types
class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 3);
    path.lineTo(size.width + 50, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // ignore: todo
    // TODO: implement shouldReclip
    return true;
  }
}
