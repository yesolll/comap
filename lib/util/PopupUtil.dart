import 'package:comap/src/map_webview_screen.dart';
import 'package:flutter/cupertino.dart';

class pcPopup extends StatelessWidget {
  final String x;
  final String y;

  pcPopup({
    this.x = "127.049761",
    this.y = "37.293188",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500,
        height: 375,
        child: MapWebView(
          x: x, y: y
        )
    );
  }
}