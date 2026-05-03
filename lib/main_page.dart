import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/pages/login.dart';
import 'package:hotel_booking/pages/bottom_nav_bar.dart';
import 'package:hotel_booking/hotel_owner/owner_home.dart';
import 'package:hotel_booking/services/database.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {

        // ⏳ Wait — Firebase is restoring saved session
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // ❌ No user — go to login
        if (!snapshot.hasData || snapshot.data == null) {
          return const Login();
        }

        // ✅ User exists — now fetch role
        return FutureBuilder(
          future: DatabaseMethods().getUserById(snapshot.data!.uid),
          builder: (context, AsyncSnapshot userSnapshot) {

            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            if (!userSnapshot.hasData || userSnapshot.data == null) {
              // Force logout if user data missing
              FirebaseAuth.instance.signOut();
              return const Login();
            }

            var userData = userSnapshot.data;

            if (userData["role"] == "admin") {
              return OwnerHome();
            } else {
              return BottomNavBar();
            }
          },
        );
      },
    );
  }
}