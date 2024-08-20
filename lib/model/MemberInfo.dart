import 'package:comap/util/JsonConvertor.dart';

class MemberInfo {

  final String id;
  final String nickname;
  final String accessToken;
  final String refreshToken;

  MemberInfo({
    required this.id,
    required this.nickname,
    required this.accessToken,
    required this.refreshToken,
  });

  factory MemberInfo.fromJson(Map<String, dynamic> json) {
    return new MemberInfo(
      id: getJsonData(json['id'], 1, ""),
      nickname: getJsonData(json['nickname'], 1, ""),
      accessToken: getJsonData(json['accessToken'], 1, ""),
      refreshToken: getJsonData(json['refreshToken'], 1, ""),
    );
  }

  @override
  String toString() {
    String str = "";
    str =   '''
            id: $id,
            nickname: $nickname,
            accessToken: $accessToken,
            refreshToken: $refreshToken,
            ''';
    return str;
  }

}