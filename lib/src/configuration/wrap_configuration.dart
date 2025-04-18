import 'package:flutter/widgets.dart';
import 'package:items_selector/src/common/wrap_attributes.dart';

class WrapConfiguration implements WrapAttributes {
  WrapConfiguration({
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.start,
    this.spacing = 0.0,
    this.runAlignment = WrapAlignment.start,
    this.runSpacing = 0.0,
    this.wrapCrossAxisAlignment = WrapCrossAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.clipBehavior = Clip.none,
  });

  @override
  final Axis direction;
  @override
  final WrapAlignment alignment;
  @override
  final double spacing;
  @override
  final WrapAlignment runAlignment;
  @override
  final double runSpacing;
  @override
  final WrapCrossAlignment wrapCrossAxisAlignment;
  @override
  final TextDirection? textDirection;
  @override
  final VerticalDirection verticalDirection;
  @override
  final Clip clipBehavior;
}
