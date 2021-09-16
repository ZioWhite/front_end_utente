import 'package:flutter/material.dart';

class Constants {
  // app info
  static final String APP_VERSION = "0.0.1";
  static final String APP_NAME = "Donor";

  // addresses
  static final String ADDRESS_STORE_SERVER = "http://localhost:8081";
  static final String ADDRESS_AUTHENTICATION_SERVER = "http://localhost:8080";

  // authentication
  static final String REALM = "PiattaformaPrenotazioni";
  static final String CLIENT_ID = "myclient";
  static final String CLIENT_SECRET = "5f84da5f-6a81-4f5b-a73a-b305f7eebef7";
  static final String REQUEST_LOGIN = "/auth/realms/" + REALM + "/protocol/openid-connect/token";
  static final String REQUEST_LOGOUT = "/auth/realms/" + REALM + "/protocol/openid-connect/logout";

  // requests
  static final String REQUEST_SEARCH_DONOR_BY_CODE = "/donatori/searchbycode";
  static final String REQUEST_SEARCH_BOOKING_BY_DONOR = "/prenotazioni/search";
  static final String REQUEST_SEARCH_DONATION = "/donazioni/search";
  static final String REQUEST_SEARCH_TURNI = "/turni/search";
  static final String REQUEST_NEW_BOOKING = "/prenotazioni/new";
  static final String REQUEST_SEARCH_BRANCHES = "/sedi/search";
  static final String REQUEST_ADD_USER = "/users";

  // states
  static final String STATE_CLUB = "club";

  // responses
  static final String RESPONSE_ERROR_MAIL_USER_ALREADY_EXISTS = "ERROR_MAIL_USER_ALREADY_EXISTS";

  // messages
  static final String MESSAGE_CONNECTION_ERROR = "connection_error";

}