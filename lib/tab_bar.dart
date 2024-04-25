import 'package:flutter/material.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/topic_wiseNews.dart';

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _TabBarExampleState extends State<TabBarExample>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Zee News',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green.shade500,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs: const <Widget>[
            Tab(
              child: Text(
                'News',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Tab(
              child: Text(
                'Topic Wise News',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          HomePage(),
          TopicNews(),
        ],
      ),
    );
  }
}
