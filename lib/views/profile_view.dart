import 'package:flutter/material.dart';

import 'package:oss_qbank/views/login_view.dart';
import 'package:oss_qbank/view_models/login_view_model.dart';

import 'package:provider/provider.dart';

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
          ListTile(
            leading: Consumer<LoginViewModel>(
              builder: (context, loginViewModel, child) {
                // 프로필 이미지 URL을 가져옴
                final profileImageUrl = loginViewModel
                        .user?.kakaoAccount?.profile?.profileImageUrl ??
                    '';

                return ClipOval(
                  child: Image.network(
                    profileImageUrl, // 프로필 이미지 URL, 프로필이 없으면 빈 문자열 사용
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
                    loginViewModel.user?.kakaoAccount?.profile?.nickname ?? '');
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
          const Divider(
            color: Colors.grey, // 구분선 색상
            thickness: 1, // 구분선 두께
            indent: 16.0, // 구분선 시작 지점 여백
            endIndent: 16.0, // 구분선 끝 지점 여백
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0), // 둥근 모서리 반경 설정
            child: Container(
              height: 200,
              color: Colors.blue,
              padding: const EdgeInsets.all(16.0),
              child: const Center(
                child: Text(
                  "Tier", // 텍스트 내용
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
