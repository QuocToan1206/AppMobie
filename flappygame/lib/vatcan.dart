import 'package:flutter/material.dart';
class Vatcan extends StatelessWidget {
  final vatcanWidth1;
  final vatcanHeight1;
  final vatcan1;
  final bool isThisBottomVatcan1;
  Vatcan({this.vatcanHeight1,this.vatcanWidth1, required this.isThisBottomVatcan1,this.vatcan1});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2 * vatcan1 + vatcanWidth1) / (2 - vatcanWidth1), isThisBottomVatcan1 ? 1 : -1 ),
      //color: Colors.green,
      child: Image.asset(
        'lib/image/ong2.png',
        width: MediaQuery.of(context).size.width * vatcanWidth1 / 2,
        height: MediaQuery.of(context).size.height * 3 / 4 * vatcanHeight1 / 2,
      ),
    );

  }
}
class Vatcan2 extends StatelessWidget {
  final vatcanWidth2;
  final vatcanHeight2;
  final vatcan2;
  final bool isThisBottomVatcan2;
  Vatcan2({this.vatcanHeight2,this.vatcanWidth2, required this.isThisBottomVatcan2,this.vatcan2});


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2 * vatcan2 + vatcanWidth2) / (2 - vatcanWidth2), isThisBottomVatcan2 ? 1 : -1 ),
      //color: Colors.green,
      child: Image.asset(
          'lib/image/ong.png',
        width: MediaQuery.of(context).size.width * vatcanWidth2 / 2,
        height: MediaQuery.of(context).size.height * 3 / 4 * vatcanHeight2 / 2,
      ),
    );
  }
}

