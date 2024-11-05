import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oss_qbank/src/views/base_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Firebase load fail."),
              );
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return const BaseView();
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
