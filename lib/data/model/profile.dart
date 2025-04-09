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
}
