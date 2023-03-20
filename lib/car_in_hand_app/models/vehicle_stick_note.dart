import 'dart:convert';
import 'package:carronamao/car_in_hand_app/models/stick_note.dart';
import 'package:carronamao/car_in_hand_app/models/vehicle.dart';

class VehicleStickNote {
  final int id;
  final Vehicle vehicle;
  final StickNote stickNote;

  VehicleStickNote({
    required this.id,
    required this.vehicle,
    required this.stickNote,
  });

  factory VehicleStickNote.fromJson(Map<String, dynamic> json) {
    return VehicleStickNote(
      id: json['id'] as int,
      vehicle: Vehicle.fromJson(json['vehicle']),
      stickNote: StickNote.fromJson(json['stick_note']),
    );
  }

  static String toJsonString(VehicleStickNote vehicleStickNote) {
    Map<String, dynamic> json = {
      "vehicle": vehicleStickNote.vehicle.id,
      "stick_note": vehicleStickNote.stickNote.id,
    };
    return jsonEncode(json);
  }
}
