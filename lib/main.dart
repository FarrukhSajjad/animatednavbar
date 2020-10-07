import 'package:flutter/material.dart';

import 'animation_bottom_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Nav Bar',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}
