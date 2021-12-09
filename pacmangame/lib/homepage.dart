import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 16;

  @override
  Widget build(BuildContext context) {
    //backgroud lưới
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
            flex: 5,
              child: Container(
                child: GridView.builder(
                  physics:  NeverScrollableScrollPhysics(),
                    itemCount: numberOfSquares, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: numberInRow),
                    itemBuilder: (BuildContext contex, int index){
                      return Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          color:  Colors.grey,
                          child: ,
                        ),
                      );
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
