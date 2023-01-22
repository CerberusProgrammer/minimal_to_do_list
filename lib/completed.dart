import 'package:flutter/material.dart';
import 'package:minimal_to_do_list/tasks.dart';

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<StatefulWidget> createState() => _Completed();
}

class _Completed extends State<Completed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: completedTasks.length,
        itemBuilder: ((context, index) {
          String title = completedTasks[index].title;
          String content = completedTasks[index].content;
          bool value = completedTasks[index].isCompleted;

          return ListTile(
            enabled: false,
            title: Text(title),
            subtitle: content.isEmpty ? null : Text(content),
            onTap: () {},
            trailing: Checkbox(
              activeColor: Colors.amber,
              focusColor: Colors.amber,
              onChanged: (value) {},
              value: value,
            ),
          );
        }),
      )),
    );
  }
}
