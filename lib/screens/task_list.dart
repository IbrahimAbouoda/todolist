import 'package:flutter/material.dart';

import '../model/Task.dart';

class ListTileCheck extends StatefulWidget {
  const ListTileCheck({Key? key,required this.task}) : super(key: key);

  final Task task;
  @override
  State<ListTileCheck> createState() => _ListTileCheckState();
}

class _ListTileCheckState extends State<ListTileCheck> {
  @override
  bool isChecked = false;

  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          widget.task.title,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: MyCheckBox(
            value: isChecked,
            fun: (val) {
              setState(() {
                isChecked = val!;
                print(val);
                print(isChecked);
              });
            }));
  }
}

class MyCheckBox extends StatelessWidget {
  final bool value;
  final Function(bool?)? fun;

  const MyCheckBox({Key? key, this.fun, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(value: value, onChanged: fun);
  }
}
