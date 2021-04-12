import 'package:flutter/material.dart';

class KeyboardClosable extends StatelessWidget {
  final Widget? child;

  KeyboardClosable({this.child});

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: child ?? Container(),
      );
}
