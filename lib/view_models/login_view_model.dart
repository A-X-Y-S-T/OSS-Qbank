import 'package:oss_qbank/services/social_login.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class LoginViewModel {
  final SocialLogin _socialLogin;
  bool isLogined = false;
  User? user;

  LoginViewModel(this._socialLogin);

  Future<void> login() async {
    isLogined = await _socialLogin.login();

    if (isLogined) {
      user = await UserApi.instance.me();
    }
  }

  Future<void> logout() async {
    await _socialLogin.logout();
    isLogined = false;
    user = null;
  }
}
