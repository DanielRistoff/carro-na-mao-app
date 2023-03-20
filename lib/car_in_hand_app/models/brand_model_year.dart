import 'dart:convert';
import 'package:carronamao/car_in_hand_app/models/brand_model.dart';

class BrandModelYear {
  final int id;
  final BrandModel brandModel;
  String year;
  BrandModelYear({
    required this.id,
    required this.brandModel,
    required this.year,
  });

  factory BrandModelYear.fromJson(Map<String, dynamic> json) {
    return BrandModelYear(
      id: json['id'] as int,
      brandModel: BrandModel.fromJson(json['brand_model']),
      year: json['year'] as String,
    );
  }

  static String toJsonString(BrandModelYear brandModelYear) {
    Map<String, dynamic> json = {
      "brand_model": brandModelYear.brandModel.id,
      "year": brandModelYear.year,
    };
    return jsonEncode(json);
  }
}
