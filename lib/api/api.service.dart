import 'dart:convert';

import 'package:best_flutter_ui_templates/api/api.client.dart';
import 'package:best_flutter_ui_templates/api/model/login_request.dart';
import 'package:http/http.dart';

import 'api.exceptions.dart';
import 'model/token_response.dart';

class ApiService {
  ApiClient _apiClientImpl;

  ApiService() {
    _apiClientImpl = ApiClient("http://localhost/api");
  }

  Future<TokenResponse> authenticateUser(
      String username, String password) async {
    LoginRequest loginRequest = new LoginRequest(username, password);
    Response response = await _apiClientImpl.authenticateUser(loginRequest);
    if (_getException(response) != null) {
      return Future.error(_getException(response));
    } else {
      TokenResponse tokenResponse;
      print(jsonDecode(response.body));
      tokenResponse = TokenResponse.fromJson(jsonDecode(response.body));
      return Future.value(tokenResponse);
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
