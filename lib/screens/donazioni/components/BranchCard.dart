import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_utente/models/objects/Sede.dart';

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
    return Container(
      margin: EdgeInsets.all(10),
      color: Theme.of(context).primaryColor,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        )
      ),
      child: Column(
        children: [
          top(),
          _pressed ?
              detail() :
              SizedBox.shrink()
        ],
      )
    );
  }

  Widget top(){

  }

  Widget detail(){

  }

}