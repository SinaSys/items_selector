import 'package:flutter/widgets.dart';

sealed class BaseGridConfiguration extends GridView {
  BaseGridConfiguration({
    super.key,
    super.scrollDirection,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    required super.gridDelegate,
    this.findChildIndexCallback,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    super.cacheExtent,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
    super.hitTestBehavior,
    this.addAutomaticKeepAlives = false,
  });

  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final ChildIndexGetter? findChildIndexCallback;
  final bool addAutomaticKeepAlives;
}

class BuilderConfiguration extends BaseGridConfiguration {
  BuilderConfiguration({
    super.key,
    super.scrollDirection,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    required super.gridDelegate,
    super.findChildIndexCallback,
    super.addRepaintBoundaries = true,
    super.addSemanticIndexes = true,
    super.cacheExtent,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
    super.hitTestBehavior,
    super.addAutomaticKeepAlives = false,
  });
}

class CountConfiguration extends BaseGridConfiguration {
  CountConfiguration({
    required this.crossAxisCount,
    this.mainAxisSpacing = 0.0,
    this.childAspectRatio = 1.0,
    this.crossAxisSpacing = 0.0,
    super.key,
    super.scrollDirection,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    super.findChildIndexCallback,
    super.addRepaintBoundaries = true,
    super.addSemanticIndexes = true,
    super.cacheExtent,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
    super.hitTestBehavior,
    super.addAutomaticKeepAlives = false,
  }) : super(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: mainAxisSpacing,
            crossAxisSpacing: crossAxisSpacing,
            childAspectRatio: childAspectRatio,
          ),
        );

  final int crossAxisCount;
  final double mainAxisSpacing;
  final double childAspectRatio;
  final double crossAxisSpacing;
}

class ExtentConfiguration extends BaseGridConfiguration {
  ExtentConfiguration({
    required this.maxCrossAxisExtent,
    this.mainAxisSpacing = 0.0,
    this.childAspectRatio = 1.0,
    this.crossAxisSpacing = 0.0,
    super.key,
    super.scrollDirection,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    super.findChildIndexCallback,
    super.addRepaintBoundaries = true,
    super.addSemanticIndexes = true,
    super.cacheExtent,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
    super.hitTestBehavior,
    super.addAutomaticKeepAlives = false,
  }) : super(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: maxCrossAxisExtent,
            mainAxisSpacing: mainAxisSpacing,
            crossAxisSpacing: crossAxisSpacing,
            childAspectRatio: childAspectRatio,
          ),
        );

  final double maxCrossAxisExtent;
  final double mainAxisSpacing;
  final double childAspectRatio;
  final double crossAxisSpacing;
}
