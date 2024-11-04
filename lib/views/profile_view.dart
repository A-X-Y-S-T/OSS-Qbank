import 'package:flutter/material.dart';
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
            child: Row(
              children: <Widget>[
                Consumer<LoginViewModel>(
                  builder: (context, loginViewModel, child) {
                    return Image.network(loginViewModel
                            .user?.kakaoAccount?.profile?.profileImageUrl ??
                        '');
                  },
                ),
                Consumer<LoginViewModel>(
                  builder: (context, loginViewModel, child) {
                    return Text(
                        loginViewModel.user?.kakaoAccount?.profile?.nickname ??
                            '');
                  },
                ),
                Expanded(
                  child: Container(),
                ),
                Consumer<LoginViewModel>(
                  builder: (context, loginViewModel, child) {
                    return ElevatedButton(
                      onPressed: () {
                        loginViewModel.logout();
                      },
                      child: Text("로그아웃"),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
