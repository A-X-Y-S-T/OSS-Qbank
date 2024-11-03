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
  final LoginViewModel viewModel = LoginViewModel(KakaoLogin());

  @override
  void initState() {
    super.initState();
    _checkTokenValidity(); // 앱 실행 시 토큰 유효성 검사
  }

  // 토큰의 유효성을 확인하고 사용자 정보를 가져오는 메서드
  Future<void> _checkTokenValidity() async {
    if (await AuthApi.instance.hasToken()) {
      try {
        AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
        print('토큰 유효: ${tokenInfo.id}, ${tokenInfo.expiresIn}');

        // 토큰이 유효할 경우 사용자 정보를 가져와서 로그인 상태 설정
        viewModel.user = await UserApi.instance.me();
        viewModel.isLogined = true;
      } catch (error) {
        if (error is KakaoException && error.isInvalidTokenError()) {
          print('토큰 만료 $error');
          viewModel.isLogined = false; // 토큰이 만료된 경우 로그인 상태 설정
        } else {
          print('토큰 정보 조회 실패 $error');
          viewModel.isLogined = false; // 다른 에러 발생 시 로그인 상태 설정
        }
      }
    } else {
      print('발급된 토큰 없음');
      viewModel.isLogined = false; // 토큰이 없는 경우 로그인 상태 설정
    }

    setState(() {}); // UI 업데이트
  }

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
            if (viewModel.user != null)
              Image.network(
                  viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
            Text(
              'Logged In: ${viewModel.isLogined}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () async {
                await viewModel.login();
                setState(() {});
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () async {
                await viewModel.logout();
                setState(() {});
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
