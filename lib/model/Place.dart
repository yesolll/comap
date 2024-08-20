import 'package:comap/util/JsonConvertor.dart';

class Place {

  final String id;
  final String placeName;
  final String categoryName;
  final String categoryGroupCode;
  final String categoryGroupName;
  final String phone;
  final String addressName;
  final String roadAddressName;
  final String x;
  final String y;
  final String placeUrl;
  final String distance;

  Place({
    required this.id,
    required this.placeName,
    required this.categoryName,
    required this.categoryGroupCode,
    required this.categoryGroupName,
    required this.phone,
    required this.addressName,
    required this.roadAddressName,
    required this.x,
    required this.y,
    required this.placeUrl,
    required this.distance,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return new Place(
        id: getJsonData(json['id'], 1, ""),
        placeName: getJsonData(json['placeName'], 1, ""),
        categoryName: getJsonData(json['categoryName'], 1, ""),
        categoryGroupCode: getJsonData(json['categoryGroupCode'], 1, ""),
        categoryGroupName: getJsonData(json['categoryGroupName'], 1, ""),
        phone: getJsonData(json['phone'], 1, ""),
        addressName: getJsonData(json['addressName'], 1, ""),
        roadAddressName: getJsonData(json['roadAddressName'], 1, ""),
        x: getJsonData(json['x'], 1, ""),
        y: getJsonData(json['y'], 1, ""),
        placeUrl: getJsonData(json['placeUrl'], 1, ""),
        distance: getJsonData(json['distance'], 1, ""),
    );
  }

  @override
  String toString() {
    String str = "";
    str =   '''
            id: $id,
            placeName: $placeName,
            categoryName: $categoryName,
            categoryGroupCode: $categoryGroupCode,
            categoryGroupName: $categoryGroupName,
            phone: $phone,
            addressName: $addressName,
            roadAddressName: $roadAddressName,
            x: $x
            y,: $y
            placeUrl,: $placeUrl,
            distance: $distance
            ''';
    return str;
  }

}