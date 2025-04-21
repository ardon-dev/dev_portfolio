import 'package:dev_portfolio/data/model/project.dart';
import 'package:dev_portfolio/view/components/project_detail_dialog.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        elevation: 0,
        child: ListTile(
          leading: Image.asset(project.logo),
          title: Text(project.name),
          subtitle: Text(
            project.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ProjectDetailDialog(project: project);
                },
              );
            },
            icon: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ),
      ),
    );
  }
}
