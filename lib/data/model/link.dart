class Link {
  final String title;
  final String url;
  final String iconUrl;

  Link({required this.title, required this.url, required this.iconUrl});

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      title: json['title'],
      url: json['url'],
      iconUrl: json['iconUrl'],
    );
  }
}
