import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_utente/models/Model.dart';
import 'package:front_end_utente/models/objects/Prenotazione.dart';
import 'package:front_end_utente/screens/behaviours/AppLocalizations.dart';
import 'package:front_end_utente/screens/prenotazioni/components/CancelDialog.dart';
import 'package:front_end_utente/models/support/extension/DateTokenizer.dart';
import 'package:front_end_utente/models/support/extension/TimeTokenizer.dart';
import 'package:front_end_utente/support/extension/StringCapitalization.dart';

class MyListView extends StatefulWidget {

  @override
  State<MyListView> createState() => _prenotazioniBodyState();

}

class _prenotazioniBodyState extends State<MyListView> {

  List<Prenotazione> _prenotazioni=null;
  int page=0;
  int size=25;

  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: [
          Divider(
            thickness: 3,
            indent: 5,
            endIndent: 5,
          ),
          bottom(),
          pageIndex(),
        ],
      ),
    );
  }

  Widget bottom(){
    if(_prenotazioni==null){
      search();
      return CircularProgressIndicator();
    }
    else if(_prenotazioni.length==0)
      return noResults();
    return yesResults();
  }

  Widget noResults(){
    return _prenotazioni==null ?
        Text(
          AppLocalizations.of(context).translate("no_results").capitalize+"!",
          style: TextStyle(
            fontSize: 40,
            color: Theme.of(context).primaryColor
          )
        ) :
        Text(
          AppLocalizations.of(context).translate("no_more_reservations").capitalize+"!",
          style: TextStyle(
            fontSize: 40,
            color: Theme.of(context).primaryColor
          )
        );
  }

  Widget yesResults(){
    return Expanded(
      child: ListView.builder(
          itemCount: _prenotazioni.length,
          itemBuilder: (context,index){
            return ListTile(
              leading: Icon(Icons.bloodtype,color: Theme.of(context).buttonColor,size:20),
              title: Text(
                _prenotazioni[index].turn.donazione.date.stringFormatted,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                ),
              ),
              subtitle: Text(
                _prenotazioni[index].turn.start.toStringFormatted+" - "+_prenotazioni[index].turn.end.toStringFormatted+"\n"+_prenotazioni[index].turn.donazione.sede.address,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 15
                )
              ),
              trailing: FloatingActionButton(
                child: Icon(Icons.delete_forever_outlined),
                onPressed: (){
                  showCancelDialog(context,_prenotazioni[index]);
                },
              ),
              shape: StadiumBorder(
                side: BorderSide(
                  color: Theme.of(context).buttonColor,
                  width:1.0
                )
              ),
            );
          },
      )
    );
  }

  void showCancelDialog(BuildContext context,Prenotazione p){
    MyCancelDialog mcd=MyCancelDialog(p);
    showDialog(
        context: context,
        builder: (BuildContext context){
          return mcd;
        }
    );
  }

  Widget pageIndex(){
    if(_prenotazioni==null)return SizedBox.shrink();
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

  Widget nextButton(){
    return _prenotazioni.length<size ?
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

  void search(){
    setState(() {
      _prenotazioni=null;
    });
    Model.sharedInstance.searchPrenotazioni(page, size, "turno", 1).then((result) {
      setState(() {
        _prenotazioni = result;
      });
    });
  }

}
