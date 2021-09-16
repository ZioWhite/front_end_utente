import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_utente/models/Model.dart';
import 'package:front_end_utente/models/objects/Turno.dart';
import 'package:front_end_utente/screens/behaviours/AppLocalizations.dart';
import 'package:front_end_utente/support/extension/StringCapitalization.dart';

class MyBookingDialog extends StatelessWidget{

  Turno turno;

  MyBookingDialog(this.turno);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(
          AppLocalizations.of(context).translate("want_to_book").capitalize+"?",
          style: TextStyle(
            color:Theme.of(context).backgroundColor,
            fontSize: 20,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 10,
        actions: <Widget>[
          TextButton(
            child: Text(
              AppLocalizations.of(context).translate("confirm").capitalize,
              style: TextStyle(color:Theme.of(context).backgroundColor),
            ),
            onPressed:() async {
              await Model.sharedInstance.newPrenotazione(1,turno.id);
              Navigator.pushNamed(context,'/prenotazioni');
            },
          ),
          TextButton(
              child: Text(
                AppLocalizations.of(context).translate("cancel").capitalize,
                style: TextStyle(color:Theme.of(context).backgroundColor),
              ),
              onPressed:(){Navigator.pop(context);}
          )
        ]
    );
  }

}