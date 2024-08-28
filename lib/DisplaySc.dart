import 'package:flutter/material.dart';

class DisplaySc extends StatefulWidget {
  final List<List<String>> grid;

  DisplaySc({required this.grid});

  @override
  _DisplayScState createState() => _DisplayScState();
}

class _DisplayScState extends State<DisplaySc> {
  final TextEditingController searchController = TextEditingController();
  List<List<bool>> highlighted = [];

  @override
  void initState() {
    super.initState();
    resetHighlight();
  }

  void resetHighlight() {
    highlighted = List.generate(
      widget.grid.length,
      (_) => List.generate(widget.grid[0].length, (_) => false),
    );
  }

  void searchInGrid() {
    String searchText = searchController.text;
    resetHighlight();

    bool found = false;

    for (int i = 0; i < widget.grid.length; i++) {
      for (int j = 0; j < widget.grid[i].length; j++) {
        if (_searchFromPosition(i, j, searchText)) {
          found = true;
        }
      }
    }

    if (!found) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Not found in grid'),
        ),
      );
    }

    setState(() {});
  }

  bool _searchFromPosition(int row, int col, String word) {
    bool match = false;
    if (col + word.length <= widget.grid[0].length) {
      match = true;
      for (int k = 0; k < word.length; k++) {
        if (widget.grid[row][col + k] != word[k]) {
          match = false;
          break;
        }
      }
      if (match) {
        for (int k = 0; k < word.length; k++) {
          highlighted[row][col + k] = true;
        }
      }
    }

    if (row + word.length <= widget.grid.length) {
      match = true;
      for (int k = 0; k < word.length; k++) {
        if (widget.grid[row + k][col] != word[k]) {
          match = false;
          break;
        }
      }
      if (match) {
        for (int k = 0; k < word.length; k++) {
          highlighted[row + k][col] = true;
        }
      }
    }
    if (row + word.length <= widget.grid.length &&
        col + word.length <= widget.grid[0].length) {
      match = true;
      for (int k = 0; k < word.length; k++) {
        if (widget.grid[row + k][col + k] != word[k]) {
          match = false;
          break;
        }
      }
      if (match) {
        for (int k = 0; k < word.length; k++) {
          highlighted[row + k][col + k] = true;
        }
      }
    }

    return match;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid Display'),
        backgroundColor: Colors.blue.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: widget.grid.length * widget.grid[0].length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.grid[0].length,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  int row = index ~/ widget.grid[0].length;
                  int col = index % widget.grid[0].length;
                  return Container(
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color:
                          highlighted[row][col] ? Colors.yellow : Colors.white,
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Text(widget.grid[row][col]),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter word to search',
                hintText: 'Search...',
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: searchInGrid,
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
