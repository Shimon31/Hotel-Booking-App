import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared_preference.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    name = prefs.getString("USERNAMEKEY") ?? "User";
    email = prefs.getString("USEREMAILKEY") ?? "email@gmail.com";

    setState(() {});
  }


  void logout() async {
    await FirebaseAuth.instance.signOut();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [

          _buildHeader(),

          const SizedBox(height: 10),

          Expanded(
            child: ListView(
              children: [
                _buildOption(Icons.person, "Edit Profile"),
                _buildOption(Icons.lock, "Change Password"),
                _buildOption(Icons.history, "Booking History"),
                _buildOption(Icons.account_balance_wallet, "My Wallet"),
                _buildOption(Icons.settings, "Settings"),
                _buildOption(Icons.help, "Help & Support"),

                _buildOption(Icons.logout, "Logout",
                    isLogout: true,
                    onTap: logout),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF6A11CB),
            Color(0xFF2575FC),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [

          const CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 40, color: Colors.grey),
          ),

          const SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                email,
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildOption(IconData icon, String title,
      {bool isLogout = false, VoidCallback? onTap}) {

    final color = isLogout ? Colors.red : Colors.black;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(
          title,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}