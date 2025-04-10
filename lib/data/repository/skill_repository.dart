import 'dart:convert';

import 'package:dev_portfolio/data/model/skill.dart';
import 'package:flutter/services.dart';

class SkillRepository {
  Future<List<Skill>> loadSkills() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/skills.json',
    );
    final List<dynamic> jsonData = json.decode(jsonString);
    List<Skill> skills = jsonData.map((e) => Skill.fromJson(e)).toList();
    return skills;
  }
}
