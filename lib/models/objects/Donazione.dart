import 'Sede.dart';

class Donazione{

  int id;
  DateTime date;
  Sede sede;

  Donazione({this.id,this.date,this.sede});

  factory Donazione.fromJson(Map<String,dynamic> json) {
    return Donazione(
      id:json['id'],
      date:json['data'],
      sede:json['sede']
    );
  }

  Map<String,dynamic> toJson()=>{
    'id':id,
    'data':date,
    'sede':sede
  };

}