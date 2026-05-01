import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hotel_booking/services/widget_support.dart';
import 'package:intl/intl.dart';

class DetailPages extends StatefulWidget {
  String name, price, offer, wifi, hdtv, kitchen, bathroom, description;

  DetailPages({
    super.key,
    required this.name,
    required this.price,
    required this.offer,
    required this.wifi,
    required this.hdtv,
    required this.kitchen,
    required this.bathroom,
    required this.description,
  });

  @override
  State<DetailPages> createState() => _DetailPagesState();
}

class _DetailPagesState extends State<DetailPages> {
  TextEditingController guestController = TextEditingController();
  var finalAmount;
  DateTime? startDate;
  DateTime? endDate;
  int? daysDifference = 1;

  @override
  void initState() {
    super.initState();
    finalAmount = int.parse(widget.price);
  }

  Future<void> _selectStartDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate ?? (startDate ?? DateTime.now()).add(Duration()),
      firstDate: startDate ?? DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        endDate = picked;
        _calculateDifference();
      });
    }
  }

  void _calculateDifference() {
    if (startDate != null && endDate != null) {
      daysDifference = endDate!.difference(startDate!).inDays;

      int price = int.parse(widget.price);

      finalAmount = price * daysDifference!;
    }
  }

  String _formatDate(DateTime? date) {
    return date != null
        ? DateFormat("dd, MMM yyyy").format(date)
        : "Selected Date";
  }

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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 2.5,
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
                    Text(widget.name, style: AppWidget.headerTextStyle(22)),
                    SizedBox(height: 10),
                    Text("BDT " + widget.price,
                        style: AppWidget.normalTextStyle(22)),
                    Divider(thickness: 2),
                    SizedBox(height: 10),
                    Text(
                      "What This Place Offer",
                      style: AppWidget.headerTextStyle(22),
                    ),
                    Row(
                      children: [
                        Icon(Icons.wifi, color: Colors.blueAccent),
                        SizedBox(width: 10),
                        widget.wifi == "true"
                            ? Text("WiFI", style: AppWidget.normalTextStyle(22))
                            : Container(),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.tv, color: Colors.blueAccent),
                        SizedBox(width: 10),
                        widget.hdtv == "true"
                            ? Text("HDTV", style: AppWidget.normalTextStyle(22))
                            : Container(),
                      ],
                    ),
                    SizedBox(height: 5),
                    widget.kitchen == "true"
                        ? Row(
                      children: [
                        Icon(Icons.kitchen, color: Colors.blueAccent),
                        Text(
                          "Kitchen",
                          style: AppWidget.normalTextStyle(22),
                        ),
                      ],
                    )
                        : Container(),
                    SizedBox(height: 5),
                    widget.bathroom == "true"
                        ? Row(
                      children: [
                        Icon(Icons.bathroom, color: Colors.blueAccent),
                        Text(
                          "Bathroom",
                          style: AppWidget.normalTextStyle(22),
                        ),
                      ],
                    )
                        : Container(),
                    Divider(thickness: 2),
                    SizedBox(height: 10),
                    Text(
                      "About this place ",
                      style: AppWidget.headerTextStyle(22),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.description,
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
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "BDT " + finalAmount.toString() + " for" +
                                  daysDifference.toString() + " Nights",
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
                                  child: GestureDetector(
                                    onTap: () {
                                      _selectStartDate(context);
                                    },
                                    child: Icon(
                                      Icons.calendar_month,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '${_formatDate(startDate)}',
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
                                  child: GestureDetector(
                                    onTap: () {
                                      _selectEndDate(context);
                                    },
                                    child: Icon(
                                      Icons.calendar_month,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '${_formatDate(endDate)}',
                                  style: AppWidget.normalTextStyle(16),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Number of guests",
                              style: AppWidget.normalTextStyle(16),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFececf8),
                              ),
                              child: TextField(
                                onChanged: (value) {
                                  finalAmount = finalAmount * int.parse(value);
                                  setState(() {

                                  });
                                },
                                controller: guestController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "1",
                                  hintStyle: AppWidget.headerTextStyle(20),
                                ),
                              ),
                            ),

                            SizedBox(height: 20),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Book Now",
                                    style: AppWidget.whiteTextStyle(20),
                                  ),
                                ],
                              ),
                            ),
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

  // Future<void> makePayment(String amount) async {
  //   try {
  //     paymentIntent = await createPaymentIntent(amount, 'AED');
  //     await Stripe.instance
  //         .initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
  //         paymentIntentClientSecret: paymentIntent?['client_secret_key'],
  //         style: ThemeMode.dark,
  //         merchantDisplayName: 'Shimon'))
  //         .then((value) {});
  //     displayPaymentSheet(amount);
  //   }catch(e,s){
  //
  //   }
  // }

}
