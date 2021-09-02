import 'package:flutter/material.dart';
import 'package:front_end_utente/screens/homepage/MyHomepage.dart';
import 'package:front_end_utente/screens/prenotazioni/prenotazioni.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        secondaryHeaderColor: Colors.white,
      ),
      routes: mainRouting(),
    );
  }

  Map<String,WidgetBuilder> mainRouting(){
    return {
      '/': (context) => MyHomepage(),
      '/prenotazioni': (context) => Prenotazioni(),
    };
  }

}


