import 'package:dev_portfolio/view/components/skill_card.dart';
import 'package:dev_portfolio/viewmodel/skills_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SkillsViewmodel>(context);
    viewModel.fetchSkills();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double extend;
            double ratio;
            switch (constraints.maxWidth) {
              case < 600:
                extend = constraints.maxWidth;
                ratio = 1;
              case >= 600 && <= 900:
                extend = constraints.maxWidth / 2;
                ratio = 1.5;
              case > 900:
                extend = constraints.maxWidth / 3;
                ratio = 1.5;
              default:
                ratio = 1;
                extend = constraints.maxWidth;
            }

            return GridView.extent(
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              maxCrossAxisExtent: extend,
              shrinkWrap: true,
              childAspectRatio: ratio,
              children:
                  viewModel.skills
                      .map(
                        (skill) =>
                            SkillCard(skill: skill, constraints: constraints),
                      )
                      .toList(),
            );
          },
        ),
      ),
    );
  }
}
