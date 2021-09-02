import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_utente/components/MyDrawer.dart';

class MyHomepage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title:Text("Donor"),
      ),
      drawer: MyDrawer(),
      body:
          SingleChildScrollView(
            child: Center(
                child: Text(
                  "Welcome to Donor!",
                  style: TextStyle(
                      fontSize: 80
                  ),
                )
            )
          )
    );
  }
}