import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:front_end_utente/screens/behaviours/AppLocalizations.dart';
import 'package:front_end_utente/screens/donazioni/DonazioniPage.dart';
import 'package:front_end_utente/screens/homepage/MyHomepage.dart';
import 'package:front_end_utente/screens/login/LoginPage.dart';
import 'package:front_end_utente/screens/prenotazioni/prenotazioni.dart';
import 'package:front_end_utente/screens/sedi/SediPage.dart';

import 'models/support/Constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.APP_NAME,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(
        primaryColor: Colors.blue,
        buttonColor: Colors.red,
        backgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.amberAccent,
        backgroundColor: Colors.black,
        canvasColor: Colors.black,
        buttonColor: Colors.amber,
        cardColor: Colors.grey[800],
      ),
      routes: mainRouting(),
    );
  }

  Map<String,WidgetBuilder> mainRouting(){
    return {
      '/home': (context) => MyHomepage(),
      '/prenotazioni': (context) => Prenotazioni(),
      '/donazioni': (context) => DonazioniPage(),
      '/sedi': (context) => SediPage(),
      '/':(context)=>LoginPage(),
    };
  }

}


