import 'package:flutter/material.dart';
import 'package:foodbyte/screens/Login/signup_page.dart';
import 'package:foodbyte/screens/Main/main_screen.dart';
import 'package:toast/toast.dart';

import 'package:foodbyte/localization/localization.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _toggleVisibility = true;

  Widget _buildEmailTextField() {
    return TextFormField(
      onChanged: (value){
        _email = value;
      },
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context).username,
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    );
  }
  String _email,_password;
  FirebaseAuth auth = FirebaseAuth.instance;
   Future validateAndSubmit () async {

       if(_email!=null){

      if(_password!=null){
          if (true){

        try{
        
        var user =  await auth.signInWithEmailAndPassword(email: _email, password: _password);

        if(user!=null){
         Toast.show("Your Account has Login Successfully", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM,backgroundColor: Colors.green[500]);

          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainScreen()));
        }
    
      }
      catch (e){
        print(e);
        if(e.toString() =="PlatformException(ERROR_WRONG_PASSWORD, The password is invalid or the user does not have a password., null)"){
  Toast.show("Login Failed ! Wrong Password", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

        } 
      }
 

          }
      }
      else{
           Toast.show("Login Failed ! Password should not be null", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
      }
       }else{
           Toast.show("Login Failed ! Email should not be null", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
      }

   
  }
  Widget _buildPasswordTextField() {
    return TextFormField(
      onChanged: (value){
        _password = value;
      },
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context).password,
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _toggleVisibility = !_toggleVisibility;
            });
          },
          icon: _toggleVisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
      ),
      obscureText: _toggleVisibility,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).signin,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            GestureDetector(
              onTap: (){
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.sendPasswordResetEmail(email: "k163908@nu.edu.pk");

              },
                          child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context).forgotPassword,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    _buildEmailTextField(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _buildPasswordTextField(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            GestureDetector(
            onTap: () {
                 print(_email);
                  if(_password.length>=6){
                     validateAndSubmit();
                }
                else{
                  Toast.show("Password Length must be greater than 6", context,backgroundColor: Colors.red[500],duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
                }
                },
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25.0)),
              child: Center(
                child: Text(
                  AppLocalizations.of(context).signin,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ),
            Divider(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context).account,
                  style: TextStyle(
                      color: Color(0xFFBDC2CB),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
                SizedBox(width: 10.0),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => SignUpPage()));
                  },
                  child: Text(
                    AppLocalizations.of(context).signup,
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}