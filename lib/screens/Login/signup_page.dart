import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:foodbyte/localization/localization.dart';
import 'package:foodbyte/screens/Login/signIn_page.dart';
import 'package:foodbyte/screens/Main/main_screen.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:toast/toast.dart';
String CURRENTUSERID;
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}


 
 int r=0;
class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _texteditingcontrol=new TextEditingController();

   Widget _buildTextField() {
  
    return TextField(
      enabled: true,
      maxLength: 100,
      maxLengthEnforced: true,
      controller: _texteditingcontrol,
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
              child: _buildTextField()),
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
                    print(_texteditingcontrol.text);
                    if(r.toString()==_texteditingcontrol.text){
                        // print("true");
                        validateAndSubmit(); 
                                             
                    }
                  },
                )
              ])
            ],
          );
        });
  } 
  bool _toggleVisibility = true;
  bool _toggleConfirmVisibility = true;
  String _email,_password,_username;

   void _mail() async
  {
    Random random = new Random();
    r = random.nextInt(1000);
    String username = 'k163908@nu.edu.pk';
    String password = 'son of tariq';

     

  final smtpServer = gmail(username, password);

   final message = Message()
          ..from = Address(username, 'Your name')
          ..recipients.add(_email)
          ..subject = 'This is the token : '+ r.toString()
          ..text = 'This is the plain text.\nThis is line 2 of the text part.'
          ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";


  // final sendReport2 = await send(message, smtpServer);

  var connection = PersistentConnection(smtpServer);

  await connection.send(message);
  
  // close the connection
  await connection.close();
  // try {
  //   final sendReport = await send(message, smtpServer);
  //   print('Message sent: ' + sendReport.toString());
  // } on MailerException catch (e) {
  //   print('Message not sent.');
  //   for (var p in e.problems) {
  //     print('Problem: ${p.code}: ${p.msg}');
  //   }
  // }
  }
  Future validateAndSubmit () async {
    
 


    if(_email!=null){
      
      if(_password!=null){
          if (true){
      try {
        FirebaseUser user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email,password:_password)) as FirebaseUser;
          
      if(user!=null){
        // setWalletAmount(0);
        Firestore _firestore = Firestore.instance;
        _firestore.collection("Users").document( user.uid).setData(
        {"Email": _email,
        "Full Name": _username,
      });
      Toast.show("Login Successfully", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM,backgroundColor: Colors.green[500]);

          Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
      }
   
          }
          catch (e){
            print(e);
            if(e.toString()=="PlatformException(ERROR_EMAIL_ALREADY_IN_USE, The email address is already in use by another account., null)"){
                Toast.show("Login Failed ! Email already in use", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
            }
              
        }
        }

      }
      else{
           Toast.show("Login Failed ! Password should not be null", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
      }

    }
    else{
                 Toast.show("Login Failed ! Email should not be null", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

    }
    
    
      }
  Widget _buildEmailTextField() {
    return TextFormField(
      onChanged: (value){
        _email = value;
        print(_email);
      },
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context).email,
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget _buildUsernameTextField() {
    
    return TextFormField(
       onChanged: (value){
        _username = value;
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

  Widget _buildPasswordTextField() {
    return TextFormField(
       onChanged: (value){
        _password = value;
        print(_password);
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
  String _confirmpassword;
  Widget _buildConfirmPasswordTextField() {
    return TextFormField(
       onChanged: (value){
         _confirmpassword = value;
      },
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context).confirm_password,
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _toggleConfirmVisibility = !_toggleConfirmVisibility;
            });
          },
          icon: _toggleConfirmVisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
      ),
      obscureText: _toggleConfirmVisibility,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).signup,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Card(
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    _buildUsernameTextField(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _buildEmailTextField(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _buildPasswordTextField(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _buildConfirmPasswordTextField(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            GestureDetector(
              onTap: (){

                  if(_password.length>=6){
                    if(_confirmpassword==_password){
                     validateAndSubmit();
                }
                else{
                  Toast.show("Confirm Password be SAME to the password", context,backgroundColor: Colors.red[500],duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
                }
                    
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
                    AppLocalizations.of(context).signup,
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
                  AppLocalizations.of(context).a_account,
                  style: TextStyle(
                      color: Color(0xFFBDC2CB),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
                SizedBox(width: 10.0),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SignInPage()));
                  },
                  child: Text(
                    AppLocalizations.of(context).signin,
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