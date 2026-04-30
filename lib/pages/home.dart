import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/pages/detail_pages.dart';
import 'package:hotel_booking/services/database.dart';
import 'package:hotel_booking/services/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream? hotelStream;

  getontheload() async {
    hotelStream = await DatabaseMethods().getAllHotels();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getontheload();
  }

  Widget allHotels() {
    return StreamBuilder(
      stream: hotelStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    DetailPages(name: ds["Hotel Name"],
                        price: ds["Hotel Charges"],
                        offer: ds["Hotel Name"],
                        wifi: ds["WiFi"],
                        hdtv: ds["HDTV"],
                        kitchen: ds["Kitchen"],
                        bathroom: ds["Bathroom"],
                        description: ds["Hotel Description"])));
              },
              child: Container(
                margin: EdgeInsets.only(left: 20, bottom: 5),
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(30),
                          child: Image.asset(
                            "images/hotel1.jpg",
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 1.2,
                            fit: BoxFit.cover,
                            height: 240,
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                ds["Hotel Name"],
                                style: AppWidget.headerTextStyle(20),
                              ),
                              SizedBox(
                                width:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .width / 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  ds["Hotel Charges"],
                                  style: AppWidget.headerTextStyle(25),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.blue,
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                ds["Hotel Address"],
                                style: AppWidget.normalTextStyle(16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        )
            : Container();
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 228, 228),
      body: SingleChildScrollView(
        child: Container(
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
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 280,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 60, left: 20),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
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
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          margin: EdgeInsets.only(right: 20),
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
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
              SizedBox(height: 20),
              Container(height: 350, child: allHotels()),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Discover New Places",
                  style: AppWidget.headerTextStyle(20),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 20, bottom: 5),
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10, right: 20),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  "images/thailand.jpg",
                                  height: 170,
                                  width: 170,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  "Thailand",
                                  style: AppWidget.headerTextStyle(20),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.home, color: Colors.blue),
                                    Text(
                                      "10 Hotels",
                                      style: AppWidget.normalTextStyle(18),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 10, right: 20),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  "images/maldives.jpg",
                                  height: 170,
                                  width: 170,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  "Maldives",
                                  style: AppWidget.headerTextStyle(20),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),

                                child: Row(
                                  children: [
                                    Icon(Icons.home, color: Colors.blue),
                                    Text(
                                      "8 Hotels",
                                      style: AppWidget.normalTextStyle(18),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 10, right: 20),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  "images/switzerland.jpg",
                                  height: 170,
                                  width: 170,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  "Switzerland",
                                  style: AppWidget.headerTextStyle(20),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),

                                child: Row(
                                  children: [
                                    Icon(Icons.home, color: Colors.blue),
                                    Text(
                                      "12 Hotels",
                                      style: AppWidget.normalTextStyle(18),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 10, right: 20),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  "images/bali.jpeg",
                                  height: 170,
                                  width: 170,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  "Bali",
                                  style: AppWidget.headerTextStyle(20),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),

                                child: Row(
                                  children: [
                                    Icon(Icons.home, color: Colors.blue),
                                    Text(
                                      "15 Hotels",
                                      style: AppWidget.normalTextStyle(18),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
