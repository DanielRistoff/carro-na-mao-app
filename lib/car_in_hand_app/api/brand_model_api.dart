import 'package:carronamao/car_in_hand_app/models/brand_model.dart';
import 'package:carronamao/car_in_hand_app/utils/api_util.dart';
import 'package:http/http.dart' as http;

class BrandModelApi {
  static void createBrandModel(BrandModel brandModel) async {
    await http.post(
      ApiUtil.mountUri('/v1/public/brand-model/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: BrandModel.toJsonString(brandModel),
    );
  }

  static void updateBrandModel(BrandModel brandModel) async {
    http.Response response = await http.put(
      ApiUtil.mountUri('/v1/public/brand-model/${brandModel.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: BrandModel.toJsonString(brandModel),
    );
  }
}
