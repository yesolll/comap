import 'package:comap/src/home_screen.dart';
import 'package:comap/src/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  AuthRepository.initialize(
    appKey: dotenv.env['KAKAO_MAP_APP_KEY_JS'] ?? '',
    baseUrl: 'http://localhost:10030'
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Future<bool> _checkLoginStatus() async {
      String? isLoggedIn = await secureStorage.read(key: 'isLoggedIn');
      return isLoggedIn == 'true';
    }

    return GetMaterialApp(
        home: FutureBuilder(
          future: _checkLoginStatus(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData && snapshot.data == true) {
                return HomeScreen();
              } else {
                return LoginScreen();
              }
            }
          },
        )
    );
  }
}
