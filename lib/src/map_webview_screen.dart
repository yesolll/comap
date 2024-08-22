import 'dart:ui_web' as uiWeb;
import 'dart:html' as html;

import 'package:comap/src/place_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MapWebView extends StatefulWidget {
  String? x;
  String? y;

  MapWebView({super.key,
     this.x,
     this.y,
  });

  @override
  State<MapWebView> createState() => _MapWebViewState();
}

class _MapWebViewState extends State<MapWebView> {

  @override
  void initState() {

    print(getUrl(widget.x!, widget.y!));
    uiWeb.platformViewRegistry.registerViewFactory(
      'input-webview${widget.x}',
          (int viewId) => html.IFrameElement()
        ..style.width = '100%'
        ..style.height = '100%'
        ..src = getUrl(widget.x!, widget.y!),
    );

    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  String getUrl(String x, String y) {
    return 'assets/map_view.html?x=$x&y=$y';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {setState(() {});Get.offAll(() => const PlaceListScreen());}, icon: Icon(Icons.menu)),
          title: Text('맛집 찾기'),
      ),
      body: HtmlElementView(
        viewType: 'input-webview${widget.x}',
      ),
    );
  }
}