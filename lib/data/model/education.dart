class Education {
  final String institution;
  final String career;
  final String startDate;
  final String endDate;
  final String status;
  final String description;
  final String logo;
  final String location;

  Education({
    required this.institution,
    required this.career,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.description,
    required this.logo,
    required this.location,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      institution: json['institution'] as String,
      career: json['career'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      status: json['status'] as String,
      description: json['description'] as String,
      logo: json['logo'] as String,
      location: json['location'] as String,
    );
  }
}
