import 'package:flutter/material.dart';
import 'blocs/task_bloc.dart';
import 'pages/task_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TaskBlocProvider(
      child: MaterialApp(
        title: 'Tarefas com Bloc',
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TaskPage(),
      ),
    );
  }
}
