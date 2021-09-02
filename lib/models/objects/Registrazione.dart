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
    return Registrazione(
      id:json['id'],
      esito:json['esito'],
      donor:json['donatore'],
      donation: json['donazione'],
      note:json['note'],
    );
  }

  Map<String,dynamic> toJson()=>{
    'id':id,
    'esito':esito,
    'donatore':donor,
    'donazione':donation,
    'note':note,
  };

}