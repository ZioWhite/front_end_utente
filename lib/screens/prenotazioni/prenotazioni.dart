import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_utente/components/MyDrawer.dart';
import 'package:front_end_utente/screens/behaviours/AppLocalizations.dart';
import 'components/body.dart';
import 'package:front_end_utente/support/extension/StringCapitalization.dart';

class Prenotazioni extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return new Scaffold(
        appBar: AppBar(
          title:Text(AppLocalizations.of(context).translate("reservations").capitalize),
        ),
        drawer: MyDrawer(),
        body: MyListView()
    );
  }
}