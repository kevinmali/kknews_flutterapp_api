import 'package:flutter/material.dart';

import 'views/homescreen/views/homescreen.dart';
import 'views/newsscreen/views/newsscreen.dart';
import 'views/splashscreen/splashscreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => const SplashScreen(),
        'home': (ctx) => const HomeScreen(),
        'news': (ctx) => NewsScreen(),
      },
    ),
  );
}
