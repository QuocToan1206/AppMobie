import 'package:flutter/material.dart';

class Vatcan extends StatelessWidget {

  final color;
  final child;
  Vatcan({this.color, this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        color:  color,
        child: Center(child: child),//hiện số trên ô lưới
      ),
    );
  }
}
