import 'package:dev_portfolio/data/model/skill.dart';
import 'package:dev_portfolio/main.dart';
import 'package:dev_portfolio/view/components/skill_tool.dart';
import 'package:flutter/material.dart';

class SkillDetailDialog extends StatefulWidget {
  const SkillDetailDialog({super.key, required this.skill});

  final Skill skill;

  @override
  State<SkillDetailDialog> createState() => _SkillDetailDialogState();
}

class _SkillDetailDialogState extends State<SkillDetailDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 24,
      scrollable: true,
      // Actions
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Salir'),
        ),
      ],

      // Content
      content: Column(
        children: [
          SizedBox(
            width: 400,
            height: 400,
            child: ListView(
              children: [
                // Image
                Image.network(widget.skill.icon, width: 48, height: 48),
                SizedBox(height: 8.0),

                // Name
                Text(
                  widget.skill.name,
                  style: context.textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0),

                // Description
                Text(
                  widget.skill.description,
                  style: context.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),

                // Dev stack
                Text(
                  textAlign: TextAlign.center,
                  'Stack:',
                  style: context.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children:
                      widget.skill.tools
                          .map((e) => SkillTool(tool: e))
                          .toList(),
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
