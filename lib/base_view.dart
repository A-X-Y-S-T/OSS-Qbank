import 'package:flutter/material.dart';

import 'package:oss_qbank/views/main_view.dart';
import 'package:oss_qbank/views/login_view.dart';
import 'package:oss_qbank/view_models/login_view_model.dart';
import 'package:oss_qbank/services/kakao_login.dart';

import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // MultiProvider를 사용하여 여러 Provider를 등록
      providers: [
        ChangeNotifierProvider(
          // LoginViewModel을 Provider로 등록
          create: (_) => LoginViewModel(KakaoLogin()),
        ),
      ],
      child: MaterialApp(
        title: 'Your App Title', // 앱 제목
        theme: ThemeData(
          primarySwatch: Colors.blue, // 기본 테마 색상
        ),
        home: const HomeScreen(), // 기본 홈 화면 설정
      ),
    );
  }
}

/// 기본 홈 화면
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      // LoginViewModel을 사용하여 상태를 구독
      builder: (context, loginViewModel, child) {
        // 로딩 중인 경우
        if (loginViewModel.isLoading) {
          return const Center(
              child: CircularProgressIndicator()); // 로딩 인디케이터 표시
        }

        // 로그인 상태에 따라 화면 전환
        if (loginViewModel.isLogined) {
          return const MainView(); // 로그인된 상태면 MainView로
        } else {
          return const LoginView(); // 로그인되지 않은 상태면 LoginView로
        }
      },
    );
  }
}
