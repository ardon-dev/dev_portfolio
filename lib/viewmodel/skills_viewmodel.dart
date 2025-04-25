import 'package:dev_portfolio/data/model/skill.dart';
import 'package:dev_portfolio/data/repository/skill_repository.dart';
import 'package:flutter/foundation.dart';

class SkillsViewmodel with ChangeNotifier {
  SkillRepository repository = SkillRepository();

  List<Skill> _skills = [];
  List<Skill> get skills => _skills;

  Future<void> fetchSkills() async {
    var skills = await repository.fetchSkillsFromWeb();
    if (skills != null) {
      _skills = skills;
    }
    notifyListeners();
  }
}
