import 'package:comap/model/Place.dart';
import 'package:comap/util/PopupUtil.dart';
import 'package:comap/widget/common_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:js' if (dart.library.io) '../util/common_err.dart' as js;

class PlaceRowWidget extends StatefulWidget {

  final Place place;

  const PlaceRowWidget({
    super.key,
    required this.place
  });

  @override
  State<PlaceRowWidget> createState() => _PlaceRowState();

}

class _PlaceRowState extends State<PlaceRowWidget> {

  Future<void> showAddrSearch(String x, String y) async {
    await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return pcPopup(
        x: x,
        y: y,
      );
    });
    //     .then((value) =>
    // {js.context.callMethod("aa_close")});
  }

  @override
  Widget build(BuildContext context) {
    Place place = widget.place;
    return SizedBox(
        width: MediaQuery.of(context).size.width / 1.1,
        height: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(place.placeName, style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff222222))),
            Text(place.categoryName, style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff222222))),
            Text(place.phone, style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff222222))),
            Text(place.roadAddressName, style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff222222))),
            TextButton(onPressed: () async {
              await showAddrSearch(place.x, place.y);
            }, child: Text("위치 보기")),
            const LineWg(),
          ],
        )
    );
  }
}