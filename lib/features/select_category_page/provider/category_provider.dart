import 'package:flutter/cupertino.dart';
import 'package:twitch_design/product/model/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<CategoryModel> _selectedCats = [];

  pressCats(CategoryModel categoryModel) {
    if (_selectedCats.contains(categoryModel)) {
      _selectedCats.remove(categoryModel);
    } else {
      _selectedCats.add(categoryModel);
    }
    notifyListeners();
  }

  List<CategoryModel> get selectedCats => _selectedCats;
}
