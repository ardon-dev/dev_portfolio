class Skill {
  final String name;
  final String experience;
  final String description;
  final List<String> tools;
  final String icon;

  Skill({
    required this.name,
    required this.experience,
    required this.description,
    required this.tools,
    required this.icon,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    var jsonTools = json['tools'] as List;
    List<String> tools = jsonTools.map((e) => e.toString()).toList();
    return Skill(
      name: json['name'],
      experience: json['experience'],
      description: json['description'],
      icon: json['icon'],
      tools: tools,
    );
  }
}
