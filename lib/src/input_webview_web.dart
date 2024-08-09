import 'dart:ui_web' as uiWeb;
import 'dart:html' as html;

import 'package:flutter/material.dart';

class InputWebView extends StatefulWidget {
  const InputWebView({super.key});

  @override
  State<InputWebView> createState() => _InputWebViewState();
}

class _InputWebViewState extends State<InputWebView> {
  @override
  void initState() {
    super.initState();
    uiWeb.platformViewRegistry.registerViewFactory(
      'input-webview',
          (int viewId) => html.IFrameElement()
        ..style.width = '100%'
        ..style.height = '100%'
        ..src = 'assets/map_view.html'
        ..style.border = 'none',
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('맛집 찾기')),
      body: HtmlElementView(
        viewType: 'input-webview',
      ),
    );
  }
}