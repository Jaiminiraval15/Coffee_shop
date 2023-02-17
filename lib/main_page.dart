import 'package:coffee_shop/mainscreen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          padding: EdgeInsets.only(top: 550, bottom: 80),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: (AssetImage("images/frape.jpg")),
                fit: BoxFit.cover,
                opacity:0.9),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 100, 20, 30),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => MainScreen(),));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text("Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 1,

                        )),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
