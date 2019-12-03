import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:foodbyte/localization/localization.dart';
import 'package:foodbyte/screens/Main/main_screen.dart';
import 'package:foodbyte/screens/Orders/Checkout.dart';
import 'package:foodbyte/sharedPreferences.dart';
// import 'package:toast/toast.dart';
class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
    int wallet =0;

  void initNotifications() {
     flutterLocalNotificationsPlugin =
        new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(android, iOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }
  static int sum ;
  @override
  void initState() {
    super.initState();
    initNotifications();
      sum = 0;
    getWalletAmount().then((value){
        setState(() {
          wallet = value;
        });
    });
  }

  Future onSelectNotification(String payload) {
    debugPrint("payload : $payload");
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text('Notification'),
        content: new Text('$payload'),
      ),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).cart,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
      ),

      body: Container(
        child: FutureBuilder(
            future: Firestore.instance.collection("Orders").getDocuments(),
            builder: buildVerifiedMedicines,
        ),
      ),
        
      bottomNavigationBar: _buildTotalContainer(),
    );
  }
  
  
   Widget  buildVerifiedMedicines(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    int qty = 1;
    int i = 0;

    if (snapshot.hasData) {
        return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
               
                               DocumentSnapshot user = snapshot.data.documents[index];
                              
                                sum = sum +int.parse(user.data["Price"]);
                            
                               return Card(
                     child: Padding(
                       padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                       child: Row(
                         mainAxisSize: MainAxisSize.max,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           // Container(
                           //   decoration: BoxDecoration(
                           //     border: Border.all(color: Color(0xFFD3D3D3), width: 2.0),
                           //     borderRadius: BorderRadius.circular(10.0),
                           //   ),
                           //   width: 45.0,
                           //   height: 73.0,
                           //   child: Padding(
                           //     padding: EdgeInsets.symmetric(
                           //       horizontal: 10.0,
                           //     ),
                           //     child: Column(
                           //       children: <Widget>[
                           //         InkWell(
                           //             onTap: () {
                           //               setState(() {
                           //                 qty ++;
                           //               });
                           //             },
                           //             child: Icon(Icons.keyboard_arrow_up,
                           //                 color: Color(0xFFD3D3D3))),
                           //         Text(
                           //           qty.toString(),
                           //           style: TextStyle(fontSize: 18.0, color: Colors.grey),
                           //         ),
                           //         InkWell(
                           //             onTap: () {
               
                           //             },
                           //             child: Icon(Icons.keyboard_arrow_down,
                           //                 color: Color(0xFFD3D3D3))),
                           //       ],
                           //     ),
                           //   ),
                           // ),
                           // SizedBox(
                           //   width: 20.0,
                           // ),
                           Container(
                             height: 60.0,
                             width: 60.0,
                             decoration: BoxDecoration(
                                 image: DecorationImage(
                                     image: AssetImage("assets/food10.jpeg"),
                                     fit: BoxFit.cover),
                                 borderRadius: BorderRadius.circular(35.0),
                                 boxShadow: [
                                   BoxShadow(
                                       color: Colors.black,
                                       blurRadius: 5.0,
                                       offset: Offset(0.0, 2.0))
                                 ]),
                           ),
                           SizedBox(
                             width: 20.0,
                           ),
                           Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                               Text(
                               user.data["Name"],
                                 style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                               ),
                               SizedBox(height: 5.0),
                               Text(
                                 "Rs ."+user.data["Price"],
                                 style: TextStyle(
                                     fontSize: 16.0,
                                     color: Colors.orangeAccent,
                                     fontWeight: FontWeight.bold),
                               ),
                               SizedBox(height: 5.0),
                               Container(
                                 height: 25.0,
                                 width: 120.0,
                                 child: ListView(
                                   scrollDirection: Axis.horizontal,
                                   children: <Widget>[
                                     Row(
                                       children: <Widget>[
                                         Text("Cash on Delivery",
                                             style: TextStyle(
                                                 color: Color(0xFFD3D3D3),
                                                 fontWeight: FontWeight.bold)),
                                         SizedBox(
                                           width: 5.0,
                                         ),
                                         InkWell(
                                           onTap: () {},
                                           child: Text(
                                             ".",
                                             style: TextStyle(
                                               fontWeight: FontWeight.bold,
                                               color: Colors.red,
                                             ),
                                           ),
                                         ),
                                         SizedBox(
                                           width: 10.0,
                                         ),
                                       ],
                                     ),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                           Spacer(),
                           GestureDetector(
                             onTap: () {
                               Firestore.instance.collection("Orders").document(user.documentID).delete();
                               // buildVerifiedMedicines(context, snapshot);
                               // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>OrderPage()));
                               
                             },
                             child: Icon(
                               Icons.cancel,
                               color: Colors.grey,
                             ),
                           ),
                         ],
                       ),
                     ),
                   );
                   
                           },
                       );
                   } else if (snapshot.connectionState == ConnectionState.done && !snapshot.hasData ){
                       // Handle no data
                       return Center(
                           child: Text("No Orders found."),
                       );
                   } else {
                       // Still loading
                       return Center(child: CircularProgressIndicator());
                   }
               }
                 Widget _buildTotalContainer() {
                   return Container(
                     height: 220.0,
                     padding: EdgeInsets.only(
                       left: 10.0,
                       right: 10.0,
                     ),
                     child: Column(
                       children: <Widget>[
                         Row(
                           mainAxisSize: MainAxisSize.max,
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: <Widget>[
                             Text(
                               AppLocalizations.of(context).subtotal,
                               style: TextStyle(
                                   color: Color(0xFF9BA7C6),
                                   fontSize: 16.0,
                                   fontWeight: FontWeight.bold),
                             ),
                             Text(
                               sum.toString(),
                               style: TextStyle(
                                   color: Color(0xFF6C6D6D),
                                   fontSize: 16.0,
                                   fontWeight: FontWeight.bold),
                             ),
                           ],
                         ),
                         SizedBox(
                           height: 10.0,
                         ),
                         Row(
                           mainAxisSize: MainAxisSize.max,
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: <Widget>[
                             Text(
                               AppLocalizations.of(context).discount,
                               style: TextStyle(
                                   color: Color(0xFF9BA7C6),
                                   fontSize: 16.0,
                                   fontWeight: FontWeight.bold),
                             ),
                             Text(
                               wallet.toString(),
                               style: TextStyle(
                                   color: Color(0xFF6C6D6D),
                                   fontSize: 16.0,
                                   fontWeight: FontWeight.bold),
                             ),
                           ],
                         ),
                         SizedBox(
                           height: 10.0,
                         ),
                         SizedBox(
                           height: 10.0,
                         ),
                         Divider(
                           height: 2.0,
                         ),
                         SizedBox(
                           height: 20.0,
                         ),
                         Row(
                           mainAxisSize: MainAxisSize.max,
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: <Widget>[
                             Text(
                               AppLocalizations.of(context).cart_total,
                               style: TextStyle(
                                   color: Color(0xFF9BA7C6),
                                   fontSize: 16.0,
                                   fontWeight: FontWeight.bold),
                             ),
                             Text(
                               (sum - wallet)>0?(sum - wallet).toString():"0",
                               style: TextStyle(
                                   color: Color(0xFF6C6D6D),
                                   fontSize: 16.0,
                                   fontWeight: FontWeight.bold),
                             ),
                           ],
                         ),
                         SizedBox(
                           height: 30.0,
                         ),
                         GestureDetector(
                           onTap: () {
                              
                            
                             _showNotificationWithoutSound();
                             setWalletAmount(0);
                             
                              Firestore.instance.collection('Orders').getDocuments().then((snapshot) {
                                
                                for (DocumentSnapshot ds in snapshot.documents){
                                    ds.reference.delete();
                                      }
                              });
                             
                             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Checkout()));
                             
                           },
                           child: Container(
                             height: 30.0,
                             decoration: BoxDecoration(
                               color: Theme.of(context).accentColor,
                               borderRadius: BorderRadius.circular(30.0),
                             ),
                             child: Center(
                               child: Text(
                                 AppLocalizations.of(context).checkout,
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 16.0,
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                             ),
                           ),
                         ),
                         SizedBox(
                           height: 30.0,
                         ),
                       ],
                     ),
                   );
                 }
               
               Future _showNotificationWithoutSound() async {
                 var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
                     'your channel id', 'your channel name', 'your channel description',
                     playSound: false, importance: Importance.Max, priority: Priority.High);
                 var iOSPlatformChannelSpecifics =
                     new IOSNotificationDetails(presentSound: false);
                 var platformChannelSpecifics = new NotificationDetails(
                     androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
                 await flutterLocalNotificationsPlugin.show(
                   0,
                   AppLocalizations.of(context).order,
                   AppLocalizations.of(context).order_detail,
                   platformChannelSpecifics,
                   payload: 'No_Sound',
                 );
               }
               
}


List L = [
{
  "name":"Grilled Chicken",
  "price":10,
},
{
  "name":"Chicken Biryani",
  "price":100,
},


];