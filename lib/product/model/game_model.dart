import 'package:twitch_design/product/const/image_paths.dart';
import 'package:twitch_design/product/model/category_model.dart';
import 'package:twitch_design/product/model/live_content_model.dart';

class GameModel {
  final String name;
  final String id;
  final String image;
  final List<CategoryModel> categoryList;

  final List<LiveContentModel> contentsList;

  GameModel({
    required this.name,
    required this.id,
    required this.image,
    required this.categoryList,
    required this.contentsList,
  });

  static List<GameModel> get dummyGameModelList => [
        GameModel(
          name: 'Call of Duty: Warzone',
          id: 'cod_warzone',
          image: ImagePaths.codWarzone,
          categoryList: [
            CategoryModel.dummyList[0],
            CategoryModel.dummyList[2],
            CategoryModel.dummyList[4],
          ],
          contentsList: [
            LiveContentModel.dummyLiveContentList[0],
            LiveContentModel.dummyLiveContentList[0],
            LiveContentModel.dummyLiveContentList[0],
            LiveContentModel.dummyLiveContentList[0],
          ],
        ),
        GameModel(
          name: 'League of Legends',
          id: 'league_of_legends',
          image: ImagePaths.lol,
          categoryList: [
            CategoryModel.dummyList[2],
            CategoryModel.dummyList[4],
            CategoryModel.dummyList[6],
          ],
          contentsList: [
            LiveContentModel.dummyLiveContentList[1],
            LiveContentModel.dummyLiveContentList[1],
            LiveContentModel.dummyLiveContentList[1],
            LiveContentModel.dummyLiveContentList[1],
          ],
        ),
        GameModel(
          name: 'PUBG',
          id: 'pubg',
          image: ImagePaths.pubg,
          categoryList: [
            CategoryModel.dummyList[1],
            CategoryModel.dummyList[3],
            CategoryModel.dummyList[5],
          ],
          contentsList: [
            LiveContentModel.dummyLiveContentList[3],
            LiveContentModel.dummyLiveContentList[3],
            LiveContentModel.dummyLiveContentList[3],
            LiveContentModel.dummyLiveContentList[3],
          ],
        ),
        GameModel(
          name: 'Valorant',
          id: 'valorant',
          image: ImagePaths.valorant,
          categoryList: [
            CategoryModel.dummyList[3],
            CategoryModel.dummyList[5],
            CategoryModel.dummyList[7],
          ],
          contentsList: [
            LiveContentModel.dummyLiveContentList[2],
            LiveContentModel.dummyLiveContentList[2],
            LiveContentModel.dummyLiveContentList[2],
            LiveContentModel.dummyLiveContentList[2],
          ],
        ),
      ];
}
