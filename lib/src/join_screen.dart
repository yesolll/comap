import 'dart:convert';

import 'package:comap/src/login_screen.dart';
import 'package:comap/util/service/apiCall/ApiCallService.dart';
import 'package:comap/util/service/apiCall/RequestData.dart';
import 'package:comap/util/service/apiCall/type/ApiCallType.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});

  @override
  _JoinScreenState createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {

  final _formKey = GlobalKey<FormState>();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final _emailController = TextEditingController();
  final _nicknameController = TextEditingController();
  final _passwordController = TextEditingController();

  int responseCode = 0;
  Future<void> _join(String email, String nickname, String password) async {
    late String responseStr;
    responseStr = await apiCallProtocol(
        RequestData(
            url: '/api/v1/member/join',
            data: {'email':email, 'nickname':nickname, 'password':password},
            apiCallType: ApiCallType.POST,
            tokenType: false
        )
    );
    int responseCode = jsonDecode(responseStr)['httpCode'];

    setState(() {
      this.responseCode = responseCode;
    });
  }

  Future<void> join() async {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String nickname = _nicknameController.text.trim();
      String password = _passwordController.text.trim();

      await _join(email, nickname, password);
      if (responseCode == 201) {
        _showDialog('회원가입 성공', '인증메일이 발송되었습니다.');
      } else {
        _showDialog('회원가입 실패', '입력값을 확인하세요.');
      }
    }
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
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
          const Text('회원가입', style: TextStyle(fontSize: 32), textAlign: TextAlign.center),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: '이메일'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '이메일을 입력해주세요.';
                      }
                      return null;
                    },
                  ),
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
                    onPressed: join,
                    child: const Text('회원가입'),
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