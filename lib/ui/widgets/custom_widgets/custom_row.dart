import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final Widget child1;
  final Widget child2;

  CustomRow({required this.child1, required this.child2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2 - 20,
          alignment: Alignment.centerRight,
          child: child1,
          margin: EdgeInsets.only(right: 20),
        ),
        Container(
            width: MediaQuery.of(context).size.width / 2 - 20,
            margin: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: child2),
      ],
    );
  }
}
