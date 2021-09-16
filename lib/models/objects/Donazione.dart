import 'Sede.dart';

class Donazione{

  int id;
  DateTime date;
  Sede sede;

  Donazione({this.id,this.date,this.sede});

  factory Donazione.fromJson(Map<String,dynamic> json) {
    Sede s=Sede.fromJson(json['sede']);
    DateTime data=DateTime.parse(json['data']);
    Donazione d= Donazione(
      id:json['id'],
    );
    d.sede=s;
    d.date=data;
    return d;
  }

  Map<String,dynamic> toJson()=>{
    'id':id,
    'data':date,
    'sede':sede.toJson()
  };

}