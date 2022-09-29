import 'package:twitch_design/product/model/category_model.dart';

class GameModel {
  final String name;
  final String id;
  final String image;
  final List<CategoryModel> categoryList;

  GameModel(this.name, this.id, this.image, this.categoryList);
}
