import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_utente/components/CirculareIconButton.dart';
import 'package:front_end_utente/components/InputField.dart';
import 'package:front_end_utente/models/Model.dart';
import 'package:front_end_utente/models/objects/Sede.dart';
import 'package:front_end_utente/screens/behaviours/AppLocalizations.dart';
import 'package:front_end_utente/screens/sedi/components/BranchCard.dart';
import 'package:front_end_utente/support/extension/StringCapitalization.dart';

class SediBody extends StatefulWidget{

  @override
  State<SediBody> createState()=>_sediBodyState();

}

class _sediBodyState extends State<SediBody>{

  TextEditingController _cittaFiledController = TextEditingController();
  String input="";
  bool _working=false;
  List<Sede> _sedi=null;
  int page=0;
  int size=25;

  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: [
          top(),
          bottom(),
          pageIndex()
        ],
      )
    );
  }

  Widget top(){
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        children: [
          Flexible(
            child: InputField(
              labelText: AppLocalizations.of(context).translate("city"),
              controller: _cittaFiledController,
              onSubmit: (value){
                input=_cittaFiledController.text;
                page=0;
                search();
              },
            ),
          ),
          CircularIconButton(
            icon: Icons.search_rounded,
            onPressed: (){
              input=_cittaFiledController.text;
              page=0;
              search();
            },
          )
        ],
      )
    );
  }

  Widget bottom(){
    return !_working ?
        _sedi==null ?
            SizedBox.shrink() :
            _sedi.length == 0 ?
                noResults() :
                yesResults() :
        CircularProgressIndicator();
  }

  Widget noResults(){
    return Center(
      child: _sedi==null ?
      Text(
          AppLocalizations.of(context).translate("no_results").capitalize+"!",
        style:
          TextStyle(
            fontSize: 40,
            color: Theme.of(context).primaryColor
          )
      ) :
      Text(
        AppLocalizations.of(context).translate("no_more_branches").capitalize+"!",
        style:
        TextStyle(
          fontSize: 40,
          color: Theme.of(context).primaryColor
        ),
      )
    );
  }

  Widget yesResults(){
    return Expanded(
      child: ListView.separated(
        itemCount: _sedi.length,
        itemBuilder: (context,index){
          return BranchCard(_sedi[index]);
        },
        separatorBuilder: (context,index){
          return new Divider(
            thickness: 1,
            indent: 5,
            endIndent: 5,
          );
        },
      ),
    );
  }

  Widget nextButton(){
    return _sedi.length<size ?
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
    if(_sedi==null)return SizedBox.shrink();
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
      _sedi=null;
    });
    Model.sharedInstance.searchSedi(page,size,"nome",input).then((result) {
      setState(() {
        _working = false;
        _sedi = result;
      });
    });
  }

}