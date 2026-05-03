import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/hotel_owner/hotel_detail_page.dart';
import 'package:hotel_booking/pages/bottom_nav_bar.dart';
import 'package:hotel_booking/pages/signup.dart';

import '../services/database.dart';
import '../services/widget_support.dart';
import '../shared_preference.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "",
      password = "";

  TextEditingController nameET = TextEditingController();
  TextEditingController emailET = TextEditingController();
  TextEditingController passET = TextEditingController();

  void login() async {
    if (emailET.text.isEmpty || passET.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Enter email & password",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          backgroundColor: Colors.yellow,),
      );
      return;
    }

    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailET.text,
        password: passET.text,
      );

      String uid = userCredential.user!.uid;
      var userData = await DatabaseMethods().getUserById(uid);

      if (userData == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("User data not found",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),), backgroundColor: Colors.red,),
        );
        return;
      }


      SharedPreferenceHelper helper = SharedPreferenceHelper();
      await helper.saveUserId(uid);
      await helper.saveUserName(userData["Name"]); // must match Firestore field
      await helper.saveUserEmail(
          userData["Email"]); // must match Firestore field

      if (userData["role"] == "admin") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Login As Admin",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),), backgroundColor: Colors.green,));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HotelDetailPage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Login As User",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),), backgroundColor: Colors.green,));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => BottomNavBar()));
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Login failed"),
          backgroundColor: Colors.red,),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "images/signup.png",
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),

            Center(child: Text("Login", style: AppWidget.headerTextStyle(30))),

            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Email", style: AppWidget.normalTextStyle(20)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  child: Center(
                    child: TextField(
                      controller: emailET,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Email",
                        prefixIcon: Icon(Icons.email, color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Password", style: AppWidget.normalTextStyle(20)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  child: Center(
                    child: TextField(
                      obscureText: true,
                      controller: passET,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Password",
                        prefixIcon: Icon(Icons.key, color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: AppWidget.normalTextStyle(16),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25),

                GestureDetector(
                  onTap: () {
                    if (emailET.text != "" && passET.text != "") {
                      setState(() {
                        email = emailET.text;
                        password = passET.text;
                      });
                    }
                    login();
                  },
                  child: Center(
                    child: Container(
                      height: 50,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 2.5,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green,
                      ),
                      child: Text("Login", style: AppWidget.whiteTextStyle(20)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Have an Account?",
                      style: AppWidget.normalTextStyle(16),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
