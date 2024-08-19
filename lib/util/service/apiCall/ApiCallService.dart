import 'package:comap/util/service/apiCall/ApiResultProperty.dart';
import 'package:comap/util/service/apiCall/ResponseData.dart';
import 'package:comap/util/service/apiCall/type/StorageValueType.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<ApiResultProperty> ApiCall (requestData) async {
  var response = {

  };

  String? value = await const FlutterSecureStorage().read(key: StorageValueType.accessToken.name);
  // final refreshToken = await storage.read();
  // await waitUntil(() => window.validToken === true);

  // const accessToken = await localStorage.getItem(StorageValue.AccessToken) || '';
  // const protocolResult = await ApiCallProtocol({ url, type, data, tokenType, accessToken });
  //
  // try {
  // if (protocolResult.status === ApiSuccessCodeType.GET) {
  // /**
  //  * TODO: 토근 만료 코드 확인 후 인터페이스 함수 호출
  //  * TODO: 호출 타입 별 성공코드 맞는지 판별 (GET, POST, PUT, DELETE)
  //  */
  // return CreateConnectData(protocolResult);
  // }
  // } catch (e) {
  // throw new NotFetchDataException();
  // };
  // throw new NotFetchDataException();
  return createConnectData(response);
}