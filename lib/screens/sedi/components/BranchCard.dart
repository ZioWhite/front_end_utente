import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_utente/models/objects/Sede.dart';
import 'package:front_end_utente/screens/behaviours/AppLocalizations.dart';
import 'package:front_end_utente/support/extension/StringCapitalization.dart';

class BranchCard extends StatefulWidget{

  Sede sede;

  BranchCard(this.sede);

  @override
  State<BranchCard> createState()=>_branchCardState(sede);

}

class _branchCardState extends State<BranchCard> {

  Sede sede;
  bool _pressed=false;

  _branchCardState(this.sede);

  @override
  Widget build(BuildContext context){
    return ListTile(
      tileColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 3
        ),
      ),
      title: Column(
        children: [
          title(),
          detail()
        ],
      ),
      onTap: (){
        setState(() {
          _pressed=!_pressed;
        });
      },
    );
  }

  Widget title(){
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Icon(Icons.my_location,color: Theme.of(context).backgroundColor)
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            sede.name,
            style: TextStyle(
              color: Theme.of(context).backgroundColor,
              fontSize: 20
            ),
          )
        )
      ],
    );
  }

  Widget detail(){
    if(!_pressed) return SizedBox.shrink();
    return ListTile(
      tileColor: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      title: Padding(
        padding:EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sede.address+", "+sede.city,
              style: _myTextStyle(),
            ),
            Text(
              AppLocalizations.of(context).translate("tax_code").capitalize+": "+sede.codiceFiscale,
              style: _myTextStyle(),
            ),
            Text(
                AppLocalizations.of(context).translate("contacts").capitalize+": ",
                style: _myTextStyle()
            ),
            Text(
                sede.email,
                style: _myTextStyle()
            ),
            Text(
              sede.phone,
              style: _myTextStyle(),
            )
          ],
        )
      ),
      trailing:
          FloatingActionButton(
            child: Text(
              AppLocalizations.of(context).translate("donations").capsLock,
              style: TextStyle(
                  color: Theme.of(context).backgroundColor,
                  fontSize: 8
              ),
            ),
            backgroundColor: Theme.of(context).buttonColor,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: (){
              Navigator.pushNamed(context,'/donazioni',arguments: sede.id.toString());
            },
          )
    );
  }

  TextStyle _myTextStyle(){
    return TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 12
    );
  }

  /*
  Widget detail(){
    return ListTile(
      color:Theme.of(context).backgroundColor,
      width: double.infinity,
      decoration: BoxDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),
      child:Row(
        children: [
          Column(
            children: [
              Text(
                sede.address+", "+sede.city,
                style:TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 12
                )
              ),
              Text(
                  AppLocalizations.of(context).translate("tax_code").capitalize+": "+sede.codiceFiscale,
                  style:TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12
                  )
              )
            ],
          ),
          Column(
            children: [
              Text(
                  sede.phone,
                  style:TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12
                  )
              ),
              Text(
                  sede.email,
                  style:TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12
                  )
              )
            ]
          )
        ],
      )
    );
  }

   */

}