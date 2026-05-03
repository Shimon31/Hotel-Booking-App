import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/hotel_owner/hotel_detail_page.dart';
import 'package:hotel_booking/pages/bottom_nav_bar.dart';
import 'package:hotel_booking/pages/login.dart';
import 'package:hotel_booking/services/database.dart';
import 'package:hotel_booking/services/widget_support.dart';
import 'package:hotel_booking/shared_preference.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String selectedRole = "user";

  String email = "",
      password = "",
      name = "";

  TextEditingController nameET = TextEditingController();
  TextEditingController emailET = TextEditingController();
  TextEditingController passET = TextEditingController();

  void registerUser() async {
    if (nameET.text.isEmpty || emailET.text.isEmpty || passET.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Please fill all fields",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.yellow,
        ),
      );
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailET.text,
        password: passET.text,
      );

      String id = userCredential.user!.uid;
      Map<String, dynamic> userInfoMap = {
        "Name": nameET.text,
        "Email": emailET.text,
        "Id": id,
        "role": selectedRole,
      };

      await DatabaseMethods().addUserInfo(userInfoMap, id);

      SharedPreferenceHelper helper = SharedPreferenceHelper();
      await helper.saveUserId(id);
      await helper.saveUserName(nameET.text);
      await helper.saveUserEmail(emailET.text);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Registered as $selectedRole,",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.green,
        ),
      );

      if (selectedRole == "admin") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HotelDetailPage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => BottomNavBar()),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Email already exists",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void adminRegistration() async {
    if (nameET.text != "" && emailET.text != "" && passET.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailET.text,
          password: passET.text,
        );

        String id = userCredential.user!.uid;

        Map<String, dynamic> adminMap = {
          "Name": nameET.text,
          "Email": emailET.text,
          "Id": id,
          "role": "admin",
        };

        await DatabaseMethods().addUserInfo(adminMap, id);
        SharedPreferenceHelper helper = SharedPreferenceHelper();
        await helper.saveUserId(id);
        await helper.saveUserName(nameET.text);
        await helper.saveUserEmail(emailET.text);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Admin Created Successfully",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HotelDetailPage()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                  "Account Already Exits",
                  style: TextStyle(color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold) ,
              ),
            ),
          );
        }
      }
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

            Center(
              child: Text("Sign Up", style: AppWidget.headerTextStyle(30)),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Name", style: AppWidget.normalTextStyle(20)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  child: Center(
                    child: TextField(
                      controller: nameET,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Name",
                        prefixIcon: Icon(Icons.person, color: Colors.blue),
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

                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: "user",
                          groupValue: selectedRole,
                          onChanged: (value) {
                            setState(() {
                              selectedRole = value.toString();
                            });
                          },
                        ),
                        Text("User"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "admin",
                          groupValue: selectedRole,
                          onChanged: (value) {
                            setState(() {
                              selectedRole = value.toString();
                            });
                          },
                        ),
                        Text("Admin"),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    if (nameET.text != "" &&
                        emailET.text != "" &&
                        passET.text != "") {
                      if (selectedRole == "admin") {
                        adminRegistration();
                      } else {
                        registerUser();
                      }
                    }
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
                      child: Text(
                        "Register",
                        style: AppWidget.whiteTextStyle(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have an Account?",
                      style: AppWidget.normalTextStyle(16),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text(
                        "Login",
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
