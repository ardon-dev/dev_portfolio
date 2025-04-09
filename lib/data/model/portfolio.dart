import 'package:dev_portfolio/data/model/profile.dart';

class Portfolio {
  final Profile profile;

  Portfolio({required this.profile});

  factory Portfolio.fromJson(Map<String, dynamic> json) {
    var jsonProfile = json['profile'];
    var profile = Profile.fromJson(jsonProfile);
    return Portfolio(profile: profile);
  }
}
