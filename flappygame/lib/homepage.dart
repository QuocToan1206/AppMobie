import 'dart:async';

import 'package:flappygame/Among.dart';
import 'package:flappygame/vatcan.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double amongaxis = 0;
  double time = 0;
  double height =0;
  double intiaHeight =amongaxis;
  bool gameHasStarted = false;
  static double x1 = 1;
  double x2 = x1 + 1.5;

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
      time += 0.04;
      height = -4.9 *time*time+2.8*time;
      setState(() {
        amongaxis = intiaHeight - height;

      });
      //vật cản di chuyển
      setState(() {
        if(x1 < -2){
          x1 += 3.5;
        }else{
          x1 -= 0.05;
        }
      });
      setState(() {
        if(x2 < -2){
          x2 += 3.5;
        }else{
          x2 -= 0.05;
        }
      });


      if(amongaxis > 1) {
        timer.cancel();
        gameHasStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //Nhấn được toàn màn hình
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
              flex: 2,
              child: Stack(
                children: [
                  AnimatedContainer(
                    alignment: Alignment(0,amongaxis),
                    duration: Duration(milliseconds: 0),
                    color: Colors.blueGrey,
                    child: Amongus(),
                  ),
                  Container(
                    alignment: Alignment(0,-0.2),
                    child: gameHasStarted ? Text(" ") : Text("NHẤN ĐỂ BẮT ĐẦU",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  //Tạo vật cản
                  AnimatedContainer(
                    alignment: Alignment(x1,1.2),
                      duration: Duration(milliseconds: 0),
                    child: Vatcan(
                      size: 180.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(x1,-1.2),
                    duration: Duration(milliseconds: 0),
                    child: Vatcan2(
                      size: 180.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(x2,1.2),
                    duration: Duration(milliseconds: 0),
                    child: Vatcan(
                      size: 150.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(x2,-1.2),
                    duration: Duration(milliseconds: 0),
                    child: Vatcan2(
                      size: 230.0,
                    ),
                  ),
                ],
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
