import 'package:coffee_shop/detailedScreen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("images/bg.jpg"),
            Container(
                child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 15, 20),
                child: Text(
                  "Brewing Coffee",
                  style: TextStyle(
                      fontSize: 22, letterSpacing: 1, color: Colors.white),
                ),
              ),
            )),
                SizedBox(
                  height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: img1.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width/2.3,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailedScreen(
                                      img1[index], imgPrice1[index], imgDesp1[index]),
                                ));
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Image.asset("images/${img1[index]}.jpg"),
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
                              img1[index],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Lobster-Regular',
                              ),
                            ),
                            Text(
                              "\$${imgPrice1[index]}",
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
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    imgInfo1[index],
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                     // overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
              height: 220,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: img1.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        child: Container(
                            width: MediaQuery.of(context).size.width/2.3,
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailedScreen(
                                            img2[index], imgPrice2[index], imgDesp2[index]),
                                      ));
                                },
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Image.asset("images/${img2[index]}.jpg"),
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
                                        img2[index],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontFamily: 'Lobster-Regular',
                                        ),
                                      ),
                                      Text(
                                        "\$${imgPrice2[index]}",
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
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          imgInfo2[index],
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                            //overflow: TextOverflow.fade,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ]
                            )));
                  }
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.brown,
    );
  }
}
