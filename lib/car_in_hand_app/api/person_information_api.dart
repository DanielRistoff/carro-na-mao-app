import 'dart:convert';
import 'package:carronamao/car_in_hand_app/models/person_information.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:carronamao/car_in_hand_app/utils/api_util.dart';

class PersonInformationApi {
  static void createPersonInformation(
    PersonInformation personInformation,
  ) async {
    await http.post(
      ApiUtil.mountUri('/v1/public/person-information/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: PersonInformation.toJsonString(personInformation, false),
    );
  }

  static void updatePersonInformation(
    PersonInformation personInformation,
  ) async {
    http.Response response = await http.put(
      ApiUtil.mountUri('/v1/public/person-information/${personInformation.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: PersonInformation.toJsonString(personInformation, true),
    );
  }

  static Future<Observable<PersonInformation>> getPersonInformationByLogin(
    PersonInformation personInformation,
  ) async {
    http.Response response = await http.get(ApiUtil.mountUri(
        '/v1/public/person-information/login/${personInformation.login}'));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final json = jsonDecode(response.body);
      return Observable<PersonInformation>(PersonInformation.fromJson(json));
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      throw Exception('Página não encontrada');
    } else if (response.statusCode > 500) {
      throw Exception('Erro interno no servidor');
    } else {
      throw Exception('Erro desconhecido: ${response.statusCode}');
    }
  }
}
