class Brand {
  final int id;
  String description;

  Brand({
    required this.id,
    required this.description,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'] as int,
      description: json['description'] as String,
    );
  }
}
