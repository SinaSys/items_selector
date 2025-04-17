import 'package:flutter/material.dart';

sealed class ChipConfiguration implements ChipAttributes {
  ChipConfiguration({
    required this.label,
    this.clipBehavior = Clip.none,
    this.autofocus = false,
    this.avatar,
    this.labelStyle,
    this.labelPadding,
    this.side,
    this.shape,
    this.focusNode,
    this.color,
    this.backgroundColor,
    this.padding,
    this.visualDensity,
    this.materialTapTargetSize,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.iconTheme,
    this.avatarBoxConstraints,
    this.chipAnimationStyle,
  });

  @override
  final Widget? avatar;
  @override
  final Widget label;
  @override
  final TextStyle? labelStyle;
  @override
  final EdgeInsetsGeometry? labelPadding;
  @override
  final BorderSide? side;
  @override
  final OutlinedBorder? shape;
  @override
  final Clip clipBehavior;
  @override
  final FocusNode? focusNode;
  @override
  final bool autofocus;
  @override
  final WidgetStateProperty<Color?>? color;
  @override
  final Color? backgroundColor;
  @override
  final EdgeInsetsGeometry? padding;
  @override
  final VisualDensity? visualDensity;
  @override
  final MaterialTapTargetSize? materialTapTargetSize;
  @override
  final double? elevation;
  @override
  final Color? shadowColor;
  @override
  final Color? surfaceTintColor;
  @override
  final IconThemeData? iconTheme;
  @override
  final BoxConstraints? avatarBoxConstraints;
  @override
  final ChipAnimationStyle? chipAnimationStyle;
}

class ActionChipConfiguration extends ChipConfiguration implements TappableChipAttributes, DisabledChipAttributes {
  /// const ActionChip.elevated({})
  ///   final _ChipVariant _chipVariant;
  ActionChipConfiguration({
    required super.label,
    super.clipBehavior = Clip.none,
    super.autofocus = false,
    super.avatar,
    super.labelStyle,
    super.labelPadding,
    super.side,
    super.shape,
    super.focusNode,
    super.color,
    super.backgroundColor,
    super.padding,
    super.visualDensity,
    super.materialTapTargetSize,
    super.elevation,
    super.shadowColor,
    super.surfaceTintColor,
    super.iconTheme,
    super.avatarBoxConstraints,
    super.chipAnimationStyle,
    this.disabledColor,
    this.onPressed,
    this.pressElevation,
    this.tooltip,
  });

  @override
  final Color? disabledColor;

  @override
  final VoidCallback? onPressed;

  @override
  final double? pressElevation;

  @override
  final String? tooltip;

  @override
  bool get isEnabled => onPressed != null;
}

class FilterChipConfiguration extends ChipConfiguration
    implements DeletableChipAttributes, SelectableChipAttributes, CheckmarkableChipAttributes, DisabledChipAttributes {
  FilterChipConfiguration({
    required super.label,
    super.clipBehavior = Clip.none,
    super.autofocus = false,
    super.avatar,
    super.labelStyle,
    super.labelPadding,
    super.side,
    super.shape,
    super.focusNode,
    super.color,
    super.backgroundColor,
    super.padding,
    super.visualDensity,
    super.materialTapTargetSize,
    super.elevation,
    super.shadowColor,
    super.surfaceTintColor,
    super.iconTheme,
    super.avatarBoxConstraints,
    super.chipAnimationStyle,
    this.avatarBorder = const CircleBorder(),
    this.checkmarkColor,
    this.deleteButtonTooltipMessage,
    this.deleteIcon,
    this.deleteIconBoxConstraints,
    this.deleteIconColor,
    this.disabledColor,
    this.onDeleted,
    this.onSelected,
    this.pressElevation,
    this.selected = false,
    this.selectedColor,
    this.selectedShadowColor,
    this.showCheckmark,
    this.tooltip,
  });

  @override
  final ShapeBorder avatarBorder;

  @override
  final Color? checkmarkColor;

  @override
  final String? deleteButtonTooltipMessage;

  @override
  final Widget? deleteIcon;

  @override
  final BoxConstraints? deleteIconBoxConstraints;

  @override
  final Color? deleteIconColor;

  @override
  final Color? disabledColor;

  @override
  final VoidCallback? onDeleted;

  @override
  final ValueChanged<bool>? onSelected;

  @override
  final double? pressElevation;

  @override
  final bool selected;

  @override
  final Color? selectedColor;

  @override
  final Color? selectedShadowColor;

  @override
  final bool? showCheckmark;

  @override
  final String? tooltip;

  @override
  bool get isEnabled => onSelected != null;
}

