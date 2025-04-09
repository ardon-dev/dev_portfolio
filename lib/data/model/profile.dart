import 'package:dev_portfolio/data/model/link.dart';

class Profile {
  final String fullName;
  final String aboutText;
  final List<Link> links;

  Profile({
    required this.fullName,
    required this.aboutText,
    required this.links,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    var jsonLinks = json['links'] as List;
    List<Link> links = jsonLinks.map((e) => Link.fromJson(e)).toList();
    return Profile(
      fullName: json['fullName'],
      aboutText: json['aboutText'],
      links: links,
    );
  }
}
