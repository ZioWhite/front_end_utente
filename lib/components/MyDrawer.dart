import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_utente/screens/behaviours/AppLocalizations.dart';
import 'package:front_end_utente/support/extension/StringCapitalization.dart';

class MyDrawer extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return new Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text("Header"),
            decoration: BoxDecoration(
              color: Theme.of(context).buttonColor,
            ),
          ),
          ListTile(
            leading: Icon(Icons.assignment_rounded),
            title:Text(AppLocalizations.of(context).translate("reservations").capitalize),
            onTap: () {
              Navigator.pushNamed(context,'/prenotazioni');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.bloodtype),
            title: Text(AppLocalizations.of(context).translate("donations").capitalize),
            onTap: (){
              Navigator.pushNamed(context, '/donazioni');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.where_to_vote),
            title:Text(AppLocalizations.of(context).translate("branches").capitalize),
            onTap: (){}
          ),
          Divider(),
          ListTile(
            trailing: Icon(Icons.close),
            title: Text(AppLocalizations.of(context).translate("close")),
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      )
    );
  }

}