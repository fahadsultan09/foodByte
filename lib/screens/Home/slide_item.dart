import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodbyte/Utils/Const.dart';
import 'package:foodbyte/Utils/restaurants.dart';
class SlideItem extends StatefulWidget {

  final String img;
  final String title;
  final String address;
  final String rating;

  SlideItem({
    Key key,
    @required this.img,
    @required this.title,
    @required this.address,
    @required this.rating,
  })
      : super(key: key);

  @override
  _SlideItemState createState() => _SlideItemState();
}

class _SlideItemState extends State<SlideItem> {
  Random rnd =new Random();
  int r = 1;
int min = 1;
int max = 3;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.9,
        width: MediaQuery.of(context).size.width / 1.2,
        child: Card(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)),
          elevation: 3.0,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height/3.7,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.asset(
                        "${widget.img}",
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
                        padding: EdgeInsets.all(2.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Constants.ratingBG,
                              size: 10,
                            ),

                            Text(
                              " ${widget.rating} ",
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
                    child: GestureDetector(
                      onTap: (){
                        _displayDialog(context);
                         r = min + rnd.nextInt(max - min);
                         print(r);
                      },

                     
                                          child: Card(
                        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(3.0)),
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child:Text(
                            "REVIEWS",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
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
                    "${widget.title}",
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
                    "${widget.address}",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10.0),

            ],
          ),
        ),
      ),
    );
  }
  TextEditingController _textEditingController = new TextEditingController();
  _displayADDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            // title: Text('TextField in Dialog'),
            children: <Widget>[
              Container(
              padding: EdgeInsets.only(right: 10.0,left: 10.0),

              height: MediaQuery.of(context).size.height /8,
              width: MediaQuery.of(context).size.width-5,
              child: TextField(
      enabled: true,
      maxLength: 100,
      maxLengthEnforced: true,
      controller: _textEditingController,
      decoration: InputDecoration(
        hintText: "Enter Review",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    ),
    
    ),
              _ratingBar(),
              SizedBox(
                height: 20.0,
              ),
              new Row(children: <Widget>[
                new FlatButton(
                  child: new Text('CANCEL'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                new FlatButton(
                  child: new Text('SUBMIT'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ])
            ],
          );
        });
  
}

_displayDialog(BuildContext context) async {

    if(r==1){
      return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Colors.white70,
            title: Text('Reviews'),
            children: <Widget>[
              Container(
              padding: EdgeInsets.only(right: 10.0,left: 10.0),

              height: MediaQuery.of(context).size.height /2,
              width: MediaQuery.of(context).size.width-5,
                child: ListView.builder(
                  itemCount: myreviews.length,
                  itemBuilder: (BuildContext context,index){
                    return Card(
                      child: ListTile(
                        title: Text(myreviews[index]["title"]),
                        subtitle: Text(myreviews[index]["Review"]),
                      )
                    );
                  },
                ),
              )
              ],
              );
              },
              );
    }
    else if(r==2){
      return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Colors.white70,
            title: Text('Reviews'),
            children: <Widget>[
              Container(
              padding: EdgeInsets.only(right: 10.0,left: 10.0),

              height: MediaQuery.of(context).size.height /2,
              width: MediaQuery.of(context).size.width-5,
                child: ListView.builder(
                  itemCount: myreviews2.length,
                  itemBuilder: (BuildContext context,index){
                    return Card(
                      child: ListTile(
                        title: Text(myreviews2[index]["title"]),
                        subtitle: Text(myreviews2[index]["Review"]),
                      )
                    );
                  },
                ),
              )
              ],
              );
              },
              );
    }
    else if(r==3){
      return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Colors.white70,
            title: Text('Reviews'),
            children: <Widget>[
              Container(
              padding: EdgeInsets.only(right: 10.0,left: 10.0),

              height: MediaQuery.of(context).size.height /2,
              width: MediaQuery.of(context).size.width-5,
                child: ListView.builder(
                  itemCount: myreviews3.length,
                  itemBuilder: (BuildContext context,index){
                    return Card(
                      child: ListTile(
                        title: Text(myreviews3[index]["title"]),
                        subtitle: Text(myreviews3[index]["Review"]),
                      )
                    );
                  },
                ),
              )
              ],
              );
              },
              );
    }

    }
      double _rating;
    Widget _ratingBar() {
    return RatingBar(
      initialRating: 3,
      direction: Axis.horizontal,
      allowHalfRating: false,
      unratedColor: Colors.grey[200],
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        setState(() {
          _rating = rating;
        });
      },
    );
  }

}
