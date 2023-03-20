import 'package:carronamao/car_in_hand_app/models/brand_model_year.dart';
import 'package:carronamao/car_in_hand_app/utils/api_util.dart';
import 'package:http/http.dart' as http;

class BrandModelYearApi {
  static void createBrandModelYear(BrandModelYear brandModelYear) async {
    await http.post(
      ApiUtil.mountUri('/v1/public/brand-model-year/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: BrandModelYear.toJsonString(brandModelYear),
    );
  }

  static void updateBrandModelYear(BrandModelYear brandModelYear) async {
    http.Response response = await http.put(
      ApiUtil.mountUri('/v1/public/brand-model-year/${brandModelYear.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: BrandModelYear.toJsonString(brandModelYear),
    );
  }
}
