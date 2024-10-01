import 'dart:async';
import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TaskBloc {
  final _taskController = StreamController<List<Task>>.broadcast();
  final List<Task> _tasks = [];

  Stream<List<Task>> get taskStream => _taskController.stream;

  void addTask(Task task) {
    _tasks.add(task);

    _taskController.sink.add(_tasks);
  }

  void removeTask(Task task) {
    _tasks.remove(task);

    _taskController.sink.add(_tasks);
  }

  void toggleTaskStatus(Task task) {
    task.isDone = !task.isDone;

    _taskController.sink.add(_tasks);
  }

  void dispose() {
    _taskController.close();
  }
}

class TaskBlocProvider extends InheritedWidget {
  final TaskBloc bloc;

  TaskBlocProvider({Key? key, required Widget child})
      : bloc = TaskBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static TaskBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskBlocProvider>()!.bloc;
  }
}
