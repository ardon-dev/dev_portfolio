import 'package:dev_portfolio/data/model/skill.dart';
import 'package:dev_portfolio/main.dart';
import 'package:dev_portfolio/view/components/skill_tool.dart';
import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  final Skill skill;
  final BoxConstraints constraints;

  const SkillCard({super.key, required this.skill, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [_header(context), _skillsView(context)]),
      ),
    );
  }

  Expanded _skillsView(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 16.0),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: context.colorScheme.surface,
              ),
              child: Scrollbar(
                thumbVisibility: true,
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children:
                        skill.tools
                            .map((tool) => SkillTool(tool: tool))
                            .toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _header(BuildContext context) {
    return Row(
      spacing: 16.0,
      children: [
        // Logo
        skill.icon.contains('https')
            ? Image.network(skill.icon, width: 36, height: 36)
            : Image.asset(skill.icon, width: 36, height: 36),
        Expanded(
          child: Column(
            children: [
              // Title
              SizedBox(
                width: double.infinity,
                child: Text(skill.name, style: context.textTheme.titleMedium),
              ),
              // Description
              SizedBox(
                width: double.infinity,
                child: Text(
                  skill.experience,
                  style: context.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Experience
        // Text(
        //   skill.experience,
        //   style: context.textTheme.labelMedium?.copyWith(
        //     fontWeight: FontWeight.bold,
        //     color: context.colorScheme.primary,
        //   ),
        // ),
      ],
    );
  }
}
