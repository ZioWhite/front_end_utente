import 'Donatore.dart';
import 'Turno.dart';

class Prenotazione {

  int id;
  Donatore donor;
  Turno turn;

  Prenotazione({this.id,this.donor,this.turn});

  factory Prenotazione.fromJson(Map<String,dynamic> json){
    Donatore d=Donatore.fromJson(json['donatore']);
    Turno t = Turno.fromJson(json['turno']);
    Prenotazione p = Prenotazione(
      id:json['id'],
    );
    p.donor=d;
    p.turn=t;
    return p;
  }

  Map<String,dynamic> toJson()=>{
    'id':id,
    'donatore':donor.toJson(),
    'turno':turn.toJson()
  };

  String toString(){
    return donor.toString()+" "+turn.donazione.date.toString()+"id: "+id.toString();
  }

}