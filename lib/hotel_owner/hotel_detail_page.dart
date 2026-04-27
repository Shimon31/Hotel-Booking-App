import 'package:flutter/material.dart';
import 'package:hotel_booking/services/widget_support.dart';

class HotelDetailPage extends StatefulWidget {
  const HotelDetailPage({super.key});

  @override
  State<HotelDetailPage> createState() => _HotelDetailPageState();
}

class _HotelDetailPageState extends State<HotelDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
        body: Container(
          margin: EdgeInsets.only(top: 40,left: 40),
         child: Text("Hotel Details",style:AppWidget.whiteTextStyle(22),),

        ),
    );

  }
}
