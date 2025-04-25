import 'package:dev_portfolio/view/components/skill_card.dart';
import 'package:dev_portfolio/viewmodel/skills_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<SkillsViewmodel>();
      viewModel.fetchSkills();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SkillsViewmodel>(context);
    var skillWidgets =
        viewModel.skills.map((skill) => SkillCard(skill: skill)).toList();

    return SizedBox(
      width: 800,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.extent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: skillWidgets,
        ),
      ),
    );
  }
}
