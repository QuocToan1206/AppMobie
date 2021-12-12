import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pacmangame/an.dart';
import 'package:pacmangame/nhanvat.dart';
import 'package:pacmangame/vatcan.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 17;
  int nv = numberInRow * 14 + 1;

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
    166,
    167,
    168,
    169,
    170,
    171,
    172,
    173,
    174,
    175,
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
    129,
    140,
    127,
    147,
    148,
    149,
    151,
  ];
  List<int> foods = [];

<<<<<<< HEAD
  void startGame() {
    getFood();
=======
  //bắt đầu
  void startGame(){
>>>>>>> 3310fa950b44eedf40992eb9fdde4cf7177812b2
    Timer.periodic(Duration(milliseconds: 300), (timer) {
      if (foods.contains(nv)) {
        foods.remove(nv);
      }

      if (!barriers.contains(nv + 1)) {
        setState(() {
          nv++;
        });
      }
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
    //backgroud lưới
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              flex: 6,
              child: Container(
                child: GridView.builder(
                    physics:
                        NeverScrollableScrollPhysics(), // không cho di chuyển lưới bằng tay
                    itemCount: numberOfSquares,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: numberInRow),
                    itemBuilder: (BuildContext contex, int index) {
                      if (nv == index) {
                        return NhanVat();
                      } else if (barriers.contains(index)) {
                        return Vatcan(
                          innerColor: Colors.blue[500],
                          outerColor: Colors.blue[800],
                          //child: Text(index.toString()),
                        );
                      } else if (foods.contains(index)) {
                        return doan(
                          innerColor: Colors.yellow[500],
                          outerColor: Colors.black,
                          //child: Text(index.toString()),
                        );
                      } else {
                        return Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                                color: Colors.black,
                                child: Text(index.toString())));
                      }
                    }),
              )),
          //Điểm với play
          Expanded(
              child: Container(
<<<<<<< HEAD
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Điểm: ",
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
=======
                child: Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Điểm: ",style: TextStyle(color: Colors.white, fontSize: 40),),
                    GestureDetector(
                        onTap: startGame ,//nhấn vào chữ bắt đầu để chạy lệnh
                        child: Text("P L A Y ", style: TextStyle(color: Colors.white, fontSize: 40),)),
                  ],
                  ),
              ))
>>>>>>> 3310fa950b44eedf40992eb9fdde4cf7177812b2
        ],
      ),
    );
  }
}
