class Sede{

  int id;
  String name;
  String address;
  String email;
  String codiceFiscale;
  String phone;
  String city;

  Sede({this.id, this.name, this.address, this.email, this.codiceFiscale, this.phone, this.city});


  factory Sede.fromJson(Map<String,dynamic> json){
    return Sede(
        id:json['id'],
        name:json['nome'],
        codiceFiscale: json['codicefiscale'],
        address: json['indirizzo'],
        phone: json['telefono'],
        email: json['email'],
        city: json['citta'],
    );
  }

  Map<String, dynamic> toJson()=>{
    'id':id,
    'nome':name,
    'codicefiscale': codiceFiscale,
    'indirizzo':address,
    'telefono':phone,
    'email':email,
    'citta':city,
  };

}