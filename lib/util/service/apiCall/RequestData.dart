

import 'package:comap/util/service/apiCall/type/ApiCallType.dart';

class RequestData {
  String url;
  ApiCallType apiCallType;
  dynamic? data;
  bool tokenType;
  String? accessToken;

  RequestData({
    required this.url,
    required this.apiCallType,
    this.data,
    required this.tokenType,
    this.accessToken,
  });
}