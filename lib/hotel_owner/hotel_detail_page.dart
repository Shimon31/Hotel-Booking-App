import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/hotel_owner/owner_home.dart';
import 'package:hotel_booking/services/database.dart';
import 'package:hotel_booking/services/widget_support.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class HotelDetailPage extends StatefulWidget {
  const HotelDetailPage({super.key});

  @override
  State<HotelDetailPage> createState() => _HotelDetailPageState();
}

class _HotelDetailPageState extends State<HotelDetailPage> {
  bool isChecked1 = false,
      isChecked2 = false,
      isChecked3 = false,
      isChecked4 = false;

  File? selectedImage;
  final ImagePicker _picker = ImagePicker();

  TextEditingController hotelNameController = TextEditingController();
  TextEditingController hotelChargeController = TextEditingController();
  TextEditingController hotelAddressController = TextEditingController();
  TextEditingController hotelDescriptionController = TextEditingController();

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        margin: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hotel Details", style: AppWidget.boldTextStyle(22)),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      selectedImage != null
                          ? Center(
                              child: Container(
                                height: 200,
                                width: 200,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.file(
                                    selectedImage!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                getImage();
                              },
                              child: Center(
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(width: 2),
                                  ),
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.blueAccent,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(height: 10),
                      Text("Hotel Name", style: AppWidget.normalTextStyle(20)),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black12,
                        ),
                        child: TextField(
                          controller: hotelNameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Hotel Name",
                          ),
                        ),
                      ),

                      SizedBox(height: 10),
                      Text(
                        "Hotel Room Charges",
                        style: AppWidget.normalTextStyle(20),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black12,
                        ),
                        child: TextField(
                          controller: hotelChargeController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Hotel Room Charges",
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Hotel Address",
                        style: AppWidget.normalTextStyle(20),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black12,
                        ),
                        child: TextField(
                          controller: hotelAddressController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Hotel Address",
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "What Service you want to offer?",
                        style: AppWidget.normalTextStyle(20),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked1,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked1 = value!;
                              });
                            },
                          ),
                          Icon(Icons.wifi, color: Colors.blueAccent, size: 30),
                          SizedBox(width: 10),
                          Text("WiFi", style: AppWidget.normalTextStyle(20)),
                        ],
                      ),

                      Row(
                        children: [
                          Checkbox(
                            value: isChecked2,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked2 = value!;
                              });
                            },
                          ),
                          Icon(Icons.tv, color: Colors.blueAccent, size: 30),
                          SizedBox(width: 10),
                          Text("HDTV", style: AppWidget.normalTextStyle(20)),
                        ],
                      ),

                      Row(
                        children: [
                          Checkbox(
                            value: isChecked3,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked3 = value!;
                              });
                            },
                          ),
                          Icon(
                            Icons.kitchen,
                            color: Colors.blueAccent,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text("Kitchen", style: AppWidget.normalTextStyle(20)),
                        ],
                      ),

                      Row(
                        children: [
                          Checkbox(
                            value: isChecked4,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked4 = value!;
                              });
                            },
                          ),
                          Icon(
                            Icons.bathroom,
                            color: Colors.blueAccent,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Bathroom",
                            style: AppWidget.normalTextStyle(20),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      Text(
                        "Hotel Description",
                        style: AppWidget.normalTextStyle(20),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black12,
                        ),
                        child: TextField(
                          controller: hotelDescriptionController,
                          maxLines: 6,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter About Hotel",
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () async {
                          if (selectedImage == null ||
                              hotelNameController.text.isEmpty ||
                              hotelChargeController.text.isEmpty ||
                              hotelAddressController.text.isEmpty ||
                              hotelDescriptionController.text.isEmpty) {

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  "Please fill all fields and select an image",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            );

                            return;
                          }

                          String addId = randomAlphaNumeric(10);

                          Map<String, dynamic> addHotel = {
                            "image": "",
                            "Hotel Name": hotelNameController.text,
                            "Hotel Charges": hotelChargeController.text,
                            "Hotel Address": hotelAddressController.text,
                            "Hotel Description": hotelDescriptionController.text,
                            "WiFi": isChecked1 ? "true" : "false",
                            "HDTV": isChecked2 ? "true" : "false",
                            "Kitchen": isChecked3 ? "true" : "false",
                            "Bathroom": isChecked4 ? "true" : "false",
                            "id": addId,
                          };

                          await DatabaseMethods().addHotelInfo(addHotel, addId);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              content: Text("Hotel Uploaded Successfully"),
                            ),
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OwnerHome()),
                          );
                        },
                        child: Center(
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Submit",
                                style: AppWidget.whiteTextStyle(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
