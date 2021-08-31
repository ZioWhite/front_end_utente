import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget{
  Counter():super();
  @override
  _CounterState createState()=>_CounterState();
}

class _CounterState extends State<Counter>{
  int _counter=0;
  void _incrementCounter(){
    setState((){
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text('StatefulWidget')
      ),
      body: Center(
        child:Text(
          '$_counter',
          style: TextStyle(fontSize:30)
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child:Icon(Icons.add)
      ),
    );
  }
}