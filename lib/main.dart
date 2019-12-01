import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodbyte/screens/main_screen.dart';
import 'package:foodbyte/localization/localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:foodbyte/screens/switch_task.dart';
import 'package:foodbyte/screens/my_home.dart';
import 'Utils/Const.dart';
import 'Utils/helper.dart';

void main() async{
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 SpecificLocalizationDelegate _specificLocalizationDelegate;
  bool isDark = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDark ? Constants.darkPrimary : Constants.lightPrimary,
      statusBarIconBrightness: isDark?Brightness.light:Brightness.dark,
    ));

        helper.onLocaleChanged = onLocaleChange;

    _specificLocalizationDelegate = new SpecificLocalizationDelegate(new Locale("en"));

  }

  onLocaleChange(Locale l) {
    setState(() {
      _specificLocalizationDelegate = new SpecificLocalizationDelegate(l);
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        _specificLocalizationDelegate,
        // AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', "US"),
        Locale("ur", "PK"),
      ],
     locale: _specificLocalizationDelegate.overriddenLocale ,
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: isDark ? Constants.darkTheme : Constants.lightTheme,
      home: MainScreen(),
      // home: MyHomePage(onLocaleChange: onLocaleChange),
      // home: WelcomeScreen(),
    );
  }
}



