import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigici_task/DisplaySc.dart';

class GridSc extends StatefulWidget {
  final int rows;
  final int cols;

  GridSc({required this.rows, required this.cols});

  @override
  _GridScState createState() => _GridScState();
}

class _GridScState extends State<GridSc> {
  List<List<TextEditingController>> controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.rows; i++) {
      controllers.add(
        List.generate(widget.cols, (index) => TextEditingController()),
      );
    }
  }

  @override
  void dispose() {
    for (var rowControllers in controllers) {
      for (var controller in rowControllers) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  void navigateDisplayScreen() {
    List<List<String>> grid = controllers
        .map((rowControllers) =>
            rowControllers.map((controller) => controller.text).toList())
        .toList();
    Get.to(DisplaySc(grid: grid));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Grid Alphabets or Number'),
        backgroundColor: Colors.blue.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ...List.generate(widget.rows, (i) {
              return Row(
                children: List.generate(widget.cols, (j) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: TextField(
                        controller: controllers[i][j],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                        maxLength: 1,
                      ),
                    ),
                  );
                }),
              );
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: navigateDisplayScreen,
              child: Text('Display Grid'),
            ),
          ],
        ),
      ),
    );
  }
}
