import 'package:flutter/material.dart';

import 'task.dart';
import 'tasks.dart';

class Pending extends StatefulWidget {
  const Pending({super.key});

  @override
  State<StatefulWidget> createState() => _Pending();
}

class _Pending extends State<Pending> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: pendingTasks.length,
        itemBuilder: ((context, index) {
          String title = pendingTasks[index].title;
          String content = pendingTasks[index].content;
          bool value = pendingTasks[index].isCompleted;

          return ListTile(
            title: Text(title),
            subtitle: content.isEmpty ? null : Text(content),
            onTap: () {
              setState(() {
                pendingTasks[index].isCompleted = true;
                completedTasks.add(pendingTasks.removeAt(index));
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
                            pendingTasks
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
