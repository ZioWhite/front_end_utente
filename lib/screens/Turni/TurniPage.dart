import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_utente/components/MyDrawer.dart';
import 'package:front_end_utente/models/objects/Donazione.dart';
import 'package:front_end_utente/screens/behaviours/AppLocalizations.dart';
import 'package:front_end_utente/support/extension/StringCapitalization.dart';

import 'components/body.dart';

class TurniPage extends StatelessWidget{

  Donazione donazione;

  TurniPage(this.donazione);

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title:Text(AppLocalizations.of(context).translate("next_donations").capitalize),
      ),
      drawer: MyDrawer(),
      body: TurnoBody(donazione),
    );
  }
}