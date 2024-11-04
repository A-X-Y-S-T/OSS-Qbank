import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:oss_qbank/services/social_login.dart';

class LoginViewModel extends ChangeNotifier {
  final SocialLogin _socialLogin;
  bool isLogined = false;
  User? user;

  LoginViewModel(this._socialLogin) {
    _checkKakaoToken(); // 생성자에서 토큰 유효성 검사 시작
  }

  Future<void> _checkKakaoToken() async {
    if (await AuthApi.instance.hasToken()) {
      try {
        AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
        print('토큰 유효: ${tokenInfo.id}, ${tokenInfo.expiresIn}');

        // 유효한 토큰일 경우 사용자 정보 가져오기
        user = await UserApi.instance.me();
        isLogined = true;
      } catch (error) {
        print('토큰 오류 발생: $error');
        isLogined = false;
      }
    } else {
      print('발급된 토큰 없음');
      isLogined = false;
    }
    notifyListeners(); // 상태 변경 알림
  }

  Future<void> login() async {
    isLogined = await _socialLogin.login();
    if (isLogined) {
      user = await UserApi.instance.me();
    }
    notifyListeners();
  }

  Future<void> logout() async {
    await _socialLogin.logout();
    isLogined = false;
    user = null;
    notifyListeners();
  }
}
