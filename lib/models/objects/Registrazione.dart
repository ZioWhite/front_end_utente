import 'Donatore.dart';
import 'Donazione.dart';

class Registrazione{

  int id;
  String note;
  bool esito;
  Donatore donor;
  Donazione donation;

  Registrazione({this.id,this.esito,this.donor,this.donation,this.note});

  factory Registrazione.fromJson(Map<String,dynamic> json){
    Donatore d=Donatore.fromJson(json['donatore']);
    Donazione don=Donazione.fromJson(json['donazione']);
    Registrazione r = Registrazione(
      id:json['id'],
      esito:json['esito'],
      note:json['note'],
    );
    r.donor=d;
    r.donation=don;
    return r;
  }

  Map<String,dynamic> toJson()=>{
    'id':id,
    'esito':esito,
    'donatore':donor.toJson(),
    'donazione':donation.toJson(),
    'note':note,
  };

}