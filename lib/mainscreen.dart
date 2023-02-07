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
  List imgPrice =[
    "\$10",
    "\$15",
    "\$30",
    "\$20",
    "\$25",
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
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Image.asset("images/${img[i]}.jpg"),
                            height: 125,
                            width: 125,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(img[i],
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 1),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
