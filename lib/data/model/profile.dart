import 'package:dev_portfolio/data/model/experience.dart';
import 'package:dev_portfolio/data/model/link.dart';

class Profile {
  final String fullName;
  final String aboutText;
  final String role;
  final List<Link> links;
  final List<Experience> experience;

  Profile({
    required this.fullName,
    required this.aboutText,
    required this.links,
    required this.role,
    required this.experience,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    // Links
    var jsonLinks = json['links'] as List;
    List<Link> links = jsonLinks.map((e) => Link.fromJson(e)).toList();
    // Experience
    var jsonExp = json['experience'] as List;
    List<Experience> experience =
        jsonExp.map((e) => Experience.fromJson(e)).toList();
    return Profile(
      fullName: json['fullName'],
      aboutText: json['aboutText'],
      role: json['role'],
      links: links,
      experience: experience,
    );
  }
}
