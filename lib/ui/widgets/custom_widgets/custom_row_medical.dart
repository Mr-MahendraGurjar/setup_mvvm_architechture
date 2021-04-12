import 'package:flutter/material.dart';

class CustomRowMedical extends StatelessWidget {
  final Widget child1;
  final Widget child2;

  CustomRowMedical({required this.child1, required this.child2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // color: Colors.red,
          width: MediaQuery.of(context).size.width / 3 - 40,
          alignment: Alignment.centerRight,
          child: child1,
          margin: EdgeInsets.only(right: 20),
        ),
        Container(
            // color: Colors.amber,
            width: MediaQuery.of(context).size.width / 3 - 40,
            margin: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: child2),
      ],
    );
  }
}
