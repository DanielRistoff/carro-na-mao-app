import 'dart:convert';
import 'package:carronamao/car_in_hand_app/models/person_vehicle.dart';
import 'package:carronamao/car_in_hand_app/utils/api_util.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

class PersonVehicleApi {
  static void createPersonVehicle(PersonVehicle personVehicle) async {
    await http.post(
      ApiUtil.mountUri('/v1/public/person-vehicle/'),
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
    http.Response response = await http.put(
      ApiUtil.mountUri('/v1/public/person-vehicle/${personVehicle.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "person_information_id": personVehicle.personInformation.id,
        "vehicle_id": personVehicle.vehicle.id
      }),
    );
  }

  static Future<Observable<PersonVehicle>> getPersonInformationByLogin(
    int idPerson,
  ) async {
    http.Response response = await http
        .get(ApiUtil.mountUri('/v1/public/person-vehicle/person/${idPerson}'));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final json = jsonDecode(response.body);
      return Observable<PersonVehicle>(PersonVehicle.fromJson(json));
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      throw Exception('Página não encontrada');
    } else if (response.statusCode > 500) {
      throw Exception('Erro interno no servidor');
    } else {
      throw Exception('Erro desconhecido: ${response.statusCode}');
    }
  }
}
