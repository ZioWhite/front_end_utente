import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Lesson 16"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            _setOverflowStack(Overflow.visible),
            _setOverflowStack(Overflow.clip),
          ]
        )
      )
    );
  }

  Widget _setFitStack(fit) => Stack(
    fit: fit,
    children: [
      Container(
        color: Colors.greenAccent,
        height: 100.0,
        width: 100.0,
      )
    ],
  );

  Widget _setOverflowStack(overflow)=>Container(
    margin: EdgeInsets.only(top:10),
    color: Colors.yellow[800],
    constraints: BoxConstraints.expand(height: 38),
    child: Stack(
      overflow: overflow,
      children: <Widget> [
        Positioned(
          top:10,
          child: Text(
              "cogito ergo sum, cogito ergo sum, cogito ergo sum, cogito ergo sum,\ncogito ergo sum, cogito ergo sum",
            style: TextStyle(color: Colors.black,fontSize: 15),
          )
        )
      ]
    )
  );

}