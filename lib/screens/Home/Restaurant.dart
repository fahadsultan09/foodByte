import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:foodbyte/screens/Orders/order_page.dart';

class Restaurant extends StatefulWidget {

  Map restaurant;

  Restaurant(this.restaurant);
  @override
  _RestaurantState createState() => _RestaurantState(this.restaurant);
}

class _RestaurantState extends State<Restaurant> {
  Map restaurant;
   var isSelected = false;
  Color mycolor=Colors.white;
  void initState() {
      super.initState();
  Timer.run(() {
    _showAlertDialog(context);
  });
       
      }

      void _showAlertDialog(BuildContext context) async {

  // set up the buttons
  // Widget cancelButton = FlatButton(
  //   child: Text("Cancel"),
  //   onPressed:  () {},
  // );
  Widget continueButton = FlatButton(
    child: Text("Ok"),
    onPressed:  () {
      Navigator.of(context, rootNavigator: true).pop('dialog');

    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Caution"),
    content: Text("Please Long Tap to add item and \n Single Tap to remove on the Food Items"),
    actions: [
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

  _RestaurantState(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(

            expandedHeight: 200.0,
            floating: false,
            pinned: true, 
            flexibleSpace: FlexibleSpaceBar(
              
              centerTitle: true,
              title: Text(restaurant["title"],style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic ),),
              background: Image.asset(restaurant["img"],fit:BoxFit.cover,),
              
            ),
          ),
          SliverFillRemaining(
            
            child: ListView.builder(
              itemCount: item.length,
              itemBuilder: (BuildContext context, int index) {

                return cardy(index);
              },
            ),
            )
        ],
      ),
    ); 
  }
  
}
int c = 0;

class cardy extends StatefulWidget {

  int i;
  cardy(this.i);
  @override
  _cardyState createState() => new _cardyState(i);
}

class _cardyState extends State<cardy> {

  int index=0;
  _cardyState(this.index);

  var isSelected = false;
  var mycolor=Colors.white;
  Color _color = Colors.red;
  int i = 0;
  @override
  Widget build(BuildContext context) {
    Map it = item[index];
    return new Card(
      color: Colors.white,
      child: new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        new ListTile(
            selected: isSelected,
            leading: CircleAvatar(
                         radius: 30.0,
                         backgroundImage: AssetImage('assets/food12.jpg'),
                       ),
                       title: Text(it["name"],style: TextStyle(fontSize: 25,color: Colors.black,),),
                       subtitle: Text("Rs 100",style: TextStyle(fontSize: 20.0,color: Colors.black),),
            trailing: ClipOval(
          child: Container(
            color: _color,
            height: 30.0, // height of the button
            width: 30.0, // width of the button
            child: Center(child: Text(i.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
          ),
        ),
      
            onTap: (){
              
                setState(() {
                  //  mycolor=Colors.white;
                 if(i!=0){
                    i--;
                 }
                 if(i==0){
                   _color = Colors.red;
                 }
                 

                });
              
            },
            onLongPress: (){
               setState(() {
      if (isSelected) {
        // mycolor=Colors.white;
        isSelected = false;
        
      } else {
        // mycolor=Colors.grey[300];
        // isSelected = true;
        _color = Colors.green;
        i++;
        print(it["name"]);
        // mySecret.add(it["name"]);
        // L.add(item[index]);
        setState(() {
          L.add(item[index]);
        });
        
      }
    });
            } // what should I put here,
            )
      ]),
    );
  }
  List<String> mySecret;
  void toggleSelection() {
    setState(() {
      if (isSelected) {
        mycolor=Colors.white;
        isSelected = false;
      } else {
        mycolor=Colors.grey[300];
        isSelected = true;
      }
    });
  }
}

List item = [
{
  "name":"Grilled Chicken",
  "price":120,
},
{
  "name":"Chicken Biryani",
  "price":100,
},
{
  "name":"Moist Handi Chicken",
  "price":500,
},
{
  "name":"Chicken Tikka",
  "price":200,
},
{
  "name":"Tikka Seekh",
  "price":200,
},
{
  "name":"Tikka Roll",
  "price":200,
},
{
  "name":"Chick Roll",
  "price":200,
}
];