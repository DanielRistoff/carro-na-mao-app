import 'package:carronamao/car_in_hand_app/models/person_information.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:carronamao/car_in_hand_app/utils/api_util.dart';

class PersonInformationApi {
  static void createPersonInformation(
    PersonInformation personInformation,
  ) async {
    try {
      Observable<PersonInformation> observablePersonInformation =
          await getPersonInformationByLogin(personInformation);
      PersonInformation personInformationCreate =
          observablePersonInformation.value;

      if (personInformationCreate.id != 0) {
        http.Response response = await http.post(
          ApiUtil.mountUri('/v1/public/person-information/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: PersonInformation.toJsonString(personInformation, false),
        );
        ApiUtil.responseJsonUtil(response, 'Problema para criar os dados');
      }
    } catch (e) {
      throw Exception(e);
    }
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
    http.Response response = await http.get(
      ApiUtil.mountUri(
          '/v1/public/person-information/login/${personInformation.login}'),
    );

    var dadosJson = ApiUtil.responseJsonUtil(
        response, 'Problema para buscar informações do usuário');

    return Observable<PersonInformation>(
      PersonInformation.fromJson(dadosJson[0]),
    );
  }
}
