import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

final TextEditingController __texteditingcontrol = new TextEditingController();

class _ReviewPageState extends State<ReviewPage> {
  double _rating;

  Widget _buildEmailTextField() {
    return TextField(
      enabled: true,
      maxLength: 100,
      maxLengthEnforced: true,
      controller: __texteditingcontrol,
      decoration: InputDecoration(
        hintText: "Enter Review",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    );
  }

  _displayDialog(BuildContext context) async {
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
              child: _buildEmailTextField()),
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Show Alert Dialog'),
          color: Colors.cyan,
          onPressed: () => _displayDialog(context),
        ),
      ),
    );
  }

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
