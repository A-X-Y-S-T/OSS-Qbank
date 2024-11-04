import 'package:flutter/material.dart';
import 'package:oss_qbank/views/login_view.dart';
import 'package:provider/provider.dart';

import 'package:oss_qbank/view_models/login_view_model.dart';

/// 프로필 페이지
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            child: ListTile(
              leading: Consumer<LoginViewModel>(
                builder: (context, loginViewModel, child) {
                  return ClipOval(
                    child: Image.network(
                      loginViewModel
                              .user?.kakaoAccount?.profile?.profileImageUrl ??
                          '',
                      width: 50, // 원하는 너비 설정
                      height: 50, // 원하는 높이 설정
                      cacheHeight: 50,
                      cacheWidth: 50,
                      fit: BoxFit.cover, // 이미지를 박스에 맞춰 잘라냄
                    ),
                  );
                },
              ),
              title: Consumer<LoginViewModel>(
                builder: (context, loginViewModel, child) {
                  return Text(
                      loginViewModel.user?.kakaoAccount?.profile?.nickname ??
                          '');
                },
              ),
              subtitle: Consumer<LoginViewModel>(
                builder: (context, loginViewModel, child) {
                  return Text(loginViewModel.user?.kakaoAccount?.email ??
                      'email is not found.');
                },
              ),
              trailing: Consumer<LoginViewModel>(
                builder: (context, loginViewModel, child) {
                  return ElevatedButton(
                    onPressed: () {
                      loginViewModel.logout();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()),
                      );
                    },
                    child: const Text("로그아웃"),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
