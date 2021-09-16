import 'package:flutter/material.dart';

extension TimeTokenizer on TimeOfDay{

  static TimeOfDay convert(String time){
    try{
      return new TimeOfDay(hour: int.parse(time.split(":")[0]), minute: int.parse(time.split(":")[1]));
    }catch(e){
      print(e);
      return null;
    }
  }

  String get toStringFormatted{
    String hour="";
    String minute="";
    if(this.hour<10)hour="0"+this.hour.toString();
    else hour=this.hour.toString();
    if(this.minute<10)minute="0"+this.minute.toString();
    else minute=this.minute.toString();
    return hour+":"+minute;
  }

}