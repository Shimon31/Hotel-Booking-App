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
              Container(
                height: 350,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
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
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  "images/hotel1.jpg",
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  fit: BoxFit.cover, // optional but recommended
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      "Hotel Beach",
                                      style: AppWidget.headerTextStyle(20),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                    ),
                                    Text(
                                      "\$20",
                                      style: AppWidget.headerTextStyle(25),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.blueAccent,
                                      size: 30,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Near Bashundhara,Dhaka",
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
                    Container(
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
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  "images/hotel2.jpg",
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  fit: BoxFit.cover, // optional but recommended
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      "Hotel Beach",
                                      style: AppWidget.headerTextStyle(20),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                    ),
                                    Text(
                                      "\$20",
                                      style: AppWidget.headerTextStyle(25),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.blueAccent,
                                      size: 30,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Near Gazipur,Dhaka",
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
                    Container(
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
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  "images/hotel3.jpg",
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  fit: BoxFit.cover, // optional but recommended
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      "Hotel Beach",
                                      style: AppWidget.headerTextStyle(20),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                    ),
                                    Text(
                                      "\$20",
                                      style: AppWidget.headerTextStyle(25),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.blueAccent,
                                      size: 30,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Near Saint Martin,Dhaka",
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
                  ],
                ),
              ),
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
                          margin: EdgeInsets.only(bottom: 10),
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

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
