import 'package:flutter/material.dart';
import 'package:hotel_booking/services/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.asset(
                    "images/home.jpg",
                    width: MediaQuery.of(context).size.width,
                    height: 280,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 60, left: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 280,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            "Dhaka,Bangladesh",
                            style: AppWidget.whiteTextStyle(20),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Hey, Shimon! Tell Us where you want to go",
                        style: AppWidget.whiteTextStyle(25),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(right: 20),
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search, color: Colors.white),
                            hintText: "Search here...",
                            hintStyle: AppWidget.whiteTextStyle(18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsetsGeometry.only(left: 20),
              child: Text(
                "The Most Relevant",
                style: AppWidget.headerTextStyle(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
