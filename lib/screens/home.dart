import 'package:flutter/material.dart';
import 'package:foodbyte/Utils/categories.dart';
import 'package:foodbyte/Utils/friends.dart';
import 'package:foodbyte/Utils/restaurants.dart';
import 'package:foodbyte/screens/scratchCard.dart';
import 'package:foodbyte/screens/test%20copy.dart';
import 'package:foodbyte/screens/trending.dart';
import 'package:foodbyte/widgets/slide_item.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:foodbyte/screens/signIn_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:foodbyte/localization/localization.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  final TextEditingController _searchControl = new TextEditingController();
  IconData mic_icon = Icons.mic;
  String searchText = "Search..";
  SpeechRecognition _speechRecognition;
  bool isAvailable = false;
  bool isListening = false;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  void initSpeedRecognition() {
    _speechRecognition = SpeechRecognition();
    _speechRecognition.setAvailabilityHandler(
        (bool result) => setState(() => isAvailable = result));
    _speechRecognition
        .setRecognitionStartedHandler(() => setState(() => isListening = true));
    _speechRecognition.setRecognitionResultHandler(
        (String speech) => setState(() => searchText = speech));
    _speechRecognition.setRecognitionCompleteHandler(
        () => setState(() => isListening = false));
    _speechRecognition
        .activate()
        .then((result) => setState(() => isAvailable = result));
  }

  void initNotifications() {
     flutterLocalNotificationsPlugin =
        new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(android, iOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  @override
  void initState() {
    super.initState();
    initSpeedRecognition();
    initNotifications();
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
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: new Text("Food Byte"),
        centerTitle: true,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountEmail: new Text("RDJ@gmail.com",
                  style: TextStyle(color: Colors.white)),
              accountName: new Text("Robert Downey Jr",
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: AssetImage('assets/RDJ.png'),
              ),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage("assets/background.jpg"),
                      fit: BoxFit.fill)),
            ),
            new ListTile(
                title: new Text("Page One"),
                trailing: new Icon(Icons.arrow_upward),
                onTap: () {
                  // Navigator.of(context).pop();
                  // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("First Page")));
                }),
            new ListTile(
                title: new Text("Wallet"),
                //             trailing: new Container(

                //               // child: new Text("32423",style: TextStyle(color: Colors.blueAccent,fontSize: 20.0),),
                //               decoration: BoxDecoration(
                //               color: Colors.blue[100],
                //   border: Border.all(
                //     color: Colors.blue[200],
                //     width: 1.0
                //   ),
                //   borderRadius: BorderRadius.all(
                //       Radius.circular(5.0) //         <--- border radius here
                //   ),
                // ),
                //             ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new scratchCard()));
                }),
            new ListTile(
                title: new Text("Signout"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new SignInPage()));
                }),
            new Divider(),
            new ListTile(
              title: new Text("Cancel"),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      // appBar: PreferredSize(
      //   child: Padding(
      //     padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
      //     child: Card(
      //       elevation: 6.0,
      //       child: Container(
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.all(
      //             Radius.circular(5.0),
      //           ),
      //         ),
      //         child: TextField(
      //           style: TextStyle(
      //             fontSize: 15.0,
      //             color: Colors.black,
      //           ),
      //           decoration: InputDecoration(
      //             contentPadding: EdgeInsets.all(10.0),
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(5.0),
      //               borderSide: BorderSide(color: Colors.white,),
      //             ),
      //             enabledBorder: OutlineInputBorder(
      //               borderSide: BorderSide(color: Colors.white,),
      //               borderRadius: BorderRadius.circular(5.0),
      //             ),
      //             hintText: searchText,
      //             prefixIcon: Icon(
      //               Icons.search,
      //               color: Colors.black,
      //             ),
      //             suffixIcon: IconButton(icon: Icon(mic_icon,color: Colors.red,),
      //             color: Colors.black,
      //             onPressed: (){
      //               setState(() {
      //                if(searchText == "Search.."){
      //                  searchText = "Listening..";
      //                  mic_icon = Icons.mic_off;

      //                  if(isAvailable && !isListening){
      //                    _speechRecognition.listen(locale: "en_US").then((result){

      //                    });
      //                  }
      //                }
      //                else{
      //                  searchText = "Search..";
      //                  mic_icon = Icons.mic;
      //                  if(isListening){
      //                    _speechRecognition.stop().then((result)=>setState(()=>isListening = result));
      //                  }
      //                }
      //               });
      //             },
      //             ),
      //             hintStyle: TextStyle(
      //               fontSize: 15.0,
      //               color: Colors.black,
      //             ),
      //           ),
      //           maxLines: 1,
      //           controller: _searchControl,
      //         ),
      //       ),
      //     ),
      //   ),
      //   preferredSize: Size(
      //     MediaQuery.of(context).size.width,
      //     60.0,
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                   AppLocalizations.of(context).heading,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                FlatButton(
                  child: Text(
                    "See all (43)",
                    style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return TestClass();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),

            SizedBox(height: 10.0),

            //Horizontal List here
            Container(
              height: MediaQuery.of(context).size.height / 2.4,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: restaurants == null ? 0 : restaurants.length,
                itemBuilder: (BuildContext context, int index) {
                  Map restaurant = restaurants[index];

                  return Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: SlideItem(
                      img: restaurant["img"],
                      title: restaurant["title"],
                      address: restaurant["address"],
                      rating: restaurant["rating"],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 10.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                FlatButton(
                  child: Text(
                    "See all (9)",
                    style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: () {
//                    Navigator.of(context).push(
//                      MaterialPageRoute(
//                        builder: (BuildContext context){
//                          return DishesScreen();
//                        },
//                      ),
//                    );
                  },
                ),
              ],
            ),

            SizedBox(height: 10.0),

            //Horizontal List here
            Container(
              height: MediaQuery.of(context).size.height / 6,
              child: ListView.builder(
                primary: false,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categories == null ? 0 : categories.length,
                itemBuilder: (BuildContext context, int index) {
                  Map cat = categories[index];

                  return Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            cat["img"],
                            height: MediaQuery.of(context).size.height / 6,
                            width: MediaQuery.of(context).size.height / 6,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                // Add one stop for each color. Stops should increase from 0 to 1
                                stops: [0.2, 0.7],
                                colors: [
                                  cat['color1'],
                                  cat['color2'],
                                ],
                                // stops: [0.0, 0.1],
                              ),
                            ),
                            height: MediaQuery.of(context).size.height / 6,
                            width: MediaQuery.of(context).size.height / 6,
                          ),
                          Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height / 6,
                              width: MediaQuery.of(context).size.height / 6,
                              padding: EdgeInsets.all(1),
                              constraints: BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                              ),
                              child: Center(
                                child: Text(
                                  cat["name"],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

//             SizedBox(height: 20.0),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text(
//                   "Friends",
//                   style: TextStyle(
//                     fontSize: 23,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//                 FlatButton(
//                   child: Text(
//                     "See all (59)",
//                     style: TextStyle(
// //                      fontSize: 22,
// //                      fontWeight: FontWeight.w800,
//                       color: Theme.of(context).accentColor,
//                     ),
//                   ),
//                   onPressed: () {
// //                    Navigator.of(context).push(
// //                      MaterialPageRoute(
// //                        builder: (BuildContext context){
// //                          return DishesScreen();
// //                        },
// //                      ),
// //                    );
//                   },
//                 ),
//               ],
//             ),

            SizedBox(height: 10.0),

            // Container(
            //   height: 50.0,
            //   child: ListView.builder(
            //     primary: false,
            //     scrollDirection: Axis.horizontal,
            //     shrinkWrap: true,
            //     itemCount: friends == null ? 0 : friends.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       String img = friends[index];

            //       return Padding(
            //         padding: EdgeInsets.only(right: 5.0),
            //         child: CircleAvatar(
            //           backgroundImage: AssetImage(
            //             img,
            //           ),
            //           radius: 25.0,
            //         ),
            //       );
            //     },
            //   ),
            // ),

            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  showNotification() async {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High, importance: Importance.Max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'New Video is out', 'Flutter Local Notification', platform,
        payload: 'Nitish Kumar Singh is part time Youtuber');
  }

  @override
  bool get wantKeepAlive => true;
}
