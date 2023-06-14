import 'package:flutter/material.dart';
import 'package:task_list/screens/form_screen.dart';

import '../data/task_inherited.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter: Primeiros Passos'),
        leading: const Icon(Icons.add_task),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        children: TaskInherited.of(context)!.taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
