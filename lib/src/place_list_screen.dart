import 'dart:convert';
import 'package:comap/model/Place.dart';
import 'package:comap/util/service/apiCall/ApiCallService.dart';
import 'package:comap/util/service/apiCall/RequestData.dart';
import 'package:comap/util/service/apiCall/type/ApiCallType.dart';
import 'package:comap/widget/place_row_widget.dart';
import 'package:flutter/material.dart';

class PlaceListScreen extends StatefulWidget {
  const PlaceListScreen({super.key});

  @override
  PlaceListState createState() => PlaceListState();
}

class PlaceListState extends State<PlaceListScreen> {

  bool isLoading = true;
  List<Place> places = [];

  @override
  void initState() {
    _getPlaces();
  }

  void _getPlaces() async {
    late String responseStr;
    responseStr = await apiCallProtocol(
        RequestData(
            url: '/api/v1/place/search',
            data: {'query':'', 'categoryGroupCode':'FD6', 'x': '127.107858', 'y':'37.402718'},
            apiCallType: ApiCallType.GET,
            tokenType: false
        )
    );
    List parsedList = jsonDecode(responseStr)['documents'];

    setState(() {
      places = parsedList.map((val) =>  Place.fromJson(val)).toList();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16,15,0,15),
            child: Row(
              children: [
                places.isNotEmpty?
                Column(
                children:
                  places.map((placeItem) => PlaceRowWidget(
                    place: placeItem,
                  )).toList(),
                ) : const Text("텅!"),
              ],
            )
          )
      )
    );
  }
}