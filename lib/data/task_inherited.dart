import 'package:flutter/material.dart';

import '../components/task.dart';

class TaskInherited extends InheritedWidget {
   TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [Task('Aprender Flutter', 'assets/images/flutter_one.png', 3),
   Task('Andar de bike', 'assets/images/bike.jpg', 2),
   Task('Meditar', 'assets/images/meditacao.jpg', 5),
   Task('Aprender Inglês', 'assets/images/study.jpg', 5),
   Task('Lavar a louça', 'assets/images/home.jpg', 1),
   Task('Ler um livro', 'assets/images/books.jpg', 2),
   Task('Passear com o cachorro', 'assets/images/dog.jpg', 3),
   Task('Jantar com os amigos', 'assets/images/jantar.jpg', 1),];

  void newTask(String name, String photo, int difficulty){
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<>();
    assert(result != null, 'No  found in context');
    return result!;
  }

  @override
  bool updateShouldNotify( old) {
    return ;
  }
}
