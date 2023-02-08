import 'package:flutter/material.dart';

import 'my_btn.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSaved;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSaved,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new Task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyBtn(
                  name: "Save",
                  onPressed: onSaved,
                ),
                const SizedBox(width: 8),
                //cancel button
                MyBtn(
                  name: "Cancel",
                  onPressed:onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
