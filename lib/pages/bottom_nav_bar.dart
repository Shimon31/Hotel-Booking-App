import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/pages/booking.dart';
import 'package:hotel_booking/pages/home.dart';
import 'package:hotel_booking/pages/profile.dart';
import 'package:hotel_booking/pages/wallet.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late final List<Widget> pages;

  late Home homePage;
  late Booking booking;
  late Profile profile;
  late Wallet wallet;

  int currentTabIndex = 0;

  @override
  void initState() {
    homePage = Home();
    booking = Booking();
    profile = Profile();
    wallet = Wallet();

    pages = [homePage, booking, wallet, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 400),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },

        items: [
          Icon(Icons.home,color: Colors.white,size: 30,),
          Icon(Icons.shopping_bag,color: Colors.white,size: 30,),
          Icon(Icons.wallet,color: Colors.white,size: 30,),
          Icon(Icons.person,color: Colors.white,size: 30,),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
