import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_utente/models/Model.dart';
import 'package:front_end_utente/models/objects/Donazione.dart';
import 'package:front_end_utente/models/objects/Turno.dart';
import 'package:front_end_utente/screens/behaviours/AppLocalizations.dart';
import 'package:front_end_utente/support/extension/StringCapitalization.dart';

import 'TurniView.dart';

class TurnoBody extends StatefulWidget{

  Donazione donazione;

  TurnoBody(this.donazione);

  @override
  State<TurnoBody> createState()=>_turnoBodyState(donazione);

}

class _turnoBodyState extends State<TurnoBody>{

  Donazione _donazione;
  List<Turno> _turni=null;

  _turnoBodyState(this._donazione);

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        title(),
        turni(),
      ]
    );
  }

  Widget title(){
    return Text(
      AppLocalizations.of(context).translate("for_the_donation_on").capitalize+" "+_donazione.date.day.toString()+"/"+_donazione.date.month.toString()+"/"+" "+_donazione.date.year.toString()+AppLocalizations.of(context).translate("in")+" "+_donazione.sede.city+" "+AppLocalizations.of(context).translate("are_available_shifts")+":",
      style: TextStyle(
        fontSize: 20,
        color: Theme.of(context).primaryColor,
      ),
      textAlign: TextAlign.left,
    );
  }

  Widget turni(){
    if(_turni==null){
      _search();
      return CircularProgressIndicator();
    }
    return _listaTurni();
  }

  void _search(){
    Model.sharedInstance.searchTurni(_donazione.id).then((result){
      setState(() {
        _turni=result;
      });
    });
  }

  Widget _listaTurni(){
    return Expanded(
        child:TurniView(_turni)
    );
  }

}