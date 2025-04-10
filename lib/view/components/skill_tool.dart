import 'package:dev_portfolio/main.dart';
import 'package:flutter/material.dart';

class SkillTool extends StatelessWidget {
  final String tool;
  const SkillTool({super.key, required this.tool});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(tool),
      side: BorderSide(style: BorderStyle.none),
      backgroundColor: context.colorScheme.surfaceContainerHigh,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      labelStyle: context.textTheme.labelSmall,
      labelPadding: EdgeInsets.all(0),
    );
  }
}
