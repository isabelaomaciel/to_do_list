import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Tarefas'),
        ),
        body: ListView(
          children: [
            Task(
                'Aprender Flutter',
                'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                3),
            Task(
                'Andar de bike',
                'https://i.pinimg.com/564x/ae/46/5c/ae465ca8a5093329c90703d715f3169d.jpg',
                2),
            Task(
                'Meditar',
                'https://i.pinimg.com/564x/72/a1/cf/72a1cf9a972215e3f83f8f47c91d787b.jpg',
                5),
            Task(
                'Aprender Inglês',
                'https://i.pinimg.com/564x/2b/77/e6/2b77e6c8b046db5f3a8d768e788e7e1e.jpg',
                5),
            Task(
                'Lavar a louça',
                'https://i.pinimg.com/564x/40/fd/eb/40fdeb91d70977177701e4313143ae99.jpg',
                1),
            Task(
                'Ler um livro',
                'https://i.pinimg.com/564x/c9/95/12/c9951235abd19a9fd92bddc45423a9cb.jpg',
                2),
            Task(
                'Passear com o cachorro',
                'https://i.pinimg.com/564x/9e/8d/1d/9e8d1da1516a03e1c9936a0d2d26ab98.jpg',
                3),
            Task(
                'Jantar com os amigos',
                'https://i.pinimg.com/564x/01/55/d7/0155d72fb1c4dc0b1604c9302d0c77e9.jpg',
                1),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String name;
  final String foto;
  final int dificuldade;

  const Task(this.name, this.foto, this.dificuldade, {Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            color: Colors.brown,
            height: 140,
          ),
          Column(
            children: [
              Container(
                color: Colors.white,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(
                  color: Colors.black26,
                  width: 72,
                  height: 100,
                  child: Image.network(
                    widget.foto,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Container(
                  width: 200,
                  child: Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 24,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Row(
                    children: [
                    Icon(
                    Icons.star,
                    size: 15,
                    color: (widget.dificuldade >= 1) ? Colors.brown :
                    Colors.brown[100],
              ),
              Icon(
                Icons.star,
                size: 15,
                color: (widget.dificuldade >= 2) ? Colors.brown :
                Colors.brown[100],
              ),
              Icon(
                Icons.star,
                size: 15,
                color:(widget.dificuldade >= 3) ? Colors.brown :
                Colors.brown[100],
              ),
              Icon(
                Icons.star,
                size: 15,
                color: (widget.dificuldade >= 4) ? Colors.brown :
                Colors.brown[100],
              ),
              Icon(Icons.star,
                  size: 15, color: (widget.dificuldade >= 5) ? Colors.brown :
                  Colors.brown[100]),
            ],
          ),
        ],
      ),
      Container(
        height: 52,
        width: 52,
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                nivel++;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.arrow_drop_up),
                Text(
                  'UP',
                  style: TextStyle(fontSize: 12),
                )
              ],
            )),
      ),
      ],
    ),
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
    child: LinearProgressIndicator(
    color: Colors.white,
    value: (widget.dificuldade > 0)
        ? (nivel / widget.dificuldade) / 10
        : 1,
    ),
    width: 200,
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(12),
    child: Text('Nivel: $nivel',
    style: TextStyle(
    color: Colors.white,
    fontSize: 16,
    )),
    ),
    ],
    ),
    ],
    ),
    ],
    ),
    );
  }
}
