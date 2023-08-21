import 'package:flutter/material.dart';

import 'screen/bottomTabBar/page/tab_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: BottomBar(),
    );
  }
}
