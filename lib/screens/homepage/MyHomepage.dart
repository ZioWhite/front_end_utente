import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_utente/components/MyDrawer.dart';
import 'package:front_end_utente/screens/behaviours/AppLocalizations.dart';
import 'package:front_end_utente/support/extension/StringCapitalization.dart';

class MyHomepage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title:Text(AppLocalizations.of(context).translate("donor").capitalize),
      ),
      drawer: MyDrawer(),
      body:
          SingleChildScrollView(
            child: Center(
                child: Text(
                  AppLocalizations.of(context).translate("welcome_to").capitalize+" "+AppLocalizations.of(context).translate("donor").capitalize,
                  style: TextStyle(
                      fontSize: 80
                  ),
                )
            )
          )
    );
  }
}