import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Delimiter extends SizedBox {
  Delimiter.height(double h) : super(height: h);

  Delimiter.width(double w) : super(width: w);
}

class DefaultDivider extends Divider {
  DefaultDivider({Color? color})
      : super(
          height: 1.0,
          thickness: 1.0,
          color: color == null ? colors().blockDivider : color,
        );
}

class DefaultVerticalDivider extends VerticalDivider {
  DefaultVerticalDivider() : super(color: colors().blockDivider);
}
