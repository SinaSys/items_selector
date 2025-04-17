import 'package:flutter/widgets.dart';

@immutable
abstract interface class FlexAttributes {
  MainAxisAlignment get mainAxisAlignment;

  MainAxisSize get mainAxisSize;

  CrossAxisAlignment get crossAxisAlignment;

  TextDirection? get textDirection;

  VerticalDirection get verticalDirection;

  TextBaseline? get textBaseline;

  Clip get clipBehavior;

  double get spacing;
}
