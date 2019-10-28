import 'package:flutter/material.dart';
import 'package:foodbyte/Utils/restaurants.dart';
import 'package:foodbyte/Utils/restaurants.dart' as prefix0;
import 'package:foodbyte/widgets/trending_item.dart';
import 'package:speech_recognition/speech_recognition.dart';


class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  final TextEditingController _searchControl = new TextEditingController();
  IconData mic_icon = Icons.mic;
  String searchText = "Search..";
  SpeechRecognition _speechRecognition;
  bool isAvailable = false;
  bool isListening = false;
  List filterRestaurant = new List();
  
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
    super.initState();
    initSpeedRecognition();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Trending Restaurants"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios
          ),
          onPressed: ()=>Navigator.pop(context),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(
          children: <Widget>[
            Card(
            elevation: 6.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: TextField(
                onChanged: (String value){
                  setState(() {
                  restaurants =  restaurants.where((items)=>(items.title.toString().toLowerCase().contains(value.toLowerCase())));

                  });
                },
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
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
                maxLines: 1,
                controller: _searchControl,
              ),
            ),
          ),


            SizedBox(height: 10.0),

            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: restaurants == null ? 0 :restaurants.length,
              itemBuilder: (BuildContext context, int index) {
                Map restaurant = restaurants[index];

                return TrendingItem(

                  img: restaurant["img"],
                  title: restaurant["title"],
                  address: restaurant["address"],
                  rating: restaurant["rating"],
                  
                );
              },
            ),

            SizedBox(height: 10.0),

          ],
        ),
      ),
    );
  }
}
