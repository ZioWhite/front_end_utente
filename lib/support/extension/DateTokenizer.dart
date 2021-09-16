extension DateString on DateTime{

  String get stringFormatted{
    return this.day.toString()+"/"+this.month.toString()+"/"+this.year.toString();
  }

}