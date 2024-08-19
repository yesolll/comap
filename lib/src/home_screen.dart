import 'package:comap/src/input_webview_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  late PageController _pageController;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

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