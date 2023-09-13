class AboutTheHotel {
  AboutTheHotel({
    required this.description,
    required this.peculiarities,
  });

  final String? description;
  final List<dynamic?>? peculiarities;

  factory AboutTheHotel.fromJson(Map<String, dynamic> json) {
    return AboutTheHotel(
      description: json['description'] as String?,
      peculiarities: json['peculiarities'] as List<dynamic?>?,
    );
  }
}
