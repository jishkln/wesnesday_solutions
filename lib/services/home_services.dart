import 'package:dio/dio.dart';
import 'package:wednusday_solutions/helper/helper.dart';
import 'package:wednusday_solutions/model/home_model.dart'; 
class HomeService {
  static final Dio dio = Dio();
  static Future<List<ItemsModel>?> getData() async {
    try {
      final Response response = await dio.get(Helpers.homeUrl.trim());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<ItemsModel> list =
            (response.data as List).map((e) => ItemsModel.fromJson(e)).toList();
        return list;
      }
    } catch (e) {
      Helpers.errorHandler(e);
    }
    return null;
  }
}
