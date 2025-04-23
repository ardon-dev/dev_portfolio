import 'package:dev_portfolio/view/components/project_card.dart';
import 'package:dev_portfolio/viewmodel/projects_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProjectsViewmodel>(context);
    viewModel.fetchProjects();
    var projectWidgets =
        viewModel.projects.map((e) => ProjectCard(project: e)).toList();

    return SizedBox(
      width: 800,
      child: GridView.extent(
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        maxCrossAxisExtent: 200,
        padding: EdgeInsets.all(16.0),
        children: projectWidgets,
      ),
    );
  }
}
