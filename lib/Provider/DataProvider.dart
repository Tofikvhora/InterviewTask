import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:imperointerview/Model/ApiModal.dart';

class DataProvider extends ChangeNotifier {
  List<Category> category = [];

  bool _isLoading = false;

  set isLoading(bool state) {
    _isLoading = state;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  // Future<void> loadCategory() async {
  //   isLoading = true;
  //   final (cat, status) = await ApiController.fetchDataFromApi(categoryId: 0);
  //   isLoading = false;
  //   if (status) {
  //     category.add(cat);
  //     notifyListeners();
  //   }
  //   notifyListeners();
  // }

  Future<void> fetchData() async {
    final response = await Dio().post(
        'http://esptiles.imperoserver.in/api/API/Product/DashBoard',
        data: {
          "CategoryId": 0,
          "DeviceManufacturer": "Google",
          "DeviceModel": "Android SDK built for x86",
          "DeviceToken": "",
          "PageIndex": 1
        });
    if (response.statusCode == 200) {
      final data = ApiModel.fromJson(response.data);
      category = data.result!.category!;
    } else {
      print("error while fetching api");
    }
  }
}
