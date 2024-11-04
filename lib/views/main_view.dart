import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text('Content for Tab 1')), // 첫 번째 탭 내용
          Center(child: Text('Content for Tab 2')), // 두 번째 탭 내용
          Center(child: Text('Content for Tab 3')), // 세 번째 탭 내용
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: const [
          Tab(text: 'Home'), // 첫 번째 탭
          Tab(text: 'Home'), // 두 번째 탭
          Tab(text: 'profile'), // 세 번째 탭
        ],
      ),
    );
  }
}
