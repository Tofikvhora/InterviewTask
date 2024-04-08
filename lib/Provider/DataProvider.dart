import 'package:flutter/material.dart';

import '../Controller/ApiController.dart';

class DataProvider extends ChangeNotifier {
  List category = [];
  List subCategory = [];

  bool _isLoading = false;

  set isLoading(bool state) {
    _isLoading = state;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  Future<void> loadCategory() async {
    isLoading = true;
    final (cat, status) = await ApiController.fetchDataFromApi(categoryId: 0);
    isLoading = false;
    if (status) {
      category = cat;
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> loadSubCategory({
    required int categoryId,
  }) async {
    isLoading = true;
    final (cat, status) = await ApiController.fetchDataFromApi(
      categoryId: categoryId,
    );
    isLoading = false;

    if (status) {
      if (cat.isEmpty) {
        return;
      }
      if ((cat[0] as Map).containsKey("SubCategories")) {
        subCategory = cat[0]['SubCategories'];
        notifyListeners();
      }
    }
  }
}
