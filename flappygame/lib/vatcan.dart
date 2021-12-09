import 'package:flutter/material.dart';
class Vatcan extends StatelessWidget {
  final size;
  Vatcan({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: size,
      //color: Colors.green,
      child: Image.asset(
        'lib/image/ong.png'
      ),
    );

  }
}
class Vatcan2 extends StatelessWidget {
  final size;
  Vatcan2({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: size,
      //color: Colors.green,
      child: Image.asset(
          'lib/image/ong2.png'
      ),
    );
  }
}

