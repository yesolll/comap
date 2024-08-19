import 'package:comap/src/home_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Future<void> _showWebView(BuildContext context) {
  //   return Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => InputWebView()));
  // }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text.trim();
      String password = _passwordController.text.trim();

      // TODO: Replace with your actual login logic
      if (username == 'admin' && password == 'password') {
        await secureStorage.write(key: 'isLoggedIn', value: 'true');
        await secureStorage.write(key: 'userName', value: '예쏠');
        Get.offAll(() => const HomeScreen());
        // _showWebView(context);
      } else {
        _showErrorDialog();
      }
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('로그인 실패'),
        content: Text('아이디 또는 비밀번호를 확인해주세요.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('확인'),
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
          SizedBox(height: 70),
          Text('로그인', style: TextStyle(fontSize: 32), textAlign: TextAlign.center),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(labelText: '아이디'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '아이디를 입력해주세요.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: '비밀번호'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '비밀번호를 입력해주세요.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _login,
                    child: Text('로그인'),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Navigate to signup page
                    },
                    child: Text('아직 회원가입이 되어 있지 않나요?'),
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