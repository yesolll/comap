import 'dart:convert';

import 'package:comap/util/service/apiCall/ApiResultProperty.dart';
import 'package:comap/util/service/apiCall/RequestData.dart';
import 'package:comap/util/service/apiCall/ResponseData.dart';
import 'package:comap/util/service/apiCall/type/ApiCallType.dart';
import 'package:comap/util/service/apiCall/type/StorageValueType.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

Future<String> apiCallProtocol(RequestData requestData) async {

  const apiCallHeader = {
    'Accept': '*/*',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Credentials': 'true',
    'Access-Control-Allow-Headers': 'Origin, Content-Type, Accept, Authorization',
    'Access-Control-Allow-Methods': 'GET, PUT, POST, DELETE, OPTIONS',
    'Access-Control-Max-Age': '1000',
    'Content-Type': 'application/json; charset=utf-8'
  };

  if (requestData.tokenType == true) {
    apiCallHeader.addAll({'Authorization': requestData.accessToken!});
  }

  late http.Response response;

  // TODO URL
  switch (requestData.apiCallType) {
    case ApiCallType.GET:
      response = await http.get(
                  Uri.http('localhost:13080', requestData.url, requestData.data),
                  headers: apiCallHeader,
              ).timeout(const Duration(seconds: 30));
    case ApiCallType.POST:
      response = await http.post(
                Uri.http('localhost:13080', requestData.url),
                body: json.encode(requestData.data),
                headers: apiCallHeader,
              ).timeout(const Duration(seconds: 30));
    case ApiCallType.PUT:
      response = await http.put(
                Uri.http('localhost:13080', requestData.url),
                body: json.encode(requestData.data),
                headers: apiCallHeader,
              ).timeout(const Duration(seconds: 30));
    case ApiCallType.DELETE:
      response = await http.delete(
                Uri.http('localhost:13080', requestData.url),
                headers: apiCallHeader,
              ).timeout(const Duration(seconds: 30));
    case ApiCallType.PATCH:
      response = await http.patch(
                Uri.http('localhost:13080', requestData.url),
                body: json.encode(requestData.data),
                headers: apiCallHeader,
              ).timeout(const Duration(seconds: 30));
  }
  String responseStr = utf8.decode(response.bodyBytes);

  return responseStr;
}

Future<ApiResultProperty> ApiCall (RequestData requestData) async {
  var response = {

  };
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  String? accessToken = await secureStorage.read(key: StorageValueType.accessToken.name);

  // Future<http.Response> protocolResult = (await apiCallProtocol(requestData)) as Future<http.Response>;
  //
  // try {
  // if (protocolResult.status === ApiSuccessCodeType.GET) {
  // return CreateConnectData(protocolResult);
  // }
  // } catch (e) {
  // throw new NotFetchDataException();
  // };
  // throw new NotFetchDataException();
  return createConnectData(response);
}