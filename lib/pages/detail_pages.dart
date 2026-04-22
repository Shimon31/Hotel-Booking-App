import 'package:flutter/material.dart';

class DetailPages extends StatefulWidget {
  const DetailPages({super.key});

  @override
  State<DetailPages> createState() => _DetailPagesState();
}



class _DetailPagesState extends State<DetailPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.asset("images/bali.jpeg", fit: BoxFit.cover),
                  ),
                ),
                GestureDetector(onTap: (){
                  Navigator.pop(context);
                },

                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(top: 50, left: 20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Icon(Icons.arrow_back, color: Colors.white, size: 30),
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
