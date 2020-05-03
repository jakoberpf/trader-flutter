import 'dart:convert';
import 'dart:io';

import 'package:best_flutter_ui_templates/api/model/login_request.dart';
import 'package:http/http.dart';

class ApiClient {
  String _basePath;

  ApiClient(String basePath) {
    _basePath = basePath;
  }

  Future<Response> authenticateUser(LoginRequest loginRequest) async {
    return await _makePostRequest(
        _basePath + "/auth/signin", jsonEncode(loginRequest));
  }

  Future<Response> _makeGetRequest(String url) async {
    Response response = await get(url);
    Future.error(response);
    return Future.value(response);
  }

  Future<Response> _makePostRequest(String url, String json) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    Response response = await post(url, headers: headers, body: json);
    return Future.value(response);
  }

  Future<Response> _makePostRequestSigned(
      String url, String json, String token) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whatever
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    Response response = await post(url, headers: headers, body: json);
    return Future.value(response);
  }
}
