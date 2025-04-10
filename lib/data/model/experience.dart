class Experience {
  final String place;
  final String role;
  final String startDate;
  final String endDate;
  final String description;
  final String location;
  final String logo;

  Experience({
    required this.place,
    required this.role,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.location,
    required this.logo,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      place: json['place'],
      role: json['role'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      description: json['description'],
      location: json['location'],
      logo: json['logo'],
    );
  }
}
