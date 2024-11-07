import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart' as kakao;
import 'package:uuid/uuid.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  Future<UserCredential> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;

      if (googleAuth?.accessToken == null || googleAuth?.idToken == null) {
        throw Exception(
            "Google login failed: Missing access token or ID token");
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      debugPrint("Google Sign-In Error: $e");
      rethrow; // or handle the error accordingly
    }
  }

  Future<UserCredential> signInWithKakao() async {
    final clientState = Uuid().v4();
    final url = Uri.https('kauth.kakao.com', '/oauth/authorize', {
      'response_type': 'code',
      'client_id': "f6249631196c92ecbff2608c8e88e6d2",
      'response_mode': 'form_post',
      'redirect_uri':
          'https://mixolydian-rainy-xylocarp.glitch.me/callbacks/kakao/sigin_in',
      'state': clientState,
    });

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(),
        callbackUrlScheme: "webauthcallback"); //"applink"//"signinwithapple"
    final body = Uri.parse(result).queryParameters;
    print(body["code"]);

    final tokenUrl = Uri.https('kauth.kakao.com', '/oauth/token', {
      'grant_type': 'authorization_code',
      'client_id': "f6249631196c92ecbff2608c8e88e6d2",
      'redirect_uri':
          'https://mixolydian-rainy-xylocarp.glitch.me/callbacks/kakao/sigin_in',
      'code': body["code"],
    });
    var responseTokens = await http.post(tokenUrl);
    Map<String, dynamic> bodys = json.decode(responseTokens.body);
    var response = await http.post(
      Uri.parse(
          "https://mixolydian-rainy-xylocarp.glitch.me/callbacks/kakao/token"),
      body: {"accessToken": bodys['access_token']},
    );
    return FirebaseAuth.instance.signInWithCustomToken(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("로그인"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                try {
                  await signInWithGoogle();
                  // 로그인 성공 후 UI 처리
                } catch (e) {
                  // 로그인 실패 처리
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Google 로그인 오류"),
                        content: Text("오류 발생: $e"),
                        actions: <Widget>[
                          TextButton(
                            child: Text("확인"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text("Google"),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await signInWithKakao();
                  // 로그인 성공 후 UI 처리
                } catch (e) {
                  // 로그인 실패 처리
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Kakao 로그인 오류"),
                        content: Text("오류 발생: $e"),
                        actions: <Widget>[
                          TextButton(
                            child: Text("확인"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text("Kakao"),
            ),
          ],
        ),
      ),
    );
  }
}
