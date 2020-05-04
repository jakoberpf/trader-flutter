import 'dart:convert';

import 'package:best_flutter_ui_templates/api/api_client.dart';
import 'package:best_flutter_ui_templates/api/model/auth/login_request.dart';
import 'package:http/http.dart';

import 'api_exceptions.dart';
import 'model/auth/login_response.dart';

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
