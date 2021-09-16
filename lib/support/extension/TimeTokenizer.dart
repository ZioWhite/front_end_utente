import 'package:flutter/material.dart';

extension TimeString on TimeOfDay {

  String get stringFormatted{
    String hour;
    String minute;
    if(this.hour<10)
      hour="0"+this.hour.toString();
    else
      hour=this.hour.toString();
    if(this.minute<10)
      hour="0"+this.minute.toString();
    else
      hour=this.minute.toString();
    return hour+":"+minute;
  }

}