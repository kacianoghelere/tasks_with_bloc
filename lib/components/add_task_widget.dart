import 'package:flutter/material.dart';
import '../blocs/task_bloc.dart';
import '../models/task_model.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({super.key});

  @override
  _AddTaskWidgetState createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final taskBloc = TaskBlocProvider.of(context);

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Adicionar nova tarefa',
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              taskBloc.addTask(Task(name: _controller.text));
              _controller.clear();
            }
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
