import 'dart:convert';

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

  static String toJsonString(KindOfService kindOfService) {
    Map<String, dynamic> json = {
      "description": kindOfService.description,
    };
    return jsonEncode(json);
  }
}
