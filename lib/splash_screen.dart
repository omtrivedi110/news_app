import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'tab_bar.dart';

class AnimatedSplas extends StatefulWidget {
  const AnimatedSplas({super.key});

  @override
  State<AnimatedSplas> createState() => _AnimatedSplasState();
}

class _AnimatedSplasState extends State<AnimatedSplas> {
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedSplashScreen(
        splashIconSize: s.height * 0.2,
        splash: Image.asset(
          "asstes/image/Zee_news.png",
          fit: BoxFit.fitWidth,
        ),
        nextScreen: TabBarExample(),
      ),
      backgroundColor: Colors.black,
    );
  }
}
