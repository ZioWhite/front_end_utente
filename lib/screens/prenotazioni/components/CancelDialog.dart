import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_utente/models/Model.dart';
import 'package:front_end_utente/models/objects/Prenotazione.dart';

class MyCancelDialog extends StatelessWidget {

  Prenotazione p;

  MyCancelDialog(this.p);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(
          "Vuoi cancellare questa prenotazione?",
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
            "Conferma",
            style: TextStyle(color:Colors.white),
          ),
          onPressed:() async {
            await Model.sharedInstance.deletePrenotazione(p.id);
            List<Prenotazione> list;
            await Model.sharedInstance.searchPrenotazioni(0,25,"id",1).then((result){
            if(result==null)list=[];
            else list=result;
          }) ;
          Navigator.pushNamed(context,'/prenotazioni',arguments: list);
          },
        ),
        TextButton(
            child: Text(
              'Annulla',
              style: TextStyle(color:Colors.white),
            ),
            onPressed:(){print("Annullato");Navigator.pop(context);}
        )
      ]
    );
  }

}
