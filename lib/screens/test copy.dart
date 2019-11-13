import 'package:flutter/material.dart';
import 'package:foodbyte/Utils/Const.dart';
import 'package:foodbyte/Utils/restaurants.dart';
import 'package:speech_recognition/speech_recognition.dart';


class TestClass extends StatefulWidget {
  @override
  _TestClassState createState() => new _TestClassState();
}

class _TestClassState extends State<TestClass> {
  TextEditingController editingController = TextEditingController();
  IconData mic_icon = Icons.mic;
  String searchText = "Search..";
  SpeechRecognition _speechRecognition;
  bool isAvailable = false;
  bool isListening = false;
  final duplicateItems = List.generate(restaurants.length, (i) => restaurants[i]);
  var items = List();
  void initSpeedRecognition(){
    _speechRecognition = SpeechRecognition();
    _speechRecognition.setAvailabilityHandler((bool result)=> setState(()=>isAvailable = result));
    _speechRecognition.setRecognitionStartedHandler(()=>setState(()=>isListening= true));
    _speechRecognition.setRecognitionResultHandler((String speech)=>setState(()=>searchText = speech));
    _speechRecognition.setRecognitionCompleteHandler(()=>setState(()=>isListening = false));
    _speechRecognition.activate().then((result)=>setState(()=>isAvailable = result));
   
  }

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
    initSpeedRecognition();
  }

  void filterSearchResults(String query) {
    List dummySearchList = List();
    dummySearchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      List dummyListData = List();

      // for(var item in dummySearchList){
      //   if(item.contains(query)){
      //       dummyListData.add(item);
            
      //   }
      // }

      for(var i = 0;i<dummySearchList.length;i++){

           if(dummySearchList[i]["title"].contains(query)){
            dummyListData.add(dummySearchList[i]);
            
        }
      }
      // dummySearchList.forEach((item) {
      //   if(item.contains(query)) {
          
      //     dummyListData.add(item);
      //   }
      // }
      
      // );
      setState(() {
        items.clear();
        items.addAll(dummyListData);
        // _list.clear();
        // for(var i = 0 ;i<_index.length;i++){
        //     _list = restaurants[i];
        // }
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
        //  _list.clear();
        // for(var i = 0 ;i<_index.length;i++){
        //     _list = restaurants[i];
        // }
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Trending Restaurants"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.white,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: searchText,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  suffixIcon: IconButton(icon: Icon(mic_icon,color: Colors.red,),
                  color: Colors.black,
                  onPressed: (){
                    setState(() {
                     if(searchText == "Search.."){
                       searchText = "Listening..";
                       mic_icon = Icons.mic_off;

                       if(isAvailable && !isListening){
                         _speechRecognition.listen(locale: "en_US").then((result){
                           editingController.text = result;
                            //  filterSearchResults(result);
                         });
                       }
                     } 
                     else{
                       searchText = "Search..";
                       mic_icon = Icons.mic;
                       if(isListening){
                         _speechRecognition.stop().then((result)=>setState(()=>isListening = result));
                       }
                     }
                    }); 
                  },
                  ),
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                  style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Container(
        height: MediaQuery.of(context).size.height/2.25,
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)),
          elevation: 3.0,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height/3.5,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.asset(
                        items[index]["img"],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 6.0,
                    right: 6.0,
                    child: Card(
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(4.0)),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Constants.ratingBG,
                              size: 10,
                            ),

                            Text(
                              items[index]["rating"],
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 6.0,
                    left: 6.0,
                    child: Card(
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(3.0)),
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child:Text(
                          " OPEN ",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),


                ],
              ),

              SizedBox(height: 7.0),

              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    items[index]["title"],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),

              SizedBox(height: 7.0),

              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    items[index]["address"],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.0),

            ],
          ),
        ),
      ),
    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}