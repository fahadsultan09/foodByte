import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodbyte/localization/localization.dart';



class profilePage extends StatefulWidget {
  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
 String  _name = "Robert Downey Jr";
  @override
  Widget build(BuildContext context) {
          final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(

      body:  new Container(
                  child: new Stack(
                    children: <Widget>[
                      // new Image.asset("fahad.jpg"),
                     new Container(
                          //   decoration: BoxDecoration(
                          //     color: Colors.blue,
                          //   borderRadius: BorderRadius.all(Radius.circular(50.0))
                          //   ),
                         
                          ),
                      new Center(
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(height: _height/12,),

                            new CircleAvatar(
                              
                              radius: _width<_height ?_width/6:_height/6,
                              backgroundImage: AssetImage("assets/RDJ.png"),
                            ),
                            new SizedBox(height: _height/25.0,),
                            Text(_name,style: new TextStyle(fontWeight: FontWeight.bold, fontSize: _width/15, color: Colors.black),),
                             new Padding(padding: new EdgeInsets.only(top: _height/30, left: _width/8, right: _width/8),
                             child: Text(AppLocalizations.of(context).consumer,style: TextStyle(fontWeight: FontWeight.normal,fontSize: _width/25,color: Colors.black),textAlign: TextAlign.center,),
                             
                             ),
                          new Divider(height: _height/30,color: Colors.black,),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                            
                            rowCell(231,AppLocalizations.of(context).orders),
                            rowCell(45,AppLocalizations.of(context).food_item)
                          ],),
                           new Divider(height: _height/30,color: Colors.black),
                           
                          
                          ],
                        ),
                      )
                    ],
                  ),
                ),
    );
    
  }
  Widget rowCell(int count, String type) => new Expanded(child: new Column(children: <Widget>[
    new Text('$count',style: new TextStyle(color: Colors.black),),
    new Text(type,style: new TextStyle(color: Colors.black, fontWeight: FontWeight.normal))
  ],));
}
