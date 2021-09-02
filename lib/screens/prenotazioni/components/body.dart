import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyListView extends StatefulWidget{

  @override
  State<MyListView> createState()=>_MyListView();



}

class _MyListView extends State<MyListView>{

  List prenotazioni=[
    "ciao",
    "arrivederci",
    "grazie",
    "buongiorno",
  ];

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: prenotazioni.length,
      itemBuilder: (context,index){
        return Card(
            child:ListTile(
              leading: Icon(Icons.add,color:Colors.orange[800],size: 20),
              title: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "25/10/2021",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize:15
                        ),
                      ),
                      Text(
                        "H 08:30",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize:15
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Via Mazzini 25, Montepaone, 88060",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize:15
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Container(
                child: FloatingActionButton(
                  child: Icon(Icons.delete_forever_outlined),
                  onPressed: (){
                    prenotazioni.remove(prenotazioni[index]);
                    setState(() {
                      prenotazioni=prenotazioni;
                    });
                    print(prenotazioni);
                  },
                  shape: CircleBorder(),
                ),
                padding: EdgeInsets.all(8),
              )
            ),
            elevation:3,
            shape: StadiumBorder(
                side: BorderSide(
                    color: Colors.deepOrange,
                    width:1.0
                )
            )
        );
      },
    );
  }

}
