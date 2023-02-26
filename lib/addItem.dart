import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class AddItem extends StatefulWidget{
  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  @override
  var formKey =GlobalKey<FormState>();

  var nameController = TextEditingController();

  var priceController = TextEditingController();

  var tagController = TextEditingController();

  Widget build(BuildContext context) {
      return Scaffold(
        body: Form(key: formKey,
            child: Column(
          children: [
            TextFormField(decoration: InputDecoration(hintText: 'Enter CoffeeName'),
            validator: (value) {
              if(value!=null && value.isEmpty){
                return "Enter Name";
              }
            },controller: nameController),
            TextFormField(decoration: InputDecoration(hintText: 'Enter CoffeePrice'),
              validator: (value) {
                if(value!=null && value.isEmpty){
                  return "Enter Price";
                }
              },controller: priceController,),
            TextFormField(decoration: InputDecoration(hintText: 'Enter CoffeeTag'),
              validator: (value) {
                if(value!=null && value.isEmpty){
                  return "Enter Tag";
                }
              },controller: tagController,),
            TextButton(onPressed: () async {
              if(formKey.currentState!.validate()){
                   await add().then((value) =>   setState(() {

                   })
                   );

                   Navigator.of(context).pop(true);
              }
            }, child: Text("Submit"))

          ],
        )),
      );
  }

  Future<void> add() async {
    Map map={};
    map["CoffeeName"]= nameController.text;
    map["CoffeePrice"]=priceController.text;
    map["CoffeeTag"]=tagController.text;

    var res1=await http.post(Uri.parse("https://630c5ca683986f74a7be897b.mockapi.io/coffee"),body: map);
    print(res1);
  }
}