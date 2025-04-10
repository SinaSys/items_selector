import 'package:flutter/material.dart';

@immutable
class CheckBoxSelectorItem extends CheckboxListTile {
  const CheckBoxSelectorItem({
    super.key,
    //  bool? value,
    //ValueChanged<bool?>? onChanged,
    super.activeColor,
    super.autofocus,
    super.checkboxScaleFactor,
    super.checkboxSemanticLabel,
    super.checkboxShape,
    super.checkColor,
    super.contentPadding,
    super.controlAffinity,
    super.dense,
    super.enabled,
    super.enableFeedback,
    super.fillColor,
    super.focusNode,
    super.hoverColor,
    super.internalAddSemanticForOnTap,
    super.isThreeLine,
    super.isError,
    super.materialTapTargetSize,
    super.mouseCursor,
    super.onFocusChange,
    super.overlayColor,
    super.secondary,
    super.selected,
    super.selectedTileColor,
    super.shape,
    super.side,
    super.splashRadius,
    super.subtitle,
    super.tileColor,
    super.title,
    super.tristate,
    super.visualDensity,
  }) : super(
          onChanged: null,
          value: false,
        );

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    final Map<String, dynamic> props = {
      'key': key,
      'activeColor': activeColor,
      'autofocus': autofocus == false ? null : autofocus,
      'checkboxScaleFactor': checkboxScaleFactor == 1.0 ? null : checkboxScaleFactor,
      'checkboxSemanticLabel': checkboxSemanticLabel,
      'checkboxShape': checkboxShape,
      'checkColor': checkColor,
      'contentPadding': contentPadding,
      'controlAffinity': controlAffinity,
      'dense': dense,
      'enabled': enabled,
      'enableFeedback': enableFeedback,
      'fillColor': fillColor,
      'focusNode': focusNode,
      'hoverColor': hoverColor,
      'internalAddSemanticForOnTap': internalAddSemanticForOnTap == false ? null : internalAddSemanticForOnTap,
      'isThreeLine': isThreeLine == false ? null : isThreeLine,
      'isError': isError == false ? null : isError,
      'materialTapTargetSize': materialTapTargetSize,
      'mouseCursor': mouseCursor,
      'onFocusChange': onFocusChange,
      'overlayColor': overlayColor,
      'secondary': secondary,
      'selected': selected == false ? null : selected,
      'selectedTileColor': selectedTileColor,
      'shape': shape,
      'side': side,
      'splashRadius': splashRadius,
      'subtitle': subtitle,
      'tileColor': tileColor,
      'title': title,
      'tristate': tristate == false ? null : tristate,
      'visualDensity': visualDensity,
    };

    final buffer = StringBuffer('CheckBoxSelectorItem(\n');

    props.forEach((key, value) {
      if (value != null) {
        buffer.writeln('  $key: $value,');
      }
    });

    buffer.write(')');
    return buffer.toString();
  }
}

class CheckBoxSelectorOption extends CheckBoxSelectorItem {
  const CheckBoxSelectorOption({
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.clipBehavior = Clip.none,
    this.spacing = 0.0,
    super.key,
    super.activeColor,
    super.checkboxScaleFactor,
    super.checkboxSemanticLabel,
    super.checkboxShape,
    super.checkColor,
    super.contentPadding,
    super.controlAffinity,
    super.dense,
    super.enabled,
    super.enableFeedback,
    super.fillColor,
    super.focusNode,
    super.hoverColor,
    super.isError,
    super.materialTapTargetSize,
    super.mouseCursor,
    super.onFocusChange,
    super.overlayColor,
    super.secondary,
    super.selectedTileColor,
    super.shape,
    super.side,
    super.splashRadius,
    super.subtitle,
    super.tileColor,
    super.tristate,
    super.visualDensity,
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
