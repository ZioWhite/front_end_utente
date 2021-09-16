import 'dart:convert';
import 'dart:io';
import 'package:front_end_utente/models/support/Constants.dart';
import 'package:front_end_utente/models/support/ErrorListener.dart';
import 'package:http/http.dart';


enum TypeHeader {
  json,
  urlencoded
}


class RestManager {
  ErrorListener delegate;
  String token;


  Future<String> _makeRequest(String serverAddress, String servicePath, String method, TypeHeader type, {Map<String, String> value, dynamic body}) async {
    String requestUrl=serverAddress+servicePath;
    bool errorOccurred = false;
    while ( true ) {
      try {
        var response;
        // setting content type
        String contentType;
        dynamic formattedBody;
        if ( type == TypeHeader.urlencoded ) {
          contentType = "application/x-www-form-urlencoded";
          formattedBody = body.keys.map((key) => "$key=${body[key]}").join("&");
        }
        else if ( type == TypeHeader.json) {
          contentType = "application/json;charset=utf-8";
          formattedBody = json.encode(body);
        }
        // setting headers
        Map<String, String> headers = Map();
        headers[HttpHeaders.contentTypeHeader] = contentType;
        if ( token != null ) {
          headers[HttpHeaders.authorizationHeader] = 'bearer $token';
        }
        // making request
        switch ( method ) {
          case "post":
            response = await post(
              requestUrl,
              headers: headers,
              body: formattedBody,
            );
            break;
          case "get":
            response = await get(
              requestUrl,
              headers: headers,
            );
            break;
          case "put":
            response = await put(
              requestUrl,
              headers: headers,
            );
            break;
          case "delete":
            response=await delete(
              requestUrl,
              headers: headers,
            );
            print("deleted");
            break;
        }
        if ( delegate != null && errorOccurred ) {
          delegate.errorNetworkGone();
          errorOccurred = false;
        }
        return response.body;
      } catch(err) {
        if ( delegate != null && !errorOccurred ) {
          delegate.errorNetworkOccurred(Constants.MESSAGE_CONNECTION_ERROR);
          errorOccurred = true;
        }
        await Future.delayed(const Duration(seconds: 5), () => null); // not the best solution
      }
    }
  }

  Future<String> makePostRequest(String serverAddress, String servicePath, dynamic value, {TypeHeader type = TypeHeader.json}) async {
    return _makeRequest(serverAddress, servicePath, "post", type, body: value);
  }

  Future<String> makeGetRequest(String serverAddress, String servicePath, [Map<String, String> value, TypeHeader type]) async {
    return _makeRequest(serverAddress, servicePath, "get", type, value: value);
  }

  Future<String> makePutRequest(String serverAddress, String servicePath, [Map<String, String> value, TypeHeader type]) async {
    return _makeRequest(serverAddress, servicePath, "put", type, value: value);
  }

  Future<String> makeDeleteRequest(String serverAddress, String servicePath, [Map<String, String> value, TypeHeader type]) async {
    return _makeRequest(serverAddress, servicePath, "delete", type, value: value);
  }


}