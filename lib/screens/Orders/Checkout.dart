import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foodbyte/screens/Main/main_screen.dart';


class Checkout  extends StatefulWidget {
    @override
  _Checkout createState() => _Checkout();
}

class _Checkout extends State<Checkout>
{
  @override
  void initState() {
    super.initState();
  }
int r = Random().nextInt(1000);

  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text("ORDER"),centerTitle: true,),
      body: Container(child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your Order has been placed ',style: TextStyle(fontSize: 20,),),
            Text('Order ID:  '+r.toString(),style: TextStyle(fontSize: 20,),),
            RaisedButton(
              child: Text("Home"),
              onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MainScreen()));

            },)
          ],
        ),
      ),),

    );
  }

}
