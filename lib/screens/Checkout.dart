import 'package:flutter/material.dart';


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
  String orderId="9997";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ORDER"),),
      body: Container(child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your Order has been placed ',style: TextStyle(fontSize: 20,),),
            Text('Order Id '+orderId,style: TextStyle(fontSize: 20,),)

          ],
        ),
      ),),

    );
  }

}
