import 'dart:developer';

import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  const TodoTile({super.key});

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.list_alt,
            size: 40,
            color: Color(0xff0c3f5c),
          ),
          // Text(
          //   "Study Lesson",
          //   style: TextStyle(
          //     color: Colors.black,
          //     fontSize: 24,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // Checkbox(
          //   value: isChecked,
          //   onChanged: (value) {
          //     setState(() {
          //       isChecked = value!;
          //     });
          //   },
          // ),
        ],
      ),
    );
  }
}
