import 'dart:convert';

import 'package:dev_portfolio/data/model/project.dart';
import 'package:flutter/services.dart';

class ProjectRepository {
  Future<List<Project>> loadProjects() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/projects.json',
    );
    final List<dynamic> jsonData = json.decode(jsonString);
    List<Project> projects = jsonData.map((e) => Project.fromJson(e)).toList();
    return projects;
  }
}
