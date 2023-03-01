import 'dart:convert';
import 'package:carronamao/car_in_hand_app/models/person_vehicle.dart';
import 'package:http/http.dart' as http;

class PersonVehicleApi {
  static void createPersonVehicle(PersonVehicle personVehicle) async {
    var uri = Uri(
      scheme: 'http',
      host: '10.0.2.2',
      port: 4200,
      path: '/v1/public/person-vehicle/',
    );

    await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "person_information_id": personVehicle.personInformation.id,
        "vehicle_id": personVehicle.vehicle.id
      }),
    );
  }

  static void updatePersonVehicle(PersonVehicle personVehicle) async {
    var uri = Uri(
      scheme: 'http',
      host: '10.0.2.2',
      port: 4200,
      path: '/v1/public/person-vehicle/${personVehicle.id}',
    );

    http.Response response = await http.put(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "person_information_id": personVehicle.personInformation.id,
        "vehicle_id": personVehicle.vehicle.id
      }),
    );
  }
}
