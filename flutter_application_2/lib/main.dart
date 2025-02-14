import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AniVerseHub',
      theme: ThemeData(
// BACKGROUND COLOR
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      home: AnimeGridScreen(),
    );
  }
}
