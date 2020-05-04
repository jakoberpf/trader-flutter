import 'dart:convert';

import 'package:best_flutter_ui_templates/api/api_client.dart';
import 'package:best_flutter_ui_templates/api/model/auth/login_request.dart';
import 'package:best_flutter_ui_templates/api/model/trader/add_trader_request.dart';
import 'package:http/http.dart';

import 'api_exceptions.dart';
import 'model/auth/login_response.dart';
import 'model/common/message_response.dart';

class ApiService {
  ApiClient _apiClient;
  String _apiToken;

  ApiService() {
    _apiClient = ApiClient("http://localhost/api");
  }

  setAuthentication(String token) {
    _apiToken = token;
    print("Authentication: " + token);
  }

  Future<LoginResponse> authenticateUser(
      String username, String password) async {
    LoginRequest loginRequest = new LoginRequest(username, password);
    Response response = await _apiClient.authenticateUser(loginRequest);
    if (_getException(response) != null) {
      return Future.error(_getException(response));
    } else {
      LoginResponse tokenResponse;
      print(jsonDecode(response.body));
      tokenResponse = LoginResponse.fromJson(jsonDecode(response.body));
      return Future.value(tokenResponse);
    }
  }

  // TODO sign up User

  // TODO remove User

//  Future<MessageResponse> addUser(
//      String username, String password) async {
//    LoginRequest loginRequest = new LoginRequest(username, password);
//    Response response = await _apiClient.authenticateUser(loginRequest);
//    if (_getException(response) != null) {
//      return Future.error(_getException(response));
//    } else {
//      LoginResponse tokenResponse;
//      print(jsonDecode(response.body));
//      tokenResponse = LoginResponse.fromJson(jsonDecode(response.body));
//      return Future.value(tokenResponse);
//    }
//  }

  Future<MessageResponse> addTrader(
      String userId,
      String username,
      String exchange,
      String market,
      String interval,
      String strategy,
      String isLive,
      String isIn,
      double budget) async {
    AddTraderRequest addTraderRequest = new AddTraderRequest(userId, username,
        exchange, market, interval, strategy, isLive, isIn, budget);
    Response response = await _apiClient.addTrader(addTraderRequest, _apiToken);
    if (_getException(response) != null) {
      return Future.error(_getException(response));
    } else {
      MessageResponse messageResponse;
      print(jsonDecode(response.body));
      messageResponse = MessageResponse.fromJson(jsonDecode(response.body));
      return Future.value(messageResponse);
    }
  }

  AppException _getException(Response response) {
    switch (response.statusCode) {
      case 200:
        return null;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
