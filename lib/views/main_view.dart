import 'package:flutter/material.dart';
import 'package:oss_qbank/views/profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // TabController 초기화
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose(); // TabController 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text("Content for Tab 1")),
          Center(child: Text("Content for Tab 2")),
          ProfileView(), // ProfileView를 탭에 추가
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: const [
          Tab(text: "Tab 1"),
          Tab(text: "Tab 2"),
          Tab(text: "Profile"),
        ],
      ),
    );
  }
}
