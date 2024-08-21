import 'dart:ui_web' as uiWeb;
import 'dart:html' as html;

import 'package:flutter/material.dart';

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
    super.initState();

    print(getUrl(widget.x!, widget.y!));
    uiWeb.platformViewRegistry.registerViewFactory(
      'input-webview',
          (int viewId) => html.IFrameElement()
        ..style.width = '100%'
        ..style.height = '100%'
        ..src = getUrl(widget.x!, widget.y!),
    );
  }

  @override
  void dispose() {
    uiWeb.platformViewRegistry.registerViewFactory('input-webview', ()=>{});
    super.dispose();
  }

  String getUrl(String x, String y) {
    return 'assets/map_view.html?x=$x&y=$y';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('맛집 찾기'),
      ),
      body: HtmlElementView(
        viewType: 'input-webview',
      ),
    );
  }
}