import 'package:oss_qbank/src/view_models/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:oss_qbank/src/views/main_view.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await loginViewModel.login();
                if (loginViewModel.isLogined) {
                  // 로그인 성공 시 MainView로 이동
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const MainView()),
                  );
                }
              },
              child: Image.asset('assets/images/kakao_login_medium_narrow.png'),
            ),
            ElevatedButton(
              onPressed: () async {
                await loginViewModel.logout();
                // 로그아웃 후 다시 LoginView로 이동
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
              child: const Text('디자인 뭐같네.. 안해 때려쳐'),
            ),
          ],
        ),
      ),
    );
  }
}
