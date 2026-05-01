import 'package:flutter/material.dart';
import 'package:hotel_booking/services/widget_support.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking", style: AppWidget.headerTextStyle(30)),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 40,),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 5,
                  child: Container(
                    width: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Image.asset(
                          "images/booking.jpeg",
                          height: 90,
                          width: 90,
                        ),
                        Text(
                          "Past\nBookings",
                          style: AppWidget.headerTextStyle(20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Image.asset(
                          "images/past_booking.png",
                          height: 90,
                          width: 90,
                        ),
                        Text(
                          "Past\nBookings",
                          style: AppWidget.headerTextStyle(20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
