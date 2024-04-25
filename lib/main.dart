import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/tab_bar.dart';
import 'package:news_app/topic_wiseNews.dart';
import 'detail_page.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => const AnimatedSplas(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/detail',
          page: () => InAppWebViewPage(),
        ),
        GetPage(
          name: '/topic',
          page: () => const TopicNews(),
        ),
        GetPage(
          name: '/tab',
          page: () => const TabBarExample(),
        ),
      ],
    );
  }
}
