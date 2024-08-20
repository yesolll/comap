import 'package:comap/model/Place.dart';
import 'package:comap/widget/common_widget.dart';
import 'package:flutter/cupertino.dart';

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

  @override
  Widget build(BuildContext context) {
    Place place = widget.place;
    return SizedBox(
        width: MediaQuery.of(context).size.width / 1.1,
        height: 100,
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
            const LineWg(),
          ],
        )
    );
  }
}