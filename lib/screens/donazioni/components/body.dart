import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front_end_utente/components/CirculareIconButton.dart';
import 'package:front_end_utente/components/InputField.dart';
import 'package:front_end_utente/models/Model.dart';
import 'package:front_end_utente/models/objects/Donazione.dart';
import 'package:front_end_utente/screens/behaviours/AppLocalizations.dart';
import 'package:front_end_utente/support/extension/StringCapitalization.dart';

import 'DonationCard.dart';

class DonazioniBody extends StatefulWidget {

  @override
  State<DonazioniBody> createState()=>_donazioniBodyState();

}

class _donazioniBodyState extends State<DonazioniBody>{

  TextEditingController _cittaFiledController = TextEditingController();
  String input="";
  bool _working=false;
  List<Donazione> _donazioni=null;
  int page=0;
  int size=25;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          top(),
          bottom(),
          pageIndex(),
        ],
      )
    );
  }

  Widget bottom(){
    RouteSettings settings=ModalRoute.of(context).settings;
    String id=settings.arguments;
    if(id!=null&&id!="")
      return redirectBottom(id);
    return normalBottom();
  }



  Widget top(){
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        children: <Widget>[
          Flexible(
            child: InputField(
              labelText: AppLocalizations.of(context).translate("city"),
              controller: _cittaFiledController,
              onSubmit: (value){
                input=_cittaFiledController.text;
                page=0;
                search();
                },
            )
          ),
          CircularIconButton(
            icon: Icons.search_rounded,
            onPressed: (){
              input=_cittaFiledController.text;
              page=0;
              search();
              },
          ),
        ]
      )
    );
  }

  Widget redirectBottom(String name){
    if(_donazioni==null){
      searchSede(name);
      return CircularProgressIndicator();
    }else if(_donazioni.length==0)
      return noResults();
    return yesResults();
  }

  Widget normalBottom(){
    return !_working ?
        _donazioni==null ?
            SizedBox.shrink() :
            _donazioni.length == 0 ?
                noResults() :
                yesResults() :
            CircularProgressIndicator();
  }



  Widget noResults(){
    return Center(
      child: _donazioni==null ?
      Text(
          AppLocalizations.of(context).translate("no_results").capitalize+"!",
          style:
          TextStyle(
              fontSize: 40,
              color: Theme.of(context).primaryColor
          )
      ) :
      Text(
          AppLocalizations.of(context).translate("no_more_donations").capitalize+"!",
          style:
          TextStyle(
              fontSize: 40,
              color: Theme.of(context).primaryColor
          )
      )
    );
  }

  Widget yesResults(){
    return Expanded(
      child: ListView.builder(
        itemCount: _donazioni.length,
        itemBuilder: (context,index){
            return DonationCard(donazione:_donazioni[index]);
          },
      ),
    );
  }

  Widget nextButton(){
    return _donazioni.length<size ?
        SizedBox.shrink() :
        TextButton(
          child: Text(
             ">",
             style: TextStyle(
                  fontSize: 25,
                 color: Theme.of(context).primaryColor
             )
          ),
          onPressed: (){
            setState(() {
              page++;
            });
            search();
          },
        );
  }

  Widget previousButton(){
    return page==0 ?
        SizedBox.shrink() :
    TextButton(
        child: Text(
            "<",
            style: TextStyle(
                fontSize: 25,
                color: Theme.of(context).primaryColor
            )
        ),
      onPressed: (){
          setState(() {
            page--;
            search();
          });
      },
    );
  }

  Widget pageIndex(){
    if(_donazioni==null)return SizedBox.shrink();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        previousButton(),
        Text(
            (page+1).toString(),
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).primaryColor,
          )
        ),
        nextButton(),
      ],
    );
  }

  void search(){
    setState(() {
      _working=true;
      _donazioni=null;
    });
    Model.sharedInstance.searchDonazioni(input,page,size).then((result) {
      setState(() {
        _working = false;
        _donazioni = result;
      });
    });
  }

  void searchSede(String id){
    setState((){
      _working=true;
      _donazioni=null;
    });
    Model.sharedInstance.searchDonazioni(id,page,size).then((result){
      setState((){
        _working = false;
        _donazioni = result;
      });
    });
  }

}