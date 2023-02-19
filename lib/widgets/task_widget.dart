

import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  TaskTile({Key? key, required this.titel,
    required this.check, required this.func})
      : super(key: key);

  String titel;
  bool check ;

  Function(bool?)? func;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.titel),
      trailing: Checkbox(

        onChanged: (value) =>setState(() {
          widget.check!=value;
        }),
        value: widget.check
      ),
    );
  }
}
