import 'dart:async';
import 'package:best_flutter_ui_templates/api/api.service.dart';
import 'package:best_flutter_ui_templates/api/model/token_response.dart';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  TokenResponse _currentUser;

  final ApiService _api = ApiService();

//  https://dev.to/carminezacc/user-authentication-jwt-authorization-with-flutter-and-node-176l for save storage

  Future getUser() {
    return Future.value(_currentUser);
  }

  Future logout() {
    this._currentUser = null;
    notifyListeners();
    return Future.value(_currentUser);
  }

  Future login({String email, String password}) async {
    TokenResponse tokenResponse =
        await _api.authenticateUser("admin", "gotrading")
//        .catchError(() => print("Error in API"))
        ;
    if (tokenResponse != null && tokenResponse.accessToken != null) {
      this._currentUser = tokenResponse;
      notifyListeners();
      return Future.value(_currentUser);
    } else {
      this._currentUser = null;
      return Future.value(null);
    }
  }
}
