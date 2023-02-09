import 'package:coffee_shop/detailedScreen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {

  List img = [
    "Latte",
    "Mocha",
    "French Press",
    "Frappe",
    "Espresso",
    "Cappuccino"
  ];
  List imgInfo = [
    "Espresso Steamed milk",
    "Chocolaty warm",
    "Try coffees from Mexico",
    "Greek iced coffee",
    "Thicker intense coffee",
    "Espresso-based coffee"
  ];
  List imgPrice = ["\$10", "\$15", "\$30", "\$20", "\$25", "\$30"];
  List imgDesp =[
    " A latte or caffè latte is a milk coffee that boasts a silky layer of foam as a real highlight to the drink. A true latte will be made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top. ",
    "A caffé mocha is basically a chocolate-flavored variant of a caffé latte so it’s also based on espresso and hot milk. The difference is that a mocha contains chocolate flavoring and sweetener.",
    "French press coffee requires uniform, coarsely ground beans, about the size of breadcrumbs. Smaller sized grains (like those that often come pre-ground) will get through the filter and create sediment in your coffee.",
    "A frappe is an iced beverage that has been shaken, blended or beaten to produce a tasty, foamy, and refreshing drink. It is served cold, often with whipped cream and toppings.",
    "Espresso features bold and concentrated coffee flavors and a velvety texture that are achieved through brewing under high pressure, typically 9 bars.",
    "A well-made cappuccino has incredible flavor and texture. It has a bold coffee taste and some sweetness from the naturally occurring lactose sugar in milk. ",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          Icon(Icons.search_rounded),
        ],
        leading: Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset("images/coffeshop.jpg")),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("images/bg.jpg"),
            GridView.count(
              crossAxisCount: 2,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: (160 / 195),
              children: [
                for (int i = 0; i <= 5; i++)
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.brown.shade300,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 6,
                              spreadRadius: 1,
                              color: Colors.black12)
                        ]),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailedScreen(img[i],imgPrice[i],imgDesp[i]),));
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Image.asset("images/${img[i]}.jpg"),
                            height: 125,
                            width: 125,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    img[i],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 1),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    imgInfo[i],
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.brown,
    );
  }
}
