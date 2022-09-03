import 'package:carronamao/car_in_hand_app/models/vehicle.dart';

class Car extends Vehicle {
  final int? id;
  final String vin;
  final DateTime created;
  final DateTime? update;

  Car({
    this.id,
    required brand,
    required model,
    required year,
    required this.vin,
    required this.created,
    this.update,
  }) : super(brand: brand, model: model, year: year);
}
