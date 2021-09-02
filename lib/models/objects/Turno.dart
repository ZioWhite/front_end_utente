import 'dart:core';

import 'package:flutter/material.dart';

import 'Donazione.dart';


class Turno{

  int id;
  TimeOfDay start;
  TimeOfDay end;
  int slots;
  Donazione donazione;

  Turno({this.id,this.start,this.end,this.slots,this.donazione});

  factory Turno.fromJson(Map<String,dynamic> json){
    return Turno(
      id:json['id'],
      start:json['inizio'],
      end:json['fine'],
      slots:json['slots'],
      donazione:json['donazione']
    );
  }

}