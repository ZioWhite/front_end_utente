import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_utente/models/objects/Turno.dart';
import 'package:front_end_utente/models/support/extension/TimeTokenizer.dart';
import 'package:front_end_utente/screens/behaviours/AppLocalizations.dart';
import 'package:front_end_utente/support/extension/StringCapitalization.dart';

import 'MyBookingDialog.dart';

class TurnoTile extends StatelessWidget{

  Turno turno;

  TurnoTile(this.turno);

  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: Icon(
          Icons.access_time,
        color: Theme.of(context).primaryColor
      ),
      title: Row(
        children: [
          Text(
              turno.start.toStringFormatted+" - "+turno.end.toStringFormatted,//start.StringFormatted,
              style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).primaryColor
              )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            margin: EdgeInsets.only(left:10, right:10, top:0, bottom:0),
            decoration: ShapeDecoration(
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              )
            ),
            child: TextButton(
              child: Text(
                AppLocalizations.of(context).translate("book").capsLock,
                style: TextStyle(
                  color:Theme.of(context).backgroundColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed:(){
                showBookingDialog(context,turno);
              },
            )
          )
        ],
      )
    );
  }

  void showBookingDialog(BuildContext context, Turno turno){
    MyBookingDialog mbd=MyBookingDialog(turno);
    showDialog(
      context: context,
      builder: (BuildContext context){
        return mbd;
      }
    );
  }

}