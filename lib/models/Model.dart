import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:front_end_utente/models/objects/Donatore.dart';
import 'package:front_end_utente/models/objects/Prenotazione.dart';
import 'package:front_end_utente/models/support/Constants.dart';
import 'package:front_end_utente/models/support/LogInResult.dart';

import 'managers/RestManager.dart';
import 'objects/AuthenticationData.dart';
import 'objects/Donazione.dart';
import 'objects/Sede.dart';
import 'objects/Turno.dart';

class Model {

  static Model sharedInstance = Model();

  RestManager _restManager = RestManager();
  AuthenticationData _authenticationData;
  Donatore donor;


  Future<LogInResult> logIn(String email, String password) async {
    try{
      Map<String, String> params = Map();
      params["grant_type"] = "password";
      params["client_id"] = Constants.CLIENT_ID;
      params["client_secret"] = Constants.CLIENT_SECRET;
      params["username"] = email;
      params["password"] = password;
      String result = await _restManager.makePostRequest(Constants.ADDRESS_AUTHENTICATION_SERVER, Constants.REQUEST_LOGIN, params, type: TypeHeader.urlencoded);
      _authenticationData = AuthenticationData.fromJson(jsonDecode(result));
      if ( _authenticationData.hasError() ) {
        if ( _authenticationData.error == "Invalid user credentials" ) {
          return LogInResult.error_wrong_credentials;
        }
        else if ( _authenticationData.error == "Account is not fully set up" ) {
          return LogInResult.error_not_fully_setupped;
        }
        else {
          return LogInResult.error_unknown;
        }
      }
      _restManager.token = _authenticationData.accessToken;
      Timer.periodic(Duration(seconds: (_authenticationData.expiresIn - 50)), (Timer t) {
        _refreshToken();
      });
      return LogInResult.logged;
    }
    catch (e) {
      return LogInResult.error_unknown;
    }
  }

  Future<bool> _refreshToken() async {
    try {
      Map<String, String> params = Map();
      params["grant_type"] = "refresh_token";
      params["client_id"] = Constants.CLIENT_ID;
      params["client_secret"] = Constants.CLIENT_SECRET;
      params["refresh_token"] = _authenticationData.refreshToken;
      String result = await _restManager.makePostRequest(Constants.ADDRESS_AUTHENTICATION_SERVER, Constants.REQUEST_LOGIN, params, type: TypeHeader.urlencoded);
      _authenticationData = AuthenticationData.fromJson(jsonDecode(result));
      if ( _authenticationData.hasError() ) {
        return false;
      }
      _restManager.token = _authenticationData.accessToken;
      return true;
    }
    catch (e) {
      return false;
    }
  }

  Future<bool> logOut() async {
    try{
      Map<String, String> params = Map();
      _restManager.token = null;
      params["client_id"] = Constants.CLIENT_ID;
      params["client_secret"] = Constants.CLIENT_SECRET;
      params["refresh_token"] = _authenticationData.refreshToken;
      await _restManager.makePostRequest(Constants.ADDRESS_AUTHENTICATION_SERVER, Constants.REQUEST_LOGOUT, params, type: TypeHeader.urlencoded);
      return true;
    }
    catch (e) {
      return false;
    }
  }

  Future<Donatore> searchByTaxCode(String taxcode) async {
    try{
      String rawResult=await _restManager.makeGetRequest(Constants.ADDRESS_STORE_SERVER,Constants.REQUEST_SEARCH_DONOR_BY_CODE+'?codicefiscale='+taxcode);
      return Donatore.fromJson(jsonDecode(rawResult));
    }catch(e){
      print(e);
    }
  }

