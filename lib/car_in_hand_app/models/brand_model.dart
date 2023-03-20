import 'dart:convert';

import 'package:carronamao/car_in_hand_app/models/brand.dart';
import 'package:carronamao/car_in_hand_app/models/vehicle_type_enum.dart';

class BrandModel {
  final int id;
  final Brand brand;
  String description;
  final VehicleTypeEnum vehicleType;
  BrandModel({
    required this.id,
    required this.brand,
    required this.description,
    required this.vehicleType,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'] as int,
      brand: Brand.fromJson(json['brand']),
      description: json['description'] as String,
      vehicleType: getVehicleTypePerString(json["vehicle_type"]),
    );
  }

  static String toJsonString(BrandModel brandModel) {
    Map<String, dynamic> json = {
      "brand": brandModel.brand.id,
      "description": brandModel.description,
      "vehicleType": brandModel.vehicleType.name,
    };
    return jsonEncode(json);
  }
}
