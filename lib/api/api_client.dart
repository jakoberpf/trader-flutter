import 'dart:convert';
import 'dart:io';

import 'package:best_flutter_ui_templates/api/model/auth/login_request.dart';
import 'package:http/http.dart';

import 'model/trader/add_trader_request.dart';
import 'model/trader/remove_trader_request.dart';
import 'model/trader/trader_request.dart';
import 'model/trader/traders_request.dart';

class ApiClient {
  String _basePath;

  ApiClient(String basePath) {
    _basePath = basePath;
  }

  Future<Response> authenticateUser(LoginRequest loginRequest) async {
    return await _makePostRequest(
        _basePath + "/auth/signin", jsonEncode(loginRequest));
  }

  Future<Response> addTrader(
      AddTraderRequest addTraderRequest, String token) async {
    return await _makePostRequestSigned(
        _basePath + "/trader/addTrader", jsonEncode(addTraderRequest), token);
  }

  Future<Response> getTrader(TraderRequest traderRequest, String token) async {
    return await _makePostRequestSigned(
        _basePath + "/trader/getTrader", jsonEncode(traderRequest), token);
  }

  Future<Response> getTraders(
      TradersRequest tradersRequest, String token) async {
    return await _makePostRequestSigned(
        _basePath + "/trader/getTraders", jsonEncode(tradersRequest), token);
  }

  Future<Response> removeTrader(
      RemoveTraderRequest removeTraderRequest, String token) async {
    return await _makePostRequestSigned(_basePath + "/trader/removeTrader",
        jsonEncode(removeTraderRequest), token);
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
