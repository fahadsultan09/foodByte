import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:foodbyte/screens/Orders/order_page.dart';
import 'package:toast/toast.dart';

class Restaurant extends StatefulWidget {

  Map restaurant;

  Restaurant(this.restaurant);
  @override
  _RestaurantState createState() => _RestaurantState(this.restaurant);
}

class _RestaurantState extends State<Restaurant> {
  Map restaurant;
  //  List _test;
  var list_name = new List();
  var mycolor=Colors.white;
  Color _color = Colors.red;

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
              
              // centerTitle: true,
              // // title: Text(restaurant["title"],style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic ),),
              background: Image.asset(restaurant["img"],fit:BoxFit.cover,),
              
            ),
          ),
          SliverFillRemaining(
            
            child: Container(
              child: FutureBuilder(
                  future: Firestore.instance.collection(restaurant["title"]).getDocuments(),
                  builder: buildVerifiedMedicines,
              ),
            ),
            )
        ],
      ),
    ); 
  }
  Widget buildVerifiedMedicines(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

    int i = 0;
    if (snapshot.hasData) {
        return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
                  var isSelected = false;
                  var c = Colors.black;
                DocumentSnapshot user = snapshot.data.documents[index];
                list_name.insert(index,Colors.white);     
                
                return new Card(
      color: list_name[index],
      child: new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        new ListTile(
            selected: isSelected,
            leading: CircleAvatar(
                         radius: 30.0,
                         backgroundImage: AssetImage('assets/background.jpg'),
                       ),
                       title: Text(user.data["Name"],style: TextStyle(fontSize: 25,color: c,),),
                       subtitle: Text("Rs. "+user.data["Price"],style: TextStyle(fontSize: 20.0,color: Colors.black),),
        //     trailing: ClipOval(
        //   child: Container(
        //     color: _color,
        //     height: 30.0, // height of the button
        //     width: 30.0, // width of the button
        //     // child: Center(child: Text(list_name[index].toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
        //   ),
        // ),
      
            onTap: (){
              
              Toast.show(user.data["Name"]+" Deleted to the cart", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM,backgroundColor: Colors.red);
              Firestore.instance.collection("Orders").document(user.documentID).delete();
              
            },
            onLongPress: (){
              
              setState(() {
                
                  c= Colors.green[200];
              Toast.show(user.data["Name"]+" Added to the cart", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM,backgroundColor: Colors.green);
              Firestore.instance.collection("Orders").document(user.documentID).setData(user.data);
              });
            
            } 
            )
      ]),
    );
    
            },
        );
    } else if (snapshot.connectionState == ConnectionState.done && !snapshot.hasData ){
        // Handle no data
        return Center(
            child: Text("No Restaurants found."),
        );
    } else {
        // Still loading
        return Center(child: CircularProgressIndicator());
    }
}
  
}
