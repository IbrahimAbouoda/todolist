import 'package:flutter/material.dart';
import 'package:todolist/model/Task.dart';
import 'package:todolist/widgets/add_new_task.dart';

import '../screens/task_list.dart';

class ListTaksView extends StatelessWidget {
  final List<Task>tasks;
  const ListTaksView({
    Key? key,required this.tasks
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) =>
          ListTileCheck(task: tasks[index])
      );
  }
}
