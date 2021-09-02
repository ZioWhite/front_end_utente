import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_utente/screens/prenotazioni/prenotazioni.dart';

class MyDrawer extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return new Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text("Header"),
            decoration: BoxDecoration(
              color: Colors.deepOrange,
            ),
          ),
          ListTile(
            leading: Icon(Icons.assignment_rounded),
            title:Text("Prenotazioni"),
            onTap: () {
              Navigator.pushNamed(context,'/prenotazioni');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.bloodtype),
            title: Text("Donazioni"),
            onTap: (){},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.where_to_vote),
            title:Text("Sedi"),
            onTap: (){}
          ),
          Divider(),
          ListTile(
            trailing: Icon(Icons.close),
            title: Text("close"),
            onTap: (){
              print("Closed!");
            },
          )
        ],
      )
    );
  }

}