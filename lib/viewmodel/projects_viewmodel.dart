import 'package:dev_portfolio/data/model/project.dart';
import 'package:dev_portfolio/data/repository/project_repository.dart';
import 'package:flutter/widgets.dart';

class ProjectsViewmodel with ChangeNotifier {
  ProjectRepository repository = ProjectRepository();

  List<Project> _projects = [];
  List<Project> get projects => _projects;

  Future<void> fetchProjects() async {
    _projects = await repository.loadProjects();
    notifyListeners();
  }
}
