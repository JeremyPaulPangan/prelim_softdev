import 'package:flutter/material.dart';

class AnimeTile extends StatefulWidget {
  final Map<String, String> anime;
  final VoidCallback onDelete;

  AnimeTile({required this.anime, required this.onDelete});

  @override
  _AnimeTileState createState() => _AnimeTileState();
}

class _AnimeTileState extends State<AnimeTile> {
  bool isChecked = false;

// SHOW DIALOG BEFORE DELETE
  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          title: Text("Confirm Deletion"),
          content: Text(
              "Are you sure you want to delete '${widget.anime['title']}'?"), // DELETE DIALOG
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // CLOSE DIALOG
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                widget.onDelete(); // DELETE THE ANIME
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 58, 93, 134), // BOX COLOR
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
              activeColor: Colors.blueAccent,
            ),
          ),

// NEW ANIME IMAGE
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                widget.anime['image'] ?? 'images/loading.jpg',
                fit: BoxFit.contain,
                width: double.infinity,
                height: 160,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'images/loading.jpg',
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: 160,
                  );
                },
              ),
            ),
          ),

//ANIME DETAILS
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.anime['title'] ?? 'Unknown Title',
                    style: TextStyle(
                      color: const Color.fromARGB(
                          255, 250, 250, 250), // TEXT COLOR
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6),
                  Text(
                    widget.anime['releaseDate'] ?? 'Release Date: Unknown',
                    style: TextStyle(
                        color: const Color.fromARGB(134, 255, 255, 255),
                        fontSize: 13), // TEXT COLOR BOTTOM
                  ),
                ],
              ),
            ),
          ),

// DELETE BUTTON ICON
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SizedBox(
              width: 48,
              height: 48,
              child: IconButton(
                icon: Icon(Icons.delete,
                    color: const Color.fromARGB(255, 0, 60, 255), size: 24),
                onPressed: _showDeleteConfirmationDialog, // ASK BEFORE DDELETE
                splashRadius: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
