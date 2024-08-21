import 'package:comap/src/home_screen.dart';
import 'package:comap/src/login_screen.dart';
import 'package:comap/src/place_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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

    Future<bool> checkLoginStatus() async {
      String? nickname = await secureStorage.read(key: 'nickname');
      return nickname != null;
    }

    return GetMaterialApp(
        home: FutureBuilder(
          future: checkLoginStatus(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData && snapshot.data == true) {
                return const PlaceListScreen();
              } else {
                return const LoginScreen();
              }
            }
          },
        )
    );
  }
}
