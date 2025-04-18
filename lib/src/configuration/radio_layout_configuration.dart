import 'package:flutter/widgets.dart';
import 'package:items_selector/src/common/flex_attributes.dart';
import 'package:items_selector/src/common/wrap_attributes.dart';

enum RadioLayoutType {
  row,
  column,
  wrap,
}

class RadioLayoutConfiguration implements FlexAttributes, WrapAttributes {
  const RadioLayoutConfiguration._internal({
    this.layoutType = RadioLayoutType.column,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.clipBehavior = Clip.none,
    this.spacing = 0.0,
    this.alignment = WrapAlignment.start,
    this.direction = Axis.horizontal,
    this.runAlignment = WrapAlignment.start,
    this.runSpacing = 0.0,
    this.wrapCrossAxisAlignment = WrapCrossAlignment.start,
  });

  factory RadioLayoutConfiguration.withRow({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    Clip clipBehavior = Clip.none,
    double spacing = 0.0,
  }) {
    return RadioLayoutConfiguration._internal(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        clipBehavior: clipBehavior,
        spacing: spacing,
        layoutType: RadioLayoutType.row);
  }

  factory RadioLayoutConfiguration.withColumn({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    Clip clipBehavior = Clip.none,
    double spacing = 0.0,
  }) {
    return RadioLayoutConfiguration._internal(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      clipBehavior: clipBehavior,
      spacing: spacing,
      layoutType: RadioLayoutType.column,
    );
  }

  factory RadioLayoutConfiguration.withWrap({
    Axis direction = Axis.horizontal,
    WrapAlignment alignment = WrapAlignment.start,
    double spacing = 0.0,
    WrapAlignment runAlignment = WrapAlignment.start,
    double runSpacing = 0.0,
    WrapCrossAlignment wrapCrossAxisAlignment = WrapCrossAlignment.start,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    Clip clipBehavior = Clip.none,
  }) {
    return RadioLayoutConfiguration._internal(
      direction: direction,
      alignment: alignment,
      spacing: spacing,
      runAlignment: runAlignment,
      runSpacing: runSpacing,
      wrapCrossAxisAlignment: wrapCrossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      clipBehavior: clipBehavior,
      layoutType: RadioLayoutType.wrap,
    );
  }

  final RadioLayoutType layoutType;

  @override
  final MainAxisAlignment mainAxisAlignment;
  @override
  final MainAxisSize mainAxisSize;
  @override
  final CrossAxisAlignment crossAxisAlignment;
  @override
  final TextDirection? textDirection;
  @override
  final VerticalDirection verticalDirection;
  @override
  final TextBaseline? textBaseline;
  @override
  final Clip clipBehavior;
  @override
  final double spacing;

  @override
  final WrapAlignment alignment;
  @override
  final Axis direction;
  @override
  final WrapAlignment runAlignment;
  @override
  final double runSpacing;
  @override
  final WrapCrossAlignment wrapCrossAxisAlignment;
}
