import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final bool gameHasStarted;
  Screen(this.gameHasStarted);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, -0.5),
      child: Text(
        gameHasStarted ? '' : 'NHẤN ĐỂ BẮT ĐẦU',
        style:  TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }
}
