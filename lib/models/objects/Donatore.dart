import 'Sede.dart';

class Donatore {

  int id;
  String name;
  String surname;
  String codiceFiscale;
  String address;
  String phone;
  String email;
  bool sospeso;
  Sede sede;

  Donatore({this.id, this.name, this.surname, this.codiceFiscale, this.address, this.phone, this.email, this.sospeso, this.sede});

  factory Donatore.fromJson(Map<String,dynamic> json){
    Sede s=Sede.fromJson(json['sede']);
    Donatore d = Donatore(
      id:json['id'],
      name:json['nome'],
      surname:json['cognome'],
      codiceFiscale: json['codicefiscale'],
      address: json['indirizzo'],
      phone: json['telefono'],
      email: json['email'],
      sospeso: json['sospeso']
    );
    d.sede=s;
    return d;
  }

  Map<String, dynamic> toJson()=>{
    'id':id,
    'nome':name,
    'cognome':surname,
    'codicefiscale': codiceFiscale,
    'indirizzo':address,
    'telefono':phone,
    'email':email,
    'sospeso':sospeso,
    'sede':sede.toJson()
  };

  String toString(){
    return id.toString()+": "+name+" "+surname+" "+sede.name;
  }

}