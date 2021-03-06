import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pacmangame/an.dart';
import 'package:pacmangame/ghost.dart';
import 'package:pacmangame/nhanvat.dart';
import 'package:pacmangame/vatcan.dart';
import 'ghost.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 17;
  int nv = 166; //numberInRow * 15 + 1;
  bool nvclose = false;
  int ghost = 12;
  int ghost1 = 20;
  List<int> foods = [];
  bool pregame = true;
  int score = 0;
  List<int> barriers = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    22,
    33,
    44,
    55,
    66,
    77,
    88,
    99,
    110,
    121,
    132,
    143,
    154,
    165,
    175,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    21,
    32,
    43,
    54,
    65,
    76,
    87,
    98,
    109,
    120,
    131,
    142,
    153,
    164,
    24,
    35,
    46,
    57,
    78,
    79,
    80,
    81,
    70,
    59,
    61,
    72,
    83,
    84,
    85,
    86,
    26,
    37,
    38,
    39,
    28,
    30,
    41,
    52,
    63,
    100,
    101,
    102,
    103,
    114,
    125,
    116,
    105,
    106,
    107,
    108,
    123,
    134,
    145,
    156,
    129,
    140,
    127,
    158,
    147,
    148,
    149,
    160,
    151,
    162
  ];
  String phuonghuong = "";
  void startGame() {
    nv = 165;
    score = 0;
    ghost = 12;
    foods.clear();
    phuonghuong = 'right';
    pregame = false;
    getFood();
    moveGhost();
    moveGhost1();
    //gameStarted = true;
    Timer.periodic(Duration(milliseconds: 600), (timer) {
      if (foods.contains(nv)) {
        foods.remove(nv);
        score += 1;
      }
      switch (phuonghuong) {
        case "up":
          moveUp();
          break;
        case "down":
          moveDown();
          break;
        case "right":
          moveRight();
          break;
        case "left":
          moveLeft();
          break;
      }
      if (ghost == nv || ghost1 == nv) {
        ghostDirection = "";
        ghostDirection1 = "";
        phuonghuong = "";
        _showDialog();
      }
    });
  }

  void resetGame() {
    Navigator.pop(context);
    setState(() {
      nv = 166;
      ghost = 12;
      pregame = true;
      //gameStarted = false;
      score = 0;
      //startGame();
    });
  }

  //di chuy???n chu???t
  void moveLeft() {
    if (!barriers.contains(nv - 1)) {
      setState(() {
        nv--;
      });
    }
  }

  void moveRight() {
    if (!barriers.contains(nv + 1)) {
      setState(() {
        nv++;
      });
    }
  }

  void moveUp() {
    if (!barriers.contains(nv - numberInRow)) {
      setState(() {
        nv -= numberInRow;
      });
    }
  }

  void moveDown() {
    if (!barriers.contains(nv + numberInRow)) {
      setState(() {
        nv += numberInRow;
      });
    }
  }

  //di chuy???n qu??i
  String ghostDirection = "";
  void moveGhost() {
    ghostDirection = "left";
    Duration ghostSpeed = Duration(seconds: 1);
    Timer.periodic(ghostSpeed, (timer) {
      if (!barriers.contains(ghost - 1) && ghostDirection != "right") {
        ghostDirection = "left";
      } else if (!barriers.contains(ghost - numberInRow) &&
          ghostDirection != "down") {
        ghostDirection = "up";
      } else if (!barriers.contains(ghost + numberInRow) &&
          ghostDirection != "up") {
        ghostDirection = "down";
      } else if (!barriers.contains(ghost + 1) && ghostDirection != "left") {
        ghostDirection = "right";
      }
      switch (ghostDirection) {
        case "right":
          setState(() {
            ghost++;
          });
          break;

        case "up":
          setState(() {
            ghost -= numberInRow;
          });
          break;

        case "left":
          setState(() {
            ghost--;
          });
          break;

        case "down":
          setState(() {
            ghost += numberInRow;
          });
          break;
      }
    });
  }

  //di chuy???n qu??i
  String ghostDirection1 = "";
  void moveGhost1() {
    ghostDirection1 = "down";
    Duration ghostSpeed = Duration(seconds: 1);
    Timer.periodic(ghostSpeed, (timer) {
      if (!barriers.contains(ghost1 + numberInRow) && ghostDirection1 != "up") {
        ghostDirection1 = "down";
      } else if (!barriers.contains(ghost1 + 1) && ghostDirection1 != "left") {
        ghostDirection1 = "right";
      } else if (!barriers.contains(ghost1 - numberInRow) &&
          ghostDirection1 != "down") {
        ghostDirection1 = "up";
      } else if (!barriers.contains(ghost1 - 1) && ghostDirection1 != "right") {
        ghostDirection1 = "left";
      }
      switch (ghostDirection1) {
        case "right":
          setState(() {
            ghost1++;
          });
          break;

        case "up":
          setState(() {
            ghost1 -= numberInRow;
          });
          break;

        case "left":
          setState(() {
            ghost1--;
          });
          break;

        case "down":
          setState(() {
            ghost1 += numberInRow;
          });
          break;
      }
    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown,
            title: Center(
              child: Text(
                "G A M E  O V E R",
                style: TextStyle(color: Colors.white),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: resetGame,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: EdgeInsets.all(7),
                    color: Colors.white,
                    child: Text(
                      'PLAY AGAIN',
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }

  void getFood() {
    for (int i = 0; i < numberOfSquares; i++) {
      if (!barriers.contains(i)) {
        foods.add(i);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //backgroud l?????i
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              flex: 6,
              child: GestureDetector(
                // h?????ng di chuy???n
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy > 0) {
                    phuonghuong = "down";
                  } else if (details.delta.dy < 0) {
                    phuonghuong = "up";
                  }
                },
                onHorizontalDragUpdate: (details) {
                  if (details.delta.dx > 0) {
                    phuonghuong = "right";
                  } else if (details.delta.dx < 0) {
                    phuonghuong = "left";
                  }
                },
                child: Container(
                  child: GridView.builder(
                      physics:
                          NeverScrollableScrollPhysics(), // kh??ng cho di chuy???n l?????i b???ng tay
                      itemCount: numberOfSquares,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: numberInRow),
                      itemBuilder: (BuildContext contex, int index) {
                        if (nv == index) {
                          return NhanVat();
                        } else if (ghost == index) {
                          return Ghost();
                        } else if (ghost1 == index) {
                          return Ghost1();
                        } else if (barriers.contains(index)) {
                          return Vatcan(
                            innerColor: Colors.blue[500],
                            outerColor: Colors.blue[800],
                            // child: Text(index.toString()),
                          );
                        } else if (foods.contains(index) || pregame) {
                          return doan(
                            innerColor: Colors.yellow[500],
                            outerColor: Colors.black,
                            // child: Text(index.toString()),
                          );
                        } else {
                          return doan(
                            innerColor: Colors.black,
                            outerColor: Colors.black,
                          );
                        }
                      }),
                ),
              )),
          //??i???m v???i play
          Expanded(
              child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "??i???m: " + score.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                GestureDetector(
                    onTap: startGame,
                    child: Text(
                      "P L A Y ",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    )),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
