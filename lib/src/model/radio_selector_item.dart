import 'package:flutter/material.dart';

@immutable
class RadioSelectorItem extends RadioListTile {
  const RadioSelectorItem({
    super.key,
    super.activeColor,
    super.autofocus,
    super.contentPadding,
    super.controlAffinity,
    super.dense,
    super.enableFeedback,
    super.fillColor,
    super.focusNode,
    super.hoverColor,
    super.internalAddSemanticForOnTap,
    super.isThreeLine,
    super.materialTapTargetSize,
    super.mouseCursor,
    super.onFocusChange,
    super.overlayColor,
    super.secondary,
    super.selected,
    super.selectedTileColor,
    super.shape,
    super.splashRadius,
    super.subtitle,
    super.tileColor,
    required super.title,
    super.toggleable,
    super.visualDensity,
  }) : super(
          value: null,
          groupValue: null,
          onChanged: null,
        );

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    final List<String> properties = [];

    // Add properties only if they are not null
    if (key != null) properties.add('key: $key');
    // if (value != null) properties.add('value: $value');
    //  if (groupValue != null) properties.add('groupValue: $groupValue');
    // if (onChanged != null) properties.add('onChanged: $onChanged');
    if (activeColor != null) properties.add('activeColor: $activeColor');
    if (contentPadding != null) properties.add('contentPadding: $contentPadding');
    if (controlAffinity != null) properties.add('controlAffinity: $controlAffinity');
    if (dense != null) properties.add('dense: $dense');
    if (enableFeedback != null) properties.add('enableFeedback: $enableFeedback');
    if (fillColor != null) properties.add('fillColor: $fillColor');
    if (focusNode != null) properties.add('focusNode: $focusNode');
    if (hoverColor != null) properties.add('hoverColor: $hoverColor');
    if (materialTapTargetSize != null) properties.add('materialTapTargetSize: $materialTapTargetSize');
    if (mouseCursor != null) properties.add('mouseCursor: $mouseCursor');
    if (onFocusChange != null) properties.add('onFocusChange: $onFocusChange');
    if (overlayColor != null) properties.add('overlayColor: $overlayColor');
    if (secondary != null) properties.add('secondary: $secondary');
    if (selectedTileColor != null) properties.add('selectedTileColor: $selectedTileColor');
    if (shape != null) properties.add('shape: $shape');
    if (splashRadius != null) properties.add('splashRadius: $splashRadius');
    if (subtitle != null) properties.add('subtitle: $subtitle');
    if (tileColor != null) properties.add('tileColor: $tileColor');
    if (title != null) properties.add('title: $title');
    if (visualDensity != null) properties.add('visualDensity: $visualDensity');

    // Handle boolean properties with default false - only show when true
    if (isThreeLine == true) properties.add('isThreeLine: $isThreeLine');
    if (toggleable == true) properties.add('toggleable: $toggleable');
    if (autofocus == true) properties.add('autofocus: $autofocus');
    if (selected == true) properties.add('selected: $selected');
    if (internalAddSemanticForOnTap == true) {
      properties.add('internalAddSemanticForOnTap: $internalAddSemanticForOnTap');
    }

    return 'RadioSelectorItem(\n${properties.join(',\n')}\n)';
  }
}

class RadioSelectorOption extends RadioSelectorItem {
  const RadioSelectorOption({
    super.key,
    super.activeColor,
    super.contentPadding,
    super.controlAffinity,
    super.dense,
    super.enableFeedback,
    super.fillColor,
    super.focusNode,
    super.hoverColor,
    super.internalAddSemanticForOnTap,
    super.materialTapTargetSize,
    super.mouseCursor,
    super.onFocusChange,
    super.overlayColor,
    super.secondary,
    super.selectedTileColor,
    super.shape,
    super.splashRadius,
    super.tileColor,
    super.visualDensity,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.clipBehavior = Clip.none,
    this.spacing = 0.0,
  }) : super(title: null);

  final MainAxisAlignment mainAxisAlignment;

  final MainAxisSize mainAxisSize;

  final CrossAxisAlignment crossAxisAlignment;

  final TextDirection? textDirection;

  final VerticalDirection verticalDirection;

  final TextBaseline? textBaseline;

  final Clip clipBehavior;

  final double spacing;
}
