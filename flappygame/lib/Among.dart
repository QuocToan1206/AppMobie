import 'package:flutter/material.dart';

class Amongus extends StatelessWidget {
  final among;
  final double amongWidth; // chiều rộng
  final double amongHeight; // chiều cao

  Amongus({this.among, required this.amongHeight, required this.amongWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0 , (2 * among + amongHeight) / (2 - amongHeight)),
      child: Image.asset(
        'lib/image/among.png',
        width: MediaQuery.of(context).size.height * amongWidth / 2,
        height: MediaQuery.of(context).size.height * 3 / 4 * amongHeight / 2,
        fit: BoxFit.fill,
      ),
    );
  }
}
