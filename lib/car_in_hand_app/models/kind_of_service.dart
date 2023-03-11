class KindOfService {
  final int? id;
  final String description;

  KindOfService({
    this.id,
    required this.description,
  });

  factory KindOfService.fromJson(Map<String, dynamic> json) {
    return KindOfService(
      id: json['id'] as int,
      description: json['description'] as String,
    );
  }
}
