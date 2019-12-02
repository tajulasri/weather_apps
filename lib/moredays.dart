import 'package:flutter/material.dart';
import 'package:news_app/models/wheather.dart';

class MoreDays extends StatelessWidget {
  //const MoreDays({Key key}) : super(key: key);

  List wheatherData = [
    Wheather("Sunday", "sunny", "17 \u00b0"),
    Wheather("Monday", "sunny", "18 \u00b0"),
    Wheather("Tuesday", "sunny", "20 \u00b0"),
    Wheather("Wednesday", "Rain", "22 \u00b0"),
    Wheather("Thursday", "Cloudy", "18 \u00b0"),
    Wheather("Friday", "Cloudy", "18 \u00b0"),
    Wheather("Saturday", "Cloudy", "18 \u00b0"),
  ];

  _populateListItem() {
    List<Widget> listItemWidgets = [];
    this.wheatherData.forEach((item) {
      listItemWidgets.add(Container(
        height: 80,
        padding: EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              item.time,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17.0,
                  color: Colors.black),
            ),
            Icon(Icons.wb_sunny, color: Colors.blue),
            Text(
              item.temperature,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey),
            ),
          ],
        ),
      ));
    });

    return listItemWidgets.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        return Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        child: Icon(Icons.arrow_back,
                            color: Colors.black45, size: 40.0),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      //color: Colors.green,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                      child: Text(
                        "Next 7 Days",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 32.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: _populateListItem(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
