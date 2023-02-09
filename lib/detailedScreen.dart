import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class DetailedScreen extends StatelessWidget {
  @override
  String img;
  String imgPrice;
  String imgDesp;

  DetailedScreen(this.img, this.imgPrice, this.imgDesp);

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Image.asset("images/$img.jpg",
                    width: MediaQuery.of(context).size.width / 1.2),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      img,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                    SizedBox(height: 25),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.3)),
                                borderRadius: BorderRadius.circular(20)),
                            width: 115,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.minus,
                                  size: 16,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "1",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  CupertinoIcons.add,
                                  size: 16,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            imgPrice,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      imgDesp,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(padding: EdgeInsets.only(top: 60)),
                    Row(
                      children: [
                        Text(
                          "Volume: ",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "32oz",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),

      backgroundColor: Colors.brown,
    );
  }
}
