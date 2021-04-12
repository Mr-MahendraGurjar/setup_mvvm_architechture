import 'dart:ui';

import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:setup_mvvm_architechture/utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;

  IconBtn(this.icon, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(4.0),
        splashColor: colors().inkWellHighlights,
        highlightColor: colors().inkWellHighlights,
        onTap: onPressed,
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.all(8),
          child: SizedBox(
            width: 26,
            height: 24,
            child: icon,
          ),
        ),
      ),
    );
  }
}

class IconBtnFingerPrint extends StatelessWidget {
  final VoidCallback onPressed;

  IconBtnFingerPrint(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(60.0),
        splashColor: colors().inkWellHighlights,
        highlightColor: colors().inkWellHighlights,
        onTap: onPressed,
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.all(8),
          child: Icon(
            Icons.fingerprint,
            color: colors().primary,
            size: 32.0,
          ),
        ),
      ),
    );
  }
}

class IconButtonBack extends StatelessWidget {
  final VoidCallback onPressed;

  IconButtonBack(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(4.0),
        splashColor: colors().inkWellHighlights,
        highlightColor: colors().inkWellHighlights,
        onTap: onPressed,
        child: Container(
          width: 40,
          height: 40,
          child: Center(
            child: SizedBox(
              width: 26,
              height: 26,
              child: SvgPicture.asset(
                AssetsUtil.iconBack,
                color: colors().primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
