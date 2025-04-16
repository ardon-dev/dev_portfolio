import 'package:dev_portfolio/view/components/project_card.dart';
import 'package:dev_portfolio/viewmodel/projects_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProjectsViewmodel>(context);
    viewModel.fetchProjects();

    return SizedBox(
      width: 800,
      child: ListView(
        padding: EdgeInsets.all(16.0),
        children:
            viewModel.projects.map((e) => ProjectCard(project: e)).toList(),
      ),
    );
  }
}
