import 'package:flutter/material.dart';

class WidgetAppBar extends StatelessWidget {
  final Widget title;
  final bool? centerTitle;
  final Color backgroundColor;
  final Color? surfaceTintColor;
  final List<Widget>? actions;
  final Widget? leading;

  const WidgetAppBar({
    super.key,
    this.centerTitle=true,
    required this.title,
    required this.backgroundColor,
    this.surfaceTintColor,
    this.actions,
    this.leading
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      centerTitle: centerTitle,
      surfaceTintColor: surfaceTintColor,
      backgroundColor: backgroundColor,
      title: title,
      actions: actions,
    );
  }
}
