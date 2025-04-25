import 'dart:convert';

import 'package:dev_portfolio/data/model/skill.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class SkillRepository {
  Future<List<Skill>> loadSkills() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/skills.json',
    );
    final List<dynamic> jsonData = json.decode(jsonString);
    List<Skill> skills = jsonData.map((e) => Skill.fromJson(e)).toList();
    return skills;
  }

  Future<List<Skill>?> fetchSkillsFromWeb() async {
    final response = await http.get(
      Uri.parse(
        'https://raw.githubusercontent.com/ardon-dev/dev_portfolio/refs/heads/main/assets/data/skills.json',
      ),
    );
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body) as List;
      List<Skill> skills = decodedJson.map((e) => Skill.fromJson(e)).toList();
      return skills;
    } else {
      return null;
    }
  }
}
