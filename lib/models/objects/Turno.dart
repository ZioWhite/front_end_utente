import 'dart:core';

import 'package:flutter/material.dart';
import 'package:front_end_utente/models/support/extension/TimeTokenizer.dart';

import 'Donazione.dart';


class Turno{

  int id;
  TimeOfDay start;
  TimeOfDay end;
  int slots;
  Donazione donazione;

  Turno({this.id,this.start,this.end,this.slots,this.donazione});

  factory Turno.fromJson(Map<String,dynamic> json){
    Turno t = Turno(
      id:json['id'],
      start:TimeTokenizer.convert(json['start']),
      end:TimeTokenizer.convert(json['end']),
      slots:json['slots'],
      donazione:Donazione.fromJson(json['donazione'])
    );
    return t;
  }

  Map<String,dynamic> toJson()=>{
    'id':id,
    'start':start,
    'end':end,
    'slots':slots,
    'donazione':donazione.toJson()
  };

}