import 'dart:convert';

import 'package:dev_portfolio/data/model/project.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ProjectRepository {
  Future<List<Project>> loadProjects() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/projects.json',
    );
    final List<dynamic> jsonData = json.decode(jsonString);
    List<Project> projects = jsonData.map((e) => Project.fromJson(e)).toList();
    return projects;
  }

  Future<List<Project>?> fetchProjectsFromWeb() async {
    final response = await http.get(
      Uri.parse(
        'https://raw.githubusercontent.com/ardon-dev/dev_portfolio/refs/heads/main/assets/data/projects.json',
      ),
    );
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body) as List;
      List<Project> projects =
          decodedJson.map((e) => Project.fromJson(e)).toList();
      return projects;
    } else {
      return null;
    }
  }
}
