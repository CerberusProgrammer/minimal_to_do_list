import 'dart:convert';
import 'dart:io';

import 'package:minimal_to_do_list/tasks.dart';
import 'package:path_provider/path_provider.dart';

import 'task.dart';

class Data {
  static void read() {
    final directory = getApplicationDocumentsDirectory().then((value) {
      final file = File('${value.path}/tasks_pending_data.json');
      String content = file.readAsStringSync();

      final pendingTasksData = jsonDecode(content) as List<dynamic>;

      for (var e in pendingTasksData) {
        Task task = Task.fromJSON(e);
        pendingTasks.add(task);
      }
      print(pendingTasks);
    });
  }

  static void save() {
    final directory = getApplicationDocumentsDirectory().then((value) {
      final file = File('${value.path}/tasks_pending_data.json');
      print('HERREEEEEEEEEEE! $file');
      print(pendingTasks.toString());
      final pendingTasksData = jsonEncode(pendingTasks.toString());

      file.writeAsString(pendingTasksData);
    });
  }
}
