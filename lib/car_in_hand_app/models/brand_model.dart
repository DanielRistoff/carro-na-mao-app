import 'package:carronamao/car_in_hand_app/models/brand.dart';
import 'package:carronamao/car_in_hand_app/models/person_information.dart';
import 'package:carronamao/car_in_hand_app/models/vehicle_type_enum.dart';

class BrandModel {
  final int id;
  final Brand brand;
  final String description;
  final VehicleTypeEnum vehicleType;
  BrandModel({
    required this.id,
    required this.brand,
    required this.description,
    required this.vehicleType,
  });
}
