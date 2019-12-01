import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foodbyte/sharedPreferences.dart';
import 'package:scratcher/scratcher.dart';
import 'package:foodbyte/localization/localization.dart';

class scratchCard extends StatefulWidget {
  @override
  _scratchCardState createState() => _scratchCardState();
}

class _scratchCardState extends State<scratchCard> {

  int walletAmount = 0;
  var list = [10,200,30,50,25,100,];
  Random rnd;
  int min = 0;
  int max = 6;
  double _opacity = 0.0;

  int reward;

  @override
  void initState() {
    if(getWalletAmount()==null){
        setWalletAmount(0);
    }else{
      getWalletAmount().then(updateWallet);
    }
    
        super.initState();
      rnd = new Random();
      reward = list[min + rnd.nextInt(max - min)];
      
      }
    
      Future<void> scratchCardDialog(BuildContext context) {
        return showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              title: Align(
                alignment: Alignment.center,
                child: Text(
                  AppLocalizations.of(context).won,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              content: StatefulBuilder(builder: (context, StateSetter setState) {
                
                return Scratcher(
                  accuracy: ScratchAccuracy.low,
                  threshold: 25,
                  brushSize: 50,
                  onThreshold: () {
                    setState(() {
                      setWalletAmount(walletAmount+reward);
                      _opacity = 1;
                    });
                  },
                  imagePath: "assets/rewards.jpg",
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 250),
                    opacity: _opacity,
                    child: Container(
                      height: 300,
                      width: 300,
                      alignment: Alignment.center,
                      child: Text(
                        "Rs"+reward.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Colors.blue),
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        );
      }
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(AppLocalizations.of(context).wallet),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
         
                child: new Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text(AppLocalizations.of(context).wallet_contain,style: TextStyle(fontSize: 30.0),),
                    SizedBox(height: 40.0,),
                    new Text("Rs."+walletAmount.toString(),style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,),),
                    SizedBox(height: 180.0,),
                    FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: BorderSide.none,
                ),
                color: Colors.blue,
                child: Text(
                  AppLocalizations.of(context).scratchCard,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                onPressed: () {
                    
                    scratchCardDialog(context);
                  Future.delayed(const Duration(milliseconds: 6000), () {
  setState(() {
 Navigator.of(context).pop();
 Navigator.of(context).pop();
  });
});

                },

                
              ),
                  ],
                ),
        ),
            ),
          ),
        );
      }
    
      void updateWallet(int value) {

        setState(() {
         this.walletAmount = value; 
        });
  }
}