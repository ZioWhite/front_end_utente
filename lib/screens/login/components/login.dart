import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_utente/components/CirculareIconButton.dart';
import 'package:front_end_utente/components/InputField.dart';
import 'package:front_end_utente/models/Model.dart';
import 'package:front_end_utente/models/objects/Donatore.dart';
import 'package:front_end_utente/screens/behaviours/AppLocalizations.dart';
import 'package:front_end_utente/support/extension/StringCapitalization.dart';

class LoginForm extends StatefulWidget {

  LoginForm({Key key}):super(key:key);

  @override
  _LoginPageState createState()=>_LoginPageState();

}

class _LoginPageState extends State<LoginForm>{

  bool _working=false;
  Donatore _justLogged;

  TextEditingController _emailFiledController = TextEditingController();
  TextEditingController _passwordFiledController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                AppLocalizations.of(context).translate("login").capitalize,
                style: TextStyle(
                  fontSize: 50,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Column(
                children: <Widget>[
                  InputField(
                    isUsername: true,
                    labelText: AppLocalizations.of(context).translate("email"),
                    controller: _emailFiledController
                  ),
                  InputField(
                    isPassword: true,
                    labelText: AppLocalizations.of(context).translate("password"),
                    controller: _passwordFiledController,
                  ),
                  CircularIconButton(
                    icon: Icons.login,
                    onPressed: (){
                      search();
                    },
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: _working ?
                          CircularProgressIndicator() :
                          _justLogged != null ?
                              Text(
                                AppLocalizations.of(context).translate("login_sucessful").capitalize+"!",
                              ) :
                              SizedBox.shrink(),
                    )
                  )
                ],
              )
            ),
          ],
        );
  }

  void search() async {
    setState(() {
      _working=true;
      _justLogged=null;
    });
    String code=_emailFiledController.text;
    Model.sharedInstance.searchByTaxCode(code).then((result) {
      print(result);
      setState(() {
        _working=false;
        _justLogged=result;
      });
    });
  }

}