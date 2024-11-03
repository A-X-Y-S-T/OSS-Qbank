import 'package:oss_qbank/services/social_login.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

///Kakao Login
class KakaoLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    if (await isKakaoTalkInstalled()) {
      //카카오톡이 설치되어 있으면 카카오톡으로 로그인 + 토큰생성
      print("Kakaotalk is installed.");
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        print("Logined with Kakao. ${token.accessToken}");
        return true;
      } catch (error) {
        print("Fail to login with Kakao. $error");
        return false;
      }
    } else {
      //카카오톡이 설치되어있지 않으면 카카오계정으로 로그인 + 토큰생성
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        print("Logined with KakaoAccount. ${token.accessToken}");
        return true;
      } catch (error) {
        print("Fail to login with KakaoAccount. $error");
        return false;
      }
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
