import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DrawerListTile extends StatefulWidget{

  final String title;
  final String route;
  final Icon icon;
  final AsyncValueSetter method;

  DrawerListTile(this.title,this.route,this.icon,this.method);

  @override
  _DrawerListTile createState() => _DrawerListTile(title,route,icon,method);

}

class _DrawerListTile extends State<DrawerListTile>{

  final String title;
  final String route;
  final Icon icon;
  final Function method;
  List list;
  bool _working=false;

  _DrawerListTile(this.title,this.route,this.icon,this.method);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: _working ? null:() async {
        setState(() {
          _working=true;
        });
        list=await method();
        Navigator.pushNamed(context,route);
        setState(() {
          _working=false;
        });
      },
      trailing: _working ? CircularProgressIndicator():null,
    );
  }

}