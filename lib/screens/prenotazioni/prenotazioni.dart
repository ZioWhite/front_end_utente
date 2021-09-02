import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_utente/components/MyDrawer.dart';

import 'components/body.dart';

class Prenotazioni extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return new Scaffold(
        appBar: AppBar(
          title:Text("Prenotazioni"),
        ),
        drawer: MyDrawer(),
        body: MyListView(),
    );
  }
}