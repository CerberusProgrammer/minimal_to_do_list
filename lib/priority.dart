import 'package:flutter/material.dart';
import 'package:minimal_to_do_list/tasks.dart';

import 'task.dart';

class Priority extends StatefulWidget {
  const Priority({super.key});

  @override
  State<StatefulWidget> createState() => _Priority();
}

class _Priority extends State<StatefulWidget> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: priorityTasks.length,
        itemBuilder: ((context, index) {
          String title = priorityTasks[index].title;
          String content = priorityTasks[index].content;
          bool value = priorityTasks[index].isCompleted;

          return ListTile(
            title: Text(title),
            subtitle: content.isEmpty ? null : Text(content),
            onTap: () {
              setState(() {
                priorityTasks[index].isCompleted = true;
                completedTasks.add(priorityTasks.removeAt(index));
              });
            },
            trailing: Checkbox(
              onChanged: (value) {},
              value: value,
            ),
          );
        }),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  contentPadding: const EdgeInsets.all(10),
                  title: const Text('What we need to do?'),
                  content: SingleChildScrollView(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: title,
                              autofocus: true,
                              decoration:
                                  const InputDecoration(labelText: 'Task'),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: content,
                              decoration: const InputDecoration.collapsed(
                                hintText: 'Describe your task',
                              ),
                            ),
                          ),
                        ]),
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            priorityTasks
                                .add(Task(title.text, content.text, false));
                          });
                          title.clear();
                          content.clear();
                          Navigator.pop(context);
                        },
                        child: const Text('Add')),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
