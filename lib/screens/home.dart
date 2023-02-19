import 'package:flutter/material.dart';
import 'package:todolist/model/Task.dart';
import 'package:todolist/screens/task_list.dart';
import '../widgets/add_new_task.dart';
import '../widgets/list_view_tasks.dart';
import '../widgets/task_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Task> tasks = ListTaksView(
    tasks: [],
  ).tasks as List<Task>;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: (Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding:
                  EdgeInsets.only(top: 80, left: 24, right: 24, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.list,
                          size: 30,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "To Do",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "3 Tasks",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              )),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            child: ListTaksView(tasks: tasks),
          ))
        ])),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        padding: EdgeInsets.only(
                            bottom:
                            MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          height: 200,
                          child: Column(
                            children: [
                              const Text(
                                "Add Task",
                                style: TextStyle(
                                    color: Colors.lightBlue, fontSize: 20),
                              ),
                              TextFormField(
                                controller: controller,
                                decoration: InputDecoration(),
                              ),
                              Container(
                                width: double.infinity,
                                child: MaterialButton(
                                  color: Colors.indigoAccent,
                                  onPressed: () {
                                    setState(() {
                                      tasks.add(Task(title: controller.text));
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: Text(
                                    "ADD",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                   ));
            }));
  }
}
