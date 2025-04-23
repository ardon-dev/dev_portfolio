import 'dart:ui';

import 'package:dev_portfolio/data/model/project.dart';
import 'package:dev_portfolio/main.dart';
import 'package:dev_portfolio/view/components/project_detail_dialog.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  // Hover state
  bool isHover = false;
  void _setHover(bool value) {
    setState(() {
      isHover = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double blur = isHover ? 20.0 : 0;

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ProjectDetailDialog(project: widget.project);
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
          elevation: isHover ? 12 : 0,
          child: Container(
            decoration: _imgBackgroundDecoration(),
            child: _blurContainer(blur, context),
          ),
        ),
      ),
    );
  }

  BoxDecoration _imgBackgroundDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      image: DecorationImage(
        image: AssetImage(widget.project.logo),
        fit: BoxFit.cover,
      ),
    );
  }

  ClipRRect _blurContainer(double blur, BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(child: isHover ? _title(context) : SizedBox()),
        ),
      ),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      widget.project.name,
      style: context.textTheme.titleMedium?.copyWith(
        color: Colors.white,
        shadows: [
          Shadow(offset: Offset(3.0, 0), blurRadius: 20.0, color: Colors.black),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
