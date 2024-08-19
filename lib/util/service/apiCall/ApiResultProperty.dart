// API 응답 포맷
class ApiResultProperty {
  late int status;
  late String message;
  late Map<String, dynamic> data;

  ApiResultProperty(this.status, String message, Map<String, dynamic> data);
}
