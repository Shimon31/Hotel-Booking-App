import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/hotel_owner/hotel_detail_page.dart';
import 'package:hotel_booking/pages/bottom_nav_bar.dart';
import 'package:hotel_booking/pages/detail_pages.dart';
import 'package:hotel_booking/pages/home.dart';
import 'package:hotel_booking/pages/login.dart';
import 'package:hotel_booking/pages/signup.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HotelDetailPage(),
    );
  }
}
