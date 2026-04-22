import 'package:flutter/material.dart';
import 'package:hotel_booking/services/widget_support.dart';

class DetailPages extends StatefulWidget {
  const DetailPages({super.key});

  @override
  State<DetailPages> createState() => _DetailPagesState();
}

class _DetailPagesState extends State<DetailPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      child: Image.asset("images/bali.jpeg", fit: BoxFit.cover),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },

                    child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(top: 50, left: 20),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Near Beach", style: AppWidget.headerTextStyle(22)),
                    SizedBox(height: 10),
                    Text("\$20", style: AppWidget.normalTextStyle(22)),
                    Divider(thickness: 2),
                    SizedBox(height: 10),
                    Text(
                      "What this place offer",
                      style: AppWidget.headerTextStyle(22),
                    ),
                    Row(
                      children: [
                        Icon(Icons.wifi, color: Colors.blueAccent),
                        SizedBox(width: 10),
                        Text("WiFI", style: AppWidget.normalTextStyle(22)),
                        SizedBox(width: 40),
                        Icon(Icons.tv, color: Colors.blueAccent),
                        SizedBox(width: 10),
                        Text("HDTV", style: AppWidget.normalTextStyle(22)),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.kitchen, color: Colors.blueAccent),
                        SizedBox(width: 10),
                        Text("Kitchen", style: AppWidget.normalTextStyle(22)),
                        SizedBox(width: 40),
                        Icon(Icons.bathroom, color: Colors.blueAccent),
                        SizedBox(width: 10),
                        Text("Bathroom", style: AppWidget.normalTextStyle(22)),
                      ],
                    ),

                    Divider(thickness: 2),
                    SizedBox(height: 10),
                    Text(
                      "About this place ",
                      style: AppWidget.headerTextStyle(22),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Hotel Sea Crown – A beachfront hotel offering beautiful sea views and comfortable rooms.Perfect for tourists looking for a relaxing stay near the longest natural sea beach.",
                      style: AppWidget.normalTextStyle(16),
                    ),
                    SizedBox(height: 20),
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 3,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$80 for 4 Nights",
                              style: AppWidget.headerTextStyle(16),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Check-In Date",
                              style: AppWidget.normalTextStyle(16),
                            ),
                            Divider(thickness: 2),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blueAccent,
                                  ),
                                  child: Icon(
                                    Icons.calendar_month,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '23 April,2026',
                                  style: AppWidget.normalTextStyle(16),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Check-Out Date",
                              style: AppWidget.normalTextStyle(16),
                            ),
                            Divider(thickness: 2),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blueAccent,
                                  ),
                                  child: Icon(
                                    Icons.calendar_month,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '25 April,2026',
                                  style: AppWidget.normalTextStyle(16),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text(
                              "Number of guests",
                              style: AppWidget.normalTextStyle(16),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFececf8),
                              ),
                              child: TextField(
                                decoration: InputDecoration(border: InputBorder.none,hintText: "1",hintStyle: AppWidget.normalTextStyle(20)),
                              ),
                            ),

                            SizedBox(height: 20,),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue),
                              child: Column(
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  Text("Book Now",style: AppWidget.whiteTextStyle(20),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
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
