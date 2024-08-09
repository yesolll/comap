import 'package:comap/src/input_webview_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'dart:js' if (dart.library.io) '../util/common_err.dart' as js;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  late PageController _pageController;
  // late TabController _tabController;
  int _page = 0;

  @override
  void initState() {
    _pageController = PageController();
    // _tabController = TabController(length: group.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    // _tabController.dispose();
    super.dispose();
  }

  _openPayWeb_moka() async {
    js.context.callMethod("bb");
  }

  @override
  Widget build(BuildContext context) {

    // Set<Marker> markers = {};
    KakaoMapController mapController;

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showWebView(context),
          child: Text('맛집 찾으러 가기'),
        ),
      ),
    );
  }

  Future<void> _showWebView(BuildContext context) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => InputWebView()));
  }
}