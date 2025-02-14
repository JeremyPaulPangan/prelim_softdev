import 'package:flutter/material.dart';
import 'anime_data.dart';
import 'anime_tile.dart';

class AnimeGrid extends StatefulWidget {
  @override
  _AnimeGridState createState() => _AnimeGridState();
}

class _AnimeGridState extends State<AnimeGrid> {
  final TextEditingController _animeTitleController = TextEditingController();
  final TextEditingController _releaseDateController = TextEditingController();

// ADD NEW ANIME
  void _showAddAnimeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          title: Text("Add a New Anime"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _animeTitleController,
                decoration: InputDecoration(labelText: "Anime Title"),
              ),
              TextField(
                controller: _releaseDateController,
                decoration: InputDecoration(labelText: "Release Date"),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _addNewAnime();
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

// DEFAULT IMAGE FOR NEW ANIME
  void _addNewAnime() {
    setState(() {
      animeList.add({
        'image': 'images/default.jpg',
        'title': _animeTitleController.text,
        'releaseDate': _releaseDateController.text,
      });
    });
    _animeTitleController.clear();
    _releaseDateController.clear();
  }

// DELETE ANIME
  void _deleteAnime(int index) {
    setState(() {
      animeList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: animeList.length,
        itemBuilder: (context, index) {
          return AnimeTile(
            anime: animeList[index],
            onDelete: () => _deleteAnime(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddAnimeDialog,
// ADD ICON
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
