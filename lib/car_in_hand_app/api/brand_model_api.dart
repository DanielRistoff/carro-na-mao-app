import 'dart:convert';

import 'package:carronamao/car_in_hand_app/models/brand_model.dart';
import 'package:http/http.dart' as http;

class BrandModelApi {
  static void createBrandModel(BrandModel brandModel) async {
    var uri = Uri(
      scheme: 'http',
      host: '10.0.2.2',
      port: 4200,
      path: '/v1/public/brand-model/',
    );

    await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "brand_id": brandModel.id,
        "description": brandModel.description,
        "vehicle_type": brandModel.vehicleType
      }),
    );
  }

  static void updateBrandModel(BrandModel brandModel) async {
    var uri = Uri(
      scheme: 'http',
      host: '10.0.2.2',
      port: 4200,
      path: '/v1/public/brand-model/${brandModel.id}',
    );

    http.Response response = await http.put(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "brand_id": brandModel.id,
        "description": brandModel.description,
        "vehicle_type": brandModel.vehicleType
      }),
    );
  }
}
