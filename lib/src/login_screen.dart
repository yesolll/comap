import 'dart:convert';

import 'package:comap/model/MemberInfo.dart';
import 'package:comap/src/place_list_screen.dart';
import 'package:comap/util/service/apiCall/ApiCallService.dart';
import 'package:comap/util/service/apiCall/RequestData.dart';
import 'package:comap/util/service/apiCall/type/ApiCallType.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final _nicknameController = TextEditingController();
  final _passwordController = TextEditingController();

  int responseCode = 0;
  MemberInfo memberInfo = MemberInfo(id: '', nickname: '', accessToken: '', refreshToken: '');

  Future<void> _login(String nickname, String password) async {
    late String responseStr;
    responseStr = await apiCallProtocol(
        RequestData(
            url: '/jwt/login',
            data: {'nickname':nickname, 'password':password},
            apiCallType: ApiCallType.POST,
            tokenType: false
        )
    );
    Map<String, dynamic> memberInfoStr = jsonDecode(responseStr)['response'];
    MemberInfo memberInfo = MemberInfo.fromJson(memberInfoStr);
    int responseCode = jsonDecode(responseStr)['httpCode'];

    setState(() {
      this.responseCode = responseCode;
      this.memberInfo = memberInfo;
    });
  }

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      String nickname = _nicknameController.text.trim();
      String password = _passwordController.text.trim();

      await _login(nickname, password);
      if (responseCode == 201) {
        // 로그인 API 호출
        await secureStorage.write(key: 'isLoggedIn', value: 'true');
        await secureStorage.write(key: 'nickname', value: memberInfo.nickname);
        await secureStorage.write(key: 'accessToken', value: memberInfo.accessToken);
        await secureStorage.write(key: 'refreshToken', value: memberInfo.refreshToken);
        Get.offAll(() => const PlaceListScreen());
      } else {
        _showErrorDialog();
      }
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('로그인 실패'),
        content: const Text('아이디 또는 비밀번호를 확인해주세요.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 70),
          const Text('로그인', style: TextStyle(fontSize: 32), textAlign: TextAlign.center),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nicknameController,
                    decoration: const InputDecoration(labelText: '닉네임'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '닉네임을 입력해주세요.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: '비밀번호'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '비밀번호를 입력해주세요.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: login,
                    child: const Text('로그인'),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Navigate to signup page
                    },
                    child: const Text('아직 회원가입이 되어 있지 않나요?'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}