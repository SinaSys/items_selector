import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:items_selector/src/common/flex_attributes.dart';
import 'package:flutter/rendering.dart' show RenderListWheelViewport;

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

class FlexConfiguration extends BaseListConfiguration implements FlexAttributes {
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
}

class WheelConfiguration extends BaseListConfiguration {
  WheelConfiguration({
    this.controller,
    this.physics,
    this.diameterRatio = RenderListWheelViewport.defaultDiameterRatio,
    this.perspective = RenderListWheelViewport.defaultPerspective,
    this.offAxisFraction = 0.0,
    this.useMagnifier = false,
    this.magnification = 1.0,
    this.overAndUnderCenterOpacity = 1.0,
    required this.itemExtent,
    this.squeeze = 1.0,
    this.onSelectedItemChanged,
    this.renderChildrenOutsideViewport = false,
    this.clipBehavior = Clip.hardEdge,
    this.hitTestBehavior = HitTestBehavior.opaque,
    this.restorationId,
    this.scrollBehavior,
    this.dragStartBehavior = DragStartBehavior.start,
  });

  final ScrollController? controller;
  final ScrollPhysics? physics;
  final double diameterRatio;
  final double perspective;
  final double offAxisFraction;
  final bool useMagnifier;
  final double magnification;
  final double overAndUnderCenterOpacity;
  final double itemExtent;
  final double squeeze;
  final ValueChanged<int>? onSelectedItemChanged;
  final bool renderChildrenOutsideViewport;
  final Clip clipBehavior;
  final HitTestBehavior hitTestBehavior;
  final String? restorationId;
  final ScrollBehavior? scrollBehavior;
  final DragStartBehavior dragStartBehavior;
}
