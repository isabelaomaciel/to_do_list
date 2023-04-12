import 'package:flutter/material.dart';
import 'package:to_do/components/difficulty.dart';

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
  int level = 0;
  int levelMax = 10;
  int levelColor = 0;

  List listColors = [
    Colors.blueGrey,
    Colors.lightBlueAccent,
    Colors.green,
    Colors.deepOrange,
    Colors.amber,
    Colors.redAccent,
  ];

  void upNivel(){
    if(level < (widget.dificuldade * levelMax)){
      level++;
    } else {
      level = 1;
      if (levelColor < listColors.length - 1){
        levelColor++;
      } else {
        levelColor = 0;
      }
    }
  }

  double incrementProgressBar(){
    return (widget.dificuldade > 0)
        ? (level / (widget.dificuldade * levelMax))
        : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.blueGrey,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black12,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          widget.foto,
                          height: 100,
                          width: 72,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.name,
                            style: const TextStyle(
                              fontSize: 24,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Difficulty(
                          difficultyLevel: widget.dificuldade,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 52,
                      width: 52,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              upNivel();
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'UP',
                                style: TextStyle(fontSize: 12),
                              ),
                            ]
                          )),
                    ),
                  ],
                ),
              ),


              Container(
                color: listColors[levelColor],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: incrementProgressBar(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text('Nivel: $level',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//Quando sua tarefa chegar no nível máximo de maestria (ou seja, a barra de progresso estiver toda preenchida), a tarefa deve MUDAR DE COR.
// Faça vários níveis diferentes de maestria, indicados por diferentes cores!
// Lembre-se de que com dificuldades diferentes, as maestrias demoram mais!
