import 'package:flutter/material.dart';
import 'package:tasks_with_bloc/blocs/task_bloc.dart';
import 'package:tasks_with_bloc/components/add_task_widget.dart';
import 'package:tasks_with_bloc/models/task_model.dart';


class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final taskBloc = TaskBlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Tarefas'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Task>>(
              stream: taskBloc.taskStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Nenhuma tarefa'));
                }

                final tasks = snapshot.data!;
                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];

                    return ListTile(
                      onLongPress: () {
                        taskBloc.removeTask(task);
                      },
                      title: Text(
                        task.name,
                        style: TextStyle(
                          decoration: task.isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: Checkbox(
                        value: task.isDone,
                        onChanged: (_) {
                          taskBloc.toggleTaskStatus(task);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AddTaskWidget(),
          ),
        ],
      ),
    );
  }
}
