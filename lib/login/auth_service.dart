import 'dart:async';
import 'package:best_flutter_ui_templates/api/api_service.dart';
import 'package:best_flutter_ui_templates/api/model/auth/login_response.dart';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {

  final ApiService _api = ApiService();

  LoginResponse _currentUser;

//  https://dev.to/carminezacc/user-authentication-jwt-authorization-with-flutter-and-node-176l for save storage // TODO

  Future getUser() {
    return Future.value(_currentUser);
  }

  Future logout() {
    this._currentUser = null;
    this._api.setAuthentication(null);
    notifyListeners();
    return Future.value(_currentUser);
  }

  Future login({String email, String password}) async {
    LoginResponse tokenResponse =
        await _api.authenticateUser("admin", "gotrading")
//        .catchError(() => print("Error in API"))
        ;
    if (tokenResponse != null && tokenResponse.accessToken != null) {
      this._currentUser = tokenResponse;
      this._api.setAuthentication(_currentUser.accessToken);
      notifyListeners();
      return Future.value(_currentUser);
    } else {
      this._currentUser = null;
      this._api.setAuthentication(null);
      return Future.value(null);
    }
  }
}
