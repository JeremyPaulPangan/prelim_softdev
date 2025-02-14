import 'package:flutter/material.dart';
import 'anime_grid.dart';

class AnimeGridScreen extends StatefulWidget {
  @override
  _AnimeGridScreenState createState() => _AnimeGridScreenState();
}

class _AnimeGridScreenState extends State<AnimeGridScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AniVerseHub',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 12, 148, 238),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Anime Watchlist',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(221, 0, 162, 255),
              ),
            ),
          ),
          Expanded(
            child: AnimeGrid(),
          ),
        ],
      ),
    );
  }
}
