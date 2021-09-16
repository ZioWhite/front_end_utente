import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_utente/models/objects/Turno.dart';

import 'TurnoTile.dart';

class TurniView extends StatelessWidget{

  List<Turno> _turni;

  TurniView(this._turni);

  @override
  Widget build(BuildContext context){
    return ListView.separated(
      itemCount: _turni.length,
      itemBuilder: (context,index){
        return TurnoTile(_turni[index]);
      },
      separatorBuilder: (context,index){
        return Divider(
          thickness: 2,
          indent: 30,
          endIndent: 30,
        );
      },
    );
  }

}