import 'Donatore.dart';
import 'Turno.dart';

class Prenotazione {

  int id;
  Donatore donor;
  Turno turn;

  Prenotazione({this.id,this.donor,this.turn});

  factory Prenotazione.fromJson(Map<String,dynamic> json){
    return Prenotazione(
      id:json['id'],
      donor:json['donatore'],
      turn:json['turno']
    );
  }

  Map<String,dynamic> toJson()=>{
    'id':id,
    'donatore':donor,
    'turno':turn
  };

}