import 'dart:convert';
import 'dart:js_util';

import 'package:coffee_shop/addItem.dart';
import 'package:coffee_shop/detailedScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List img1 = [
    "French Press",
    "Mocha",
    "Latte",
  ];

  List img2=[
  "Cappuccino",
    "Espresso",
    "Frappe",
  ];

  List imgInfo1 = [
  "Try coffees from Mexico",
    "Chocolaty warm",
    "Espresso Steamed milk"
    ];

  List imgInfo2 =[
    "Espresso-based coffee",
    "Thicker intense coffee",
    "Greek iced coffee"
  ];

  List imgPrice1 = [10, 15, 30];

  List imgPrice2=[20, 25, 30];

  List imgDesp1 = [
    "French press coffee requires uniform, coarsely ground beans, about the size of breadcrumbs. Smaller sized grains will get through the filter and create sediment in your coffee.",
    "A caffé mocha is basically a chocolate-flavored variant of a caffé latte so it’s also based on espresso and hot milk. The difference is that a mocha contains chocolate flavoring and sweetener.",
    "A latte or caffè latte is a milk coffee that boasts a silky layer of foam as a real highlight to the drink. A true latte will be made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top. ",];

  List imgDesp2 =[
    "A well-made cappuccino has incredible flavor and texture. It has a bold coffee taste and some sweetness from the naturally occurring lactose sugar in milk. ",
    "Espresso features bold and concentrated coffee flavors and a velvety texture that are achieved through brewing under high pressure, typically 9 bars.",
    "A frappe is an iced beverage that has been shaken, blended or beaten to produce a tasty, foamy, and refreshing drink. It is served cold, often with whipped cream and toppings.",
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          Icon(Icons.search_rounded, size: 28),
        ],
        leading: Padding(
          padding: EdgeInsets.all(10),
          child: Icon(
            Icons.person,
            size: 28,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder<http.Response>(
        builder: (context, snapshot) {
          if(snapshot != null && snapshot.hasData ){
          return SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("images/bg.jpg"),
                Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 15, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Brewing Coffee",
                              style: TextStyle(
                                  fontSize: 22, letterSpacing: 1, color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(child: Icon(Icons.add),
                                  onTap: () {
                                   Navigator.push(context,MaterialPageRoute(builder: (context) {
                                     return AddItem(null);
                                   }
                                   ,)).then((value){
                                     if (value==true){
                                       setState(() {

                                       });
                                     }
                                   });
                                  },
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),

                    )),
                SizedBox(
                  height: 230,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: jsonDecode(snapshot.data!.body.toString()).length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            child: Container(
                                width: MediaQuery.of(context).size.width/1.7,
                                margin: EdgeInsets.only(left:15,right: 5,top: 5,bottom: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.brown.shade300,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 6,
                                          spreadRadius: 1,
                                          color: Colors.black12)
                                    ]),
                                child: Column(children: [
                                  InkWell(
                                    onTap: () {
                                      {
                                        Navigator.push(context,MaterialPageRoute(builder: (context) {
                                          return AddItem(jsonDecode(snapshot.data!.body.toString())[index]);
                                        }
                                          ,)).then((value){
                                          if (value==true){
                                            setState(() {
                                            });
                                          }});}
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: Image.network(jsonDecode(snapshot.data!.body.toString())[index]['avatar'].toString()),

                                      height: 125,
                                      width: 125,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 8,left: 6,right: 6),
                                    child: Expanded(
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                           jsonDecode(snapshot.data!.body.toString())[index]['CoffeeName'].toString(),
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontFamily: 'Lobster-Regular',
                                              ),
                                            ),
                                            Text(
                                              jsonDecode(snapshot.data!.body.toString())[index]['CoffeePrice'].toString(),
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 1),
                                    child:  Expanded(
                                      child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              jsonDecode(snapshot.data!.body.toString())[index]['CoffeeTag'].toString() ,
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.white,
                                                 overflow: TextOverflow.fade,
                                              ),
                                            ),
                                           InkWell(child: Icon(Icons.delete_rounded,color: Colors.red),
                                           onTap: () =>{
                                             showAlert(jsonDecode(snapshot.data!.body.toString())[index]['id'].toString())
                                           } ),
                                          ],
                                        ),

                                    ),
                                  ),
                                ]
                                )));
                      }
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 15, 20),
                      child: Text("Espresso",style: TextStyle(
                          fontSize: 22, letterSpacing: 1, color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 230,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: jsonDecode(snapshot.data!.body.toString()).length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            child: Container(
                                width: MediaQuery.of(context).size.width/1.7,
                                margin: EdgeInsets.only(left:15,right: 5,top: 5,bottom: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.brown.shade300,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 6,
                                          spreadRadius: 1,
                                          color: Colors.black12)
                                    ]),
                                child: Column(children: [
                                  InkWell(
                                    onTap: ()
                                                          {
                                      Navigator.push(context,MaterialPageRoute(builder: (context) {
                                        return AddItem(jsonDecode(snapshot.data!.body.toString())[index]);
                                              }
                                        ,)).then((value){
                                                  if (value==true){
                                                        setState(() {
                                                     });
                                                 }});
                                                           },
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: Image.network(jsonDecode(snapshot.data!.body.toString())[index]['avatar'].toString()),
                                      height: 125,
                                      width: 125,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 8,left: 6,right: 6),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            jsonDecode(snapshot.data!.body.toString())[index]['CoffeeName'].toString(),
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontFamily: 'Lobster-Regular',
                                              //overflow: TextOverflow.fade,
                                            ),
                                          ),
                                          Text(
                                            jsonDecode(snapshot.data!.body.toString())[index]['CoffeePrice'].toString(),
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 1),
                                    child: Expanded(
                                      child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              jsonDecode(snapshot.data!.body.toString())[index]['CoffeeTag'].toString() ,
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.white,
                                                //overflow: TextOverflow.fade,
                                              ),
                                            ),
                                            InkWell(child: Icon(Icons.delete_rounded,color: Colors.red,),
                                              onTap: () => showAlert(showAlert(jsonDecode(snapshot.data!.body.toString())[index]['id'].toString())),
                                            )
                                          ],
                                        ),

                                    ),
                                  ),
                                ]
                                )));
                      }
                  ),
                ),
              ],
            ),
          );
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
        },
        future: getData(),

      ),
      backgroundColor: Colors.brown,
    );
  }
  Future<http.Response> getData() async {
    var res = await http.get(Uri.parse("https://630c5ca683986f74a7be897b.mockapi.io/coffee"));
     //print("DATA:: ${res.body.toString()}");

    return res;

  }
  Future<http.Response> deleteData(id) async {
    var res = await http.delete(Uri.parse("https://630c5ca683986f74a7be897b.mockapi.io/coffee/$id"));
    //print("DATA:: ${res.body.toString()}");

    return res;

  }
  showAlert(id){
    return showDialog(context: context, builder: (context) {
      return AlertDialog(title: Text('Alert'),content: Text("Are you sure you want to delete?"),
        actions: [
          TextButton(onPressed: () async {
            http.Response response=  await deleteData(id);
            if(response.statusCode==200){
              setState(() {

              });
            }
            Navigator.of(context).pop();

          },
          child: Text('Yes')),
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('No'))],);
    },);

  }
}
