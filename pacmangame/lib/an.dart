import 'package:flutter/material.dart';

class doan extends StatelessWidget {

  final innerColor;
  final outerColor;
  final child;
  doan({this.innerColor,this.outerColor ,this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: EdgeInsets.all(12),
          color:  outerColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(

              color:  innerColor,
              child: Center(child: child,) ,//hiện số trên ô lưới
            ),
          ), //hiện số trên ô lưới
        ),
      ),
    );
  }
}
