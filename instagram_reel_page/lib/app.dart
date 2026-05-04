import 'package:flutter/material.dart';
import 'package:instagram_reel_page/features/reel/view/pages/reel_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 14, color: Colors.white),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: Colors.white,
            iconSize: 32,
          ),
        ),
      ),
      home: ReelPage(),
    );
  }
}
