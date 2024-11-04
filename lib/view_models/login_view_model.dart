import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:oss_qbank/services/social_login.dart';

class LoginViewModel extends ChangeNotifier {
  final SocialLogin _socialLogin;
  bool isLogined = false;
  User? user;

  LoginViewModel(this._socialLogin);

  Future<void> login() async {
    isLogined = await _socialLogin.login();

    if (isLogined) {
      user = await UserApi.instance.me();
      notifyListeners(); // 상태가 변경되었음을 알림
    }
  }

  Future<void> logout() async {
    await _socialLogin.logout();
    isLogined = false;
    user = null;
    notifyListeners(); // 상태가 변경되었음을 알림
  }
}
