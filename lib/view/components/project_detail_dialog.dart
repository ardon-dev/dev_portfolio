import 'package:dev_portfolio/data/model/project.dart';
import 'package:dev_portfolio/main.dart';
import 'package:dev_portfolio/view/components/link_button.dart';
import 'package:dev_portfolio/view/components/skill_tool.dart';
import 'package:flutter/material.dart';

class ProjectDetailDialog extends StatelessWidget {
  final Project project;
  const ProjectDetailDialog({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(title: Text(project.name)),
        body: Center(child: SizedBox(width: 800, child: _body(context))),
      ),
    );
  }

  ListView _body(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        // Logo
        Image.asset(project.logo, width: 120, height: 120),

        // Description
        SizedBox(height: 16),
        _title(context, 'Descripción'),
        SizedBox(height: 8.0),
        SizedBox(
          width: double.infinity,
          child: Text(project.description, style: context.textTheme.bodyMedium),
        ),

        // Tech stack
        SizedBox(height: 24.0),
        _title(context, 'Tecnologías'),
        SizedBox(height: 8.0),
        _techStack(),

        // Links
        SizedBox(height: 24.0),
        _title(context, 'Enlaces'),
        SizedBox(height: 8.0),
        _links(),

        // Images
        SizedBox(height: 24.0),
        _title(context, 'Imágenes'),
        SizedBox(height: 8.0),
        _imageCarousel(),
      ],
    );
  }

  SizedBox _imageCarousel() {
    return SizedBox(
      width: 300,
      height: 300,
      child: NotificationListener<UserScrollNotification>(
        onNotification: (notification) => true,
        child: CarouselView(
          itemExtent: 180,
          children:
              project.images
                  .map(
                    (e) => Image.asset(
                      e,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }

  Row _links() {
    return Row(
      spacing: 16.0,
      children:
          project.links
              .map((e) => LinkButton(link: e, onClick: () {}))
              .toList(),
    );
  }

  Wrap _techStack() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: project.techonologies.map((e) => SkillTool(tool: e)).toList(),
    );
  }

  SizedBox _title(BuildContext context, String title) {
    return SizedBox(
      width: double.infinity,
      child: Text(title, style: context.textTheme.titleMedium),
    );
  }
}
