
String getJsonData(dynamic json, int type, String nilStr) {
  if (json == null || json == "") {
    if (type == 0) {
      return "0";
    } else {
      return nilStr;
    }
  } else {
    return json.toString();
  }
}