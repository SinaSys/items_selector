import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

sealed class BaseListConfiguration {}

class ListConfiguration extends BaseListConfiguration {
  ListConfiguration({
    this.scrollDirection,
    this.scrollBehavior,
    this.center,
    this.anchor,
    this.semanticChildCount,
    this.cacheExtent,
    this.clipBehavior,
    this.controller,
    this.dragStartBehavior,
    this.hitTestBehavior,
    this.padding,
    this.physics,
    this.primary,
    this.keyboardDismissBehavior,
    this.restorationId,
    this.reverse,
    this.shrinkWrap,
  });

  final Axis? scrollDirection;
  final ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior;
  final bool? reverse;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final ScrollBehavior? scrollBehavior;
  final bool? shrinkWrap;
  final Key? center;
  final double? anchor;
  final double? cacheExtent;
  final int? semanticChildCount;
  final DragStartBehavior? dragStartBehavior;
  final String? restorationId;
  final Clip? clipBehavior;
  final HitTestBehavior? hitTestBehavior;
  final EdgeInsetsGeometry? padding;
}

class FlexConfiguration extends BaseListConfiguration {
  FlexConfiguration({
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.clipBehavior = Clip.none,
    this.spacing = 0.0,
  });

  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final Clip clipBehavior;
  final double spacing;
}
