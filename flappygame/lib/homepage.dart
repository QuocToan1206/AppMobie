import 'dart:async';

import 'package:flappygame/Among.dart';
import 'package:flappygame/Screen.dart';
import 'package:flappygame/vatcan.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double amongaxis = 0;
  double time = 1;
  double height =0;
  double intiaHeight =amongaxis;
  bool gameHasStarted = false; // cài đặt trò chơi
  double amongWidth = 0.1 ; // chiều rộng
  double amongHeight = 0.1 ; // chiều dài
  double trongluc = -4.9;
  double vantoc = 2.8;
  //static double x1 = 1;
  //double x2 = x1 + 1.5;

  //khai báo biến rào cản
  static List<double> vatcan1 = [2, 2 +1.5];
  static double vatcanWidth1 = 0.5;
  List<List<double>> vatcanHeight1 =[
    [0.6, 0.4],
    [0.4, 0.6]
  ];

  static List<double> vatcan2 = [2, 2 +1.5];
  static double vatcanWidth2 = 0.5;
  List<List<double>> vatcanHeight2 =[
    [0.6, 0.4],
    [0.4, 0.6]
  ];

  //di chuyển vật cản
  void moveMap(){
    // di chuyển vật cản trên
    for (int i = 0; i < vatcan1.length; i++){
      setState(() {
        vatcan1[i] -=0.05;
      });

      if(vatcan1[i] < -1.5 ){
        vatcan1[i] += 3;
      }
    }
    // di chuyển vật cản dưới
    for (int i = 0; i < vatcan2.length; i++){
      setState(() {
        vatcan2[i] -=0.05;
      });

      if(vatcan2[i] < -1.5 ){
        vatcan2[i] += 3;
      }
    }
  }

  void jump(){
    setState(() {
      time = 0;
      intiaHeight = amongaxis;

    });
  }

  void startGame(){
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {

      //tính toán độ rơi nhân vật khi click chuột vào
      height = trongluc * time * time + vantoc * time;
      /*time += 0.04;
      height = -4.9 *time*time+2.8*time;*/
      setState(() {
        amongaxis = intiaHeight - height;
      });
      //kiểm tra nhân vật đã chết chưa
      if(AmongDead()){
        timer.cancel();
        //_showDialog();
      }

      moveMap();
      time += 0.01;


      if(amongaxis > 1) {
        timer.cancel();
        gameHasStarted = false;
      }
    });
  }

  bool AmongDead(){
    //kiểm tra xem nhân vật đã chạm đầu hay cuối màn hình
    if (amongaxis < -1 || amongaxis >1){
      return true;
    }
    // chạm vào rào cản
    // kiểm tra xem nhân vật nằm trong tọa độ rào cản ko
    for( int i = 0; i < vatcan1.length; i++){
      if(vatcan1[i] <= amongWidth &&
      vatcan1[i] + vatcanWidth1 >= amongWidth &&
          (amongaxis <= -1 + vatcanHeight1[i][0] ||
              amongaxis + amongHeight >= 1 - vatcanHeight1[i][1]
          )
      ){
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //Nhấn được toàn màn hình
      //onTap: gameHasStarted ? jump() : startGame,
      onTap: (){
        if (gameHasStarted){
          jump();
        }else{
          startGame();

        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blueGrey,
                child: Center(
                  child: Stack(
                    children: [
                      Amongus(
                        among: amongaxis,
                          amongHeight: amongHeight,
                          amongWidth: amongWidth
                      ),

                      Screen(gameHasStarted),

                      //Tạo vật cản
                      //vật cản 1 top
                      Vatcan(
                        vatcan1: vatcan1[0],
                          vatcanHeight1: vatcanHeight1[0][0],
                          vatcanWidth1: vatcanWidth1,
                          isThisBottomVatcan1: false,
                      ),
                      //vật cản 1 dưới
                      Vatcan2(
                          vatcan2: vatcan2[0],
                          vatcanHeight2: vatcanHeight2[0][1],
                          vatcanWidth2: vatcanWidth2,
                          isThisBottomVatcan2: true,
                      ),
                      //vật cản 2 top
                      Vatcan(
                        vatcan1: vatcan1[1],
                        vatcanHeight1: vatcanHeight1[1][0],
                        vatcanWidth1: vatcanWidth1,
                        isThisBottomVatcan1: false,
                      ),
                      //vật cản 2 dưới
                      Vatcan2(
                        vatcan2: vatcan2[1],
                        vatcanHeight2: vatcanHeight2[1][1],
                        vatcanWidth2: vatcanWidth2,
                        isThisBottomVatcan2: true,
                      ),

                    ],
                  ),
                ),
              )
            ),
            Expanded(
              child: Container(
                color: Colors.pinkAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text ("ĐIỂM SỐ  ", style: TextStyle(color: Colors.white,fontSize: 20),),
                      SizedBox(height: 30,),
                      Text("0",style: TextStyle(color: Colors.white,fontSize: 35),),
                    ],),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(" XẾP HẠNG", style: TextStyle(color: Colors.white,fontSize: 20),),
                      SizedBox(height: 30,),
                      Text("100" , style: TextStyle(color: Colors.white,fontSize: 35),)],
                  )],
              ),
              ),),
          ],
        ),
      ),
    );
  }
}
