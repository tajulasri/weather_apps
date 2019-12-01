import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/wheather.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryTextTheme: Typography(platform: TargetPlatform.iOS).white,
          textTheme: Typography(platform: TargetPlatform.iOS).white,
          primarySwatch: Colors.lightBlue,
          backgroundColor: Color.fromRGBO(80, 110, 209, 1.0)),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedDays = 0;
  List days = ["Today", "Tomorrow", "Next 7 Days", Icons.arrow_forward_ios];

  List wheatherData = [
    Wheather("9 AM", "sunny", "17 \u00b0"),
    Wheather("10 AM", "sunny", "18 \u00b0"),
    Wheather("11 AM", "sunny", "20 \u00b0"),
    Wheather("12 PM", "Rain", "22 \u00b0"),
    Wheather("01 PM", "Cloudy", "18 \u00b0"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.blue[800],
              Colors.blue[700],
              Colors.blue[600],
              Colors.blue[400],
            ],
          )),
          child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Terengganu,",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 28.0)),
                    SizedBox(height: 10),
                    Text("K. Terengganu",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 28.0)),
                    SizedBox(height: 15),
                    Text("Sun, 2 Dec",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 16.0)),
                  ],
                ),
                Container(
                  height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Today",
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.w500)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.wb_cloudy,
                              color: Colors.yellow, size: 70.0),
                          SizedBox(width: 15),
                          Text("21 \u00b0",
                              style: TextStyle(
                                  fontSize: 60.0, fontWeight: FontWeight.bold))
                        ],
                      ),
                      Text("Sunny", style: TextStyle(fontSize: 20))
                    ],
                  ),
                ),
                Container(
                  height: 25,
                  //color: Colors.white,
                  child: ListView.builder(
                    itemCount: days.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, position) {
                      return new GestureDetector(
                          onTap: () {
                            setState(() {
                              this.selectedDays = position;
                            });
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: position == 3
                                  ? Icon(days[position],
                                      color: this.selectedDays == position
                                          ? Colors.white
                                          : Colors.white54,
                                      size: 20.0)
                                  : Text(days[position],
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: position == selectedDays
                                              ? Colors.white
                                              : Colors.white54))));
                    },
                  ),
                ),
                Container(
                  height: 200,
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(left: 20),
                  //color: Colors.blue[400],
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue,
                          blurRadius: 25.0, // soften the shadow
                          spreadRadius: 5.0, //extend the shadow
                          offset: Offset(
                            25.0, // Move to right 10  horizontally
                            15.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: wheatherData.length,
                    itemBuilder: (BuildContext context, position) {
                      return Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 35, horizontal: 10),
                          child: Container(
                            width: 70,
                            //padding: EdgeInsets.only(top: 20.0),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(this.wheatherData[position].time),
                                SizedBox(height: 5),
                                //switch based on case of weather for icons rendering
                                Icon(Icons.wb_cloudy,
                                    color: Colors.white, size: 30),
                                SizedBox(height: 5),
                                Text(this.wheatherData[position].temperature),
                              ],
                            ),
                          ));
                    },
                  ),
                )
              ]))),
    );
  }
}
