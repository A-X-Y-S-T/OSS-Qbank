import 'package:oss_qbank/services/social_login.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

///Kakao Login
class KakaoLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        print("Kakaotalk is installed.");
        try {
          await UserApi.instance.loginWithKakaoTalk();
          print("Logined with Kakao.");
          return true;
        } catch (error) {
          print("Fail to login with Kakao.");
          return false;
        }
      } else {
        try {
          await UserApi.instance.loginWithKakaoAccount();
          return true;
        } catch (error) {
          return false;
        }
      }
    } catch (error) {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      print('연결 끊기 성공, SDK에서 토큰 삭제');
      return true;
    } catch (error) {
      print('연결 끊기 실패 $error');
      return false;
    }
  }
}