  Future<List<Donazione>> searchDonazioni(String citta, int page, int size) async {
    try{
      DateTime start=DateTime.now();
      DateTime end=DateTime.now().add(Duration(days: 365));
      String today=start.day.toString()+"/"+start.month.toString()+"/"+start.year.toString();
      String plus=end.day.toString()+"/"+end.month.toString()+"/"+end.year.toString();
      String queryParams="?pagenumber="+page.toString()+"&pagesize="+size.toString()+"&sortby=data&datestart="+today+"&dateend="+plus+"&citta="+citta;
      List<Donazione> result=List<Donazione>.from(json.decode(await _restManager.makeGetRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_SEARCH_DONATION+queryParams)).map((i)=>Donazione.fromJson(i)).toList());
      return result;
    }catch(e){
      throw e;
    }
  }

  Future<List<Donazione>> searchDonazioniBySede(String sede, int page, int size) async {
    try{
      DateTime start=DateTime.now();
      DateTime end=DateTime.now().add(Duration(days: 365));
      String today=start.day.toString()+"/"+start.month.toString()+"/"+start.year.toString();
      String plus=end.day.toString()+"/"+end.month.toString()+"/"+end.year.toString();
      String queryParams="?pagenumber="+page.toString()+"&pagesize="+size.toString()+"&sortby=data&datestart="+today+"&dateend="+plus+"&sede="+sede;
      List<Donazione> result=List<Donazione>.from(json.decode(await _restManager.makeGetRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_SEARCH_DONATION_BYBRANCH+queryParams)).map((i)=>Donazione.fromJson(i)).toList());
      return result;
    }catch(e){
      throw e;
    }
  }

  Future<List<Turno>> searchTurni(int id) async {
    try{
      String queryParams="?pagenumber=0&pagesize=3000&sortby=start&slots=0&donazione="+id.toString();
      List<Turno> result=List<Turno>.from(json.decode(await _restManager.makeGetRequest(Constants.ADDRESS_STORE_SERVER,Constants.REQUEST_SEARCH_TURNI+queryParams)).map((i)=>Turno.fromJson(i)).toList());
      return result;
    }catch(e){
      throw e;
    }
  }
  
  Future<List<Prenotazione>> searchPrenotazioni(int page,int size,String sort,int id) async {
    try{
      String queryParams="?pagenumber="+page.toString()+"&pagesize="+size.toString()+"&sortby="+sort+"&donatore="+id.toString();
      List<Prenotazione> result=List<Prenotazione>.from(json.decode(await _restManager.makeGetRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_SEARCH_BOOKING_BY_DONOR+queryParams)).map((i)=>Prenotazione.fromJson(i)).toList());
      return result;
    }catch (e) {
      throw e;
    }
  }

  Future<List<Sede>> searchSedi(int page, int size, String sort, String city) async {
    try{
      String queryParams="?pagenumber="+page.toString()+"&pagesize="+size.toString()+"&sortby="+sort+"&nome=&citta="+city;
      //print(Constants.ADDRESS_STORE_SERVER+Constants.REQUEST_SEARCH_BRANCHES+queryParams);
      List<Sede> result=List<Sede>.from(json.decode(await _restManager.makeGetRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_SEARCH_BRANCHES+queryParams)).map((i)=>Sede.fromJson(i)).toList());
      return result;
    }catch (e){
      throw e;
    }
  }

  Future<String> deletePrenotazione(int id) async {
    try{
      String serviceUrl="/prenotazioni/"+id.toString()+"/delete";
      await _restManager.makeDeleteRequest(Constants.ADDRESS_STORE_SERVER, serviceUrl);
      return "OK";
    }catch(e){
      print(e);
    }
  }

  Future<Prenotazione> newPrenotazione(int donatore,int turno) async {
    String queryParams="?donatore="+donatore.toString()+"&turno="+turno.toString();
    Prenotazione result=Prenotazione.fromJson(jsonDecode(await _restManager.makePostRequest(Constants.ADDRESS_STORE_SERVER,Constants.REQUEST_NEW_BOOKING+queryParams,"")));
    return result;
  }

  Future<List<Donatore>> searchProduct(String name) async {
    Map<String, String> params = Map();
    params["name"] = name;
    try {
      return List<Donatore>.from(json.decode(await _restManager.makeGetRequest(Constants.ADDRESS_STORE_SERVER, "Constants.REQUEST_SEARCH_PRODUCTS", params)).map((i) => Donatore.fromJson(i)).toList());
    }
    catch (e) {
      return null; // not the best solution
    }
  }

  Future<Donatore> addUser(Donatore user) async {
    try {
      String rawResult = await _restManager.makePostRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_ADD_USER, user);
      if ( rawResult.contains(Constants.RESPONSE_ERROR_MAIL_USER_ALREADY_EXISTS) ) {
        return null; // not the best solution
      }
      else {
        return Donatore.fromJson(jsonDecode(rawResult));
      }
    }
    catch (e) {
      return null; // not the best solution
    }
  }


}