import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_utente/models/objects/Donazione.dart';
import 'package:front_end_utente/screens/Turni/TurniPage.dart';

class DonationCard extends StatelessWidget {

  final Donazione donazione;

  DonationCard({Key key,this.donazione}) : super(key : key);

  @override
  Widget build(BuildContext context){
    return ListTile(
      onTap:(){
        Route route=MaterialPageRoute(builder: (context)=>TurniPage(donazione));
        Navigator.push(context,route);},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(
          color: Theme.of(context).buttonColor,
          width: 1,
        )
      ),
      title: Padding(
          padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: Icon(Icons.bloodtype,
                color: Theme.of(context).primaryColor
              ),
            ),
            Text(
              donazione.sede.name+": "+donazione.date.day.toString()+"/"+donazione.date.month.toString()+"/"+donazione.date.year.toString(),
              style: TextStyle(fontSize: 20,
                color: Theme.of(context).primaryColor,),
            ),
            Padding(
              padding: EdgeInsets.all(5),
                child: Icon(
                    Icons.assignment_rounded,
                  color: Theme.of(context).primaryColor,
                ),
            ),
          ],
        )
      ),
    );
  }

}