// import 'package:foodbyte/localization/localization.dart';
// import 'package:flutter/material.dart';

// typedef void LocaleChangeCallback(Locale locale);


// class MyHomePage extends StatefulWidget {
//   final LocaleChangeCallback onLocaleChange;

//   MyHomePage({Key key, this.onLocaleChange}) : super(key: key);

//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text(AppLocalizations.of(context).heading),
//       ),
//       body: new Center(
//         child: new Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             new RaisedButton(
//               onPressed: () => widget.onLocaleChange(Locale("en", "US")),
//               child: new Text("EN"),
//             ),
//             new RaisedButton(
//               onPressed: () => widget.onLocaleChange(Locale("ur", "PK")),
//               child: new Text("UR"),
//             ),
//             new RaisedButton(
//               onPressed: () => widget.onLocaleChange(null),
//               child: new Text("Default"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }