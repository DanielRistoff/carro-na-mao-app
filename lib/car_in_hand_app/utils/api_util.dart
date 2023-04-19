import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

class ApiUtil {
  static Uri mountUri(String path) {
    var uri = Uri(
      scheme: 'http',
      host: '10.0.2.2',
      port: 4200,
      path: path,
    );
    return uri;
  }

  static List<dynamic> responseJsonUtil(
    http.Response response,
    String messageException,
  ) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      throw Exception(messageException);
    } else if (response.statusCode > 500) {
      throw Exception('Erro interno no servidor');
    } else {
      throw Exception('Erro desconhecido: ${response.statusCode}');
    }
  }

  // static Future<Observable<T>> getJsonData<T>(
  //   String endpoint,
  //   Function(Map<String, dynamic>) mapperFunction,
  // ) async {
  //   final url = mountUri(endpoint);
  //   final response = await http.get(url);

  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     List<dynamic> dataJson = json.decode(response.body);
  //     if (dataJson.isNotEmpty) {
  //       final data = dataJson.map((item) => mapperFunction(item)).toList();
  //       return Observable<T>.fromIterable(data);
  //     } else {
  //       return Observable<T>.empty();
  //     }
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }
}
