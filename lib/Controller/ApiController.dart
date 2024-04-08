import 'package:dio/dio.dart';

class ApiController {
  static Future<(List data, bool status)> fetchDataFromApi(
      {int categoryId = 0, int page = 1}) async {
    try {
      final res = await Dio().post(
        "http://esptiles.imperoserver.in/api/API/Product/DashBoard",
        data: {
          "CategoryId": categoryId,
          "DeviceManufacturer": "Google",
          "DeviceModel": "Android SDK built for x86",
          "DeviceToken": "",
          "PageIndex": page
        },
      );
      return ((res.data['Result']['Category'] ?? []) as List, true);
    } on DioException catch (dioError) {
      return ([], false);
    } catch (e) {
      return ([], false);
    }
  }
}
