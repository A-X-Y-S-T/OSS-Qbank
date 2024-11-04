import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';

import 'package:oss_qbank/view_models/login_view_model.dart';
import 'package:oss_qbank/services/kakao_login.dart';
import 'package:oss_qbank/views/login_view.dart';
import 'package:oss_qbank/views/main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: '1f855e753726dc188a4ff1be335db17e');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginViewModel(KakaoLogin()),
        ),
      ],
      child: MaterialApp(
        title: 'Your App Title',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, loginViewModel, child) {
        if (loginViewModel.isLoading) {
          return Center(child: CircularProgressIndicator()); // 로딩 중인 경우
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
