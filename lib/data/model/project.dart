class Project {
  final String name;
  final String description;
  final String company;
  final String logo;
  final List<String> techonologies;
  final List<String> images;

  Project({
    required this.name,
    required this.description,
    required this.company,
    required this.logo,
    required this.techonologies,
    required this.images,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    // Technologies
    var jsonTechs = json['technologies'] as List;
    List<String> techonologies = jsonTechs.map((e) => e.toString()).toList();
    // Images
    var jsonImages = json['images'] as List;
    List<String> images = jsonImages.map((e) => e.toString()).toList();
    return Project(
      name: json['name'] as String,
      description: json['description'] as String,
      company: json['company'] as String,
      logo: json['logo'] as String,
      techonologies: techonologies,
      images: images,
    );
  }
}
