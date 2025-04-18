import 'package:flutter/widgets.dart';

abstract interface class WrapAttributes {
  Axis get direction;

  WrapAlignment get alignment;

  double get spacing;

  WrapAlignment get runAlignment;

  double get runSpacing;

  WrapCrossAlignment get wrapCrossAxisAlignment;

  TextDirection? get textDirection;

  VerticalDirection get verticalDirection;

  Clip get clipBehavior;
}
