import 'package:carronamao/car_in_hand_app/models/person_information.dart';
import 'package:carronamao/car_in_hand_app/models/vehicle.dart';

class PersonVehicle {
  final int id;
  final PersonInformation personInformation;
  final Vehicle vehicle;
  PersonVehicle({
    required this.id,
    required this.personInformation,
    required this.vehicle,
  });

  factory PersonVehicle.fromJson(Map<String, dynamic> json) {
    return PersonVehicle(
      id: json['id'] as int,
      personInformation: PersonInformation.fromJson(json['person_information']),
      vehicle: Vehicle.fromJson(json['vehicle']),
    );
  }
}
