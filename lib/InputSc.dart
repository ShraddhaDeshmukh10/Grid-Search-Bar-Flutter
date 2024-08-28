import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigici_task/GridSc.dart';

class InputSc extends StatefulWidget {
  const InputSc({super.key});

  @override
  State<InputSc> createState() => _InputScState();
}

class _InputScState extends State<InputSc> {
  final TextEditingController rowsController = TextEditingController();
  final TextEditingController colsController = TextEditingController();

  void _createGrid() {
    String rowsText = rowsController.text;
    String colsText = colsController.text;
    if (rowsText.isEmpty || colsText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Enter number'),
        ),
      );
    } else {
      try {
        int rows = int.parse(rowsText);
        int cols = int.parse(colsText);

        Get.to(GridSc(rows: rows, cols: cols));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please Enter Numbers to Proceed'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Grid Size'),
        backgroundColor: Colors.blue.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: rowsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter number of rows (m)',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: colsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter number of columns (n)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _createGrid,
              child: Text('Create Grid'),
            ),
          ],
        ),
      ),
    );
  }
}
