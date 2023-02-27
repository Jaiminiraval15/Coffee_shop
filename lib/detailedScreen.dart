import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:convert';


class DetailedScreen extends StatefulWidget {
  @override

  String img;
  String imgDesp;
  int imgPrice;
   DetailedScreen(this.img, this.imgPrice, this.imgDesp);
  //final MyModel myModel;

 // const DetailedScreen({Key? key, required this.myModel}) : super(key: key);

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  int counter = 1;

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
                    color: Colors.black,
                    size: 28,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Image.asset("images/${widget.img}.jpg",
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
                      widget.img,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lobster-Regular',
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
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (counter > 1) {
                                        counter--;
                                      } else {
                                        counter = 1;
                                      }
                                    });
                                  },
                                  child: Icon(
                                    CupertinoIcons.minus,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "$counter",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                  color: Colors.white),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      counter++;
                                    });
                                  },
                                  child: Icon(
                                    CupertinoIcons.add,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "\$${widget.imgPrice * counter}",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      widget.imgDesp,
                      style: TextStyle(fontSize: 16, color: Colors.white,fontStyle: FontStyle.italic,),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(padding: EdgeInsets.only(top: 50)),
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
      bottomSheet: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.brown.shade300,
        ),
        child: Center(
          child: InkWell(
            onTap: (){},
            child: Text("Order Now",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,

                )),
          ),
        ),
      ),

      backgroundColor: Colors.brown,
    );
  }
}