class ChoiceChipConfiguration extends ChipConfiguration
    implements SelectableChipAttributes, CheckmarkableChipAttributes, DisabledChipAttributes {
  ChoiceChipConfiguration({
    required super.label,
    super.clipBehavior = Clip.none,
    super.autofocus = false,
    super.avatar,
    super.labelStyle,
    super.labelPadding,
    super.side,
    super.shape,
    super.focusNode,
    super.color,
    super.backgroundColor,
    super.padding,
    super.visualDensity,
    super.materialTapTargetSize,
    super.elevation,
    super.shadowColor,
    super.surfaceTintColor,
    super.iconTheme,
    super.avatarBoxConstraints,
    super.chipAnimationStyle,
    this.avatarBorder = const CircleBorder(),
    this.checkmarkColor,
    this.disabledColor,
    this.onSelected,
    this.pressElevation,
    required this.selected,
    this.selectedColor,
    this.selectedShadowColor,
    this.showCheckmark,
    this.tooltip,
  });

  @override
  final ShapeBorder avatarBorder;

  @override
  final Color? checkmarkColor;

  @override
  final Color? disabledColor;

  @override
  bool get isEnabled => onSelected != null;

  @override
  final ValueChanged<bool>? onSelected;

  @override
  final double? pressElevation;

  @override
  final bool selected;

  @override
  final Color? selectedColor;

  @override
  final Color? selectedShadowColor;

  @override
  final bool? showCheckmark;

  @override
  final String? tooltip;
}

class InputChipConfiguration extends ChipConfiguration
    implements
        DeletableChipAttributes,
        SelectableChipAttributes,
        CheckmarkableChipAttributes,
        DisabledChipAttributes,
        TappableChipAttributes {
  InputChipConfiguration({
    required super.label,
    super.clipBehavior = Clip.none,
    super.autofocus = false,
    super.avatar,
    super.labelStyle,
    super.labelPadding,
    super.side,
    super.shape,
    super.focusNode,
    super.color,
    super.backgroundColor,
    super.padding,
    super.visualDensity,
    super.materialTapTargetSize,
    super.elevation,
    super.shadowColor,
    super.surfaceTintColor,
    super.iconTheme,
    super.avatarBoxConstraints,
    super.chipAnimationStyle,
    this.avatarBorder = const CircleBorder(),
    this.checkmarkColor,
    this.deleteButtonTooltipMessage,
    this.deleteIcon,
    this.deleteIconBoxConstraints,
    this.deleteIconColor,
    this.disabledColor,
    this.onDeleted,
    this.onPressed,
    this.onSelected,
    this.pressElevation,
    this.selected = false,
    this.selectedColor,
    this.selectedShadowColor,
    this.showCheckmark,
    this.tooltip,
  });

  @override
  final ShapeBorder avatarBorder;

  @override
  final Color? checkmarkColor;

  @override
  final String? deleteButtonTooltipMessage;

  @override
  final Widget? deleteIcon;

  @override
  final BoxConstraints? deleteIconBoxConstraints;

  @override
  final Color? deleteIconColor;

  @override
  final Color? disabledColor;

  @override
  final VoidCallback? onDeleted;

  @override
  final VoidCallback? onPressed;

  @override
  final ValueChanged<bool>? onSelected;

  @override
  final double? pressElevation;

  @override
  final bool selected;

  @override
  final Color? selectedColor;

  @override
  final Color? selectedShadowColor;

  @override
  final bool? showCheckmark;

  @override
  final String? tooltip;

  @override
  bool get isEnabled => onSelected != null;
}

class ChipSelector extends StatefulWidget {
  const ChipSelector({
    super.key,
    required this.items,
    required this.chipConfiguration,
  });

  final List<Chip> items;
  final ChipConfiguration chipConfiguration;

  const ChipSelector.actionChip({
    super.key,
    required this.items,
    required ActionChipConfiguration configuration,
  }) : chipConfiguration = configuration;

  @override
  State<ChipSelector> createState() => _ChipSelectorState();
}

class _ChipSelectorState extends State<ChipSelector> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(widget.items.length, (index) {
        ActionChipConfiguration configuration = widget.chipConfiguration as ActionChipConfiguration;
        return ActionChip(
          label: configuration.label,
          shape: configuration.shape,
          color: configuration.color,
          visualDensity: configuration.visualDensity,
          materialTapTargetSize: configuration.materialTapTargetSize,
          focusNode: configuration.focusNode,
          autofocus: configuration.autofocus,
          padding: configuration.padding,
          clipBehavior: configuration.clipBehavior,
          avatar: configuration.avatar,
          avatarBoxConstraints: configuration.avatarBoxConstraints,
          backgroundColor: configuration.backgroundColor,
          chipAnimationStyle: configuration.chipAnimationStyle,
          disabledColor: configuration.disabledColor,
          elevation: configuration.elevation,
          iconTheme: configuration.iconTheme,
          labelPadding: configuration.labelPadding,
          labelStyle: configuration.labelStyle,
          onPressed: configuration.onPressed,
          pressElevation: configuration.pressElevation,
          shadowColor: configuration.shadowColor,
          side: configuration.side,
          surfaceTintColor: configuration.surfaceTintColor,
          tooltip: configuration.tooltip,
        );
      }),
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
