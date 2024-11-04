import 'package:oss_qbank/services/kakao_login.dart';
import 'package:oss_qbank/view_models/login_view_model.dart';

import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _loginViewModel = LoginViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await _loginViewModel.login();
                setState(() {});
              },
              child: Image.asset('assets/images/kakao_login_medium_narrow.png'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _loginViewModel.logout();
                setState(() {});
              },
              child: const Text('아오 디자인 개빡침 버림 ㅅㄱ'),
            ),
          ],
        ),
      ),
    );
  }
}
