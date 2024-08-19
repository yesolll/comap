
import 'package:comap/util/service/apiCall/ApiResultProperty.dart';

ApiResultProperty connectFailData = ApiResultProperty(400, "연결실패", {});

ApiResultProperty createConnectData(response) {
  if (
    response.data.status.runtimeType != int ||
    response.data.message.runtimeType != String
  ) {
    return connectFailData;
  }

  return ApiResultProperty(
    response.data.status,
    response.data.message,
    response.data.data
  );
}