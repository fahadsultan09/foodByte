import 'package:flutter/material.dart';
import 'package:foodbyte/screens/Login/signIn_page.dart';
import 'package:foodbyte/screens/Login/signup_page.dart';
import 'dart:ui';

import 'package:foodbyte/screens/Main/main_screen.dart';

import 'package:foodbyte/sharedPreferences.dart';


class WelcomeScreen extends StatefulWidget {

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() { 
    super.initState();
    setWalletAmount(0);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            // image: CachedNetworkImageProvider(backImg),
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: const EdgeInsets.all(48.0),
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0,),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.restaurant_menu, size: 64, color: Colors.grey.shade800,),
                      const SizedBox(height: 10.0),
                      Text("Food Byte", style: TextStyle(
                        color: Colors.deepOrange.shade700,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold
                      ),),
                      const SizedBox(height: 20.0),
                      Text("Nutritionally balanced, easy to cook recipes. Quality fresh local ingredients.", textAlign: TextAlign.center, style: TextStyle(
                        fontSize: 18.0
                      )),
                      const SizedBox(height: 30.0),

                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 0,
                          highlightElevation: 0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          child: Text("Create Account"),
                          onPressed: (){
                            Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => SignUpPage()),
  );
                          },
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Text.rich(TextSpan(
                        children: [
                          TextSpan(text: "Already have account? "),
                          WidgetSpan(
                            child: InkWell(
                              onTap: (){
                                setWalletAmount(0);
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignInPage()));
                              },
                              child: Text("Log in", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            )
                          )
                        ]
                      )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}