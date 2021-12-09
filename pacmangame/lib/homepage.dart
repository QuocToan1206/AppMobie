import 'package:flutter/material.dart';
import 'package:pacmangame/vatcan.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 17;

  List<int> barriers = [
    0,1,2,3,4,5,6,7,8,9,10,11,22,33,44,55,66,77,88,99,110,121,132,143,154,165,166,167,168,169,170,171,172,173,174,175,21,32,43,54,65,76,87,98,109,120,131,142,153,164,
    24,35,46,57,78,79,80,81,70,59,61,72,83,84,85,86,26,37,38,39,28,30,41,52,63,
    100,101,102,103,114,125,116,105,106,107,108,
    123,134,145,129,140,127,147,148,149,151,
  ];

  @override
  Widget build(BuildContext context) {
    //backgroud lưới
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 5,
              child: Container(
                child: GridView.builder(
                  physics:  NeverScrollableScrollPhysics(), // không cho di chuyển lưới bằng tay
                    itemCount: numberOfSquares, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: numberInRow),
                    itemBuilder: (BuildContext contex, int index){
                      if(barriers.contains((index))){
                        return Vatcan(
                          color: Colors.blue[900],
                          child: Text(index.toString()),
                        );
                      }else{
                        return Vatcan(
                          color: Colors.black,
                          child: Text(index.toString()),
                        );
                      }
                    }),
                  )
          ),
          //Điểm với play
          Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Điểm: ",style: TextStyle(color: Colors.white, fontSize: 40),),
                    Text("P L A Y ", style: TextStyle(color: Colors.white, fontSize: 40),),
                  ],
                  ),
              ))
        ],
      ),
    );
  }
}
