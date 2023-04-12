
import 'package:flutter/material.dart';
import 'package:to_do/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container()
        ,
        title
            :
        const Text
          ('Tarefas'),
      ),
      body
          :
      AnimatedOpacity
        (
        opacity
            :
        opacidade
            ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: ListView(
          children: const [
            Task(
                'Aprender Flutter',
                'assets/images/flutter_one.png',
                3),
            Task(
                'Andar de bike',
                'assets/images/bike.jpg',
                2),
            Task(
                'Meditar',
                'assets/images/meditacao.jpg',
                5),
            Task(
                'Aprender Inglês',
                'assets/images/study.jpg',
                5),
            Task(
                'Lavar a louça',
                'assets/images/home.jpg',
                1),
            Task(
                'Ler um livro',
                'assets/images/books.jpg',
                2),
            Task(
                'Passear com o cachorro',
                'assets/images/dog.jpg',
                3),
            Task(
                'Jantar com os amigos',
                'assets/images/jantar.jpg',
                1),

            SizedBox(height: 80,)

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        backgroundColor: Colors.blueGrey[300],
        child: const Icon(Icons.remove_red_eye),
      ),

    );
  }
}
