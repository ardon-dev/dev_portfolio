import 'package:dev_portfolio/data/model/skill.dart';
import 'package:dev_portfolio/main.dart';
import 'package:dev_portfolio/view/components/skill_detail_dialog.dart';
import 'package:flutter/material.dart';

class SkillCard extends StatefulWidget {
  final Skill skill;

  const SkillCard({super.key, required this.skill});

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool isHover = false;
  void _setHover(bool value) {
    setState(() {
      isHover = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return SkillDetailDialog(skill: widget.skill);
          },
        );
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          _setHover(true);
        },
        onExit: (event) {
          _setHover(false);
        },
        child: Card(
          elevation: isHover ? 4 : 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _header(context, isHover),
          ),
        ),
      ),
    );
  }

  Column _header(BuildContext context, bool isHover) {
    double size = isHover ? 52 : 36;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Logo
        widget.skill.icon.contains('https')
            ? Image.network(widget.skill.icon, width: size, height: size)
            : Image.asset(widget.skill.icon, width: size, height: size),
        SizedBox(height: 8.0),
        Flexible(
          child: SizedBox(
            width: double.infinity,
            child: Text(
              widget.skill.name,
              style: context.textTheme.titleMedium,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
        ),
        // Description
        SizedBox(
          width: double.infinity,
          child: Text(
            textAlign: TextAlign.center,
            widget.skill.experience,
            style: context.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
