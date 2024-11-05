import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oss_qbank/src/views/login_view.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // 로딩 인디케이터 표시
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData) {
            // 로그인 안 된 경우
            return const LoginView();
          } else {
            // 로그인 된 경우 환영 메시지 출력
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("${snapshot.data?.displayName}님 환영합니다."),
                  ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                    },
                    child: const Text("로그아웃"),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
