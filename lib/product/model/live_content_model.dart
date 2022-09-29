import 'package:twitch_design/product/const/image_paths.dart';
import 'package:twitch_design/product/model/category_model.dart';

class LiveContentModel {
  final String contentImage;
  final String streamerName;
  final String streamerImage;
  final String streamDescription;

  final List<CategoryModel> contentCategoryList;

  LiveContentModel({
    required this.contentImage,
    required this.streamerName,
    required this.streamerImage,
    required this.streamDescription,
    required this.contentCategoryList,
  });

  static List<LiveContentModel> get dummyLiveContentList {
    return [
      LiveContentModel(
        contentImage: ImagePaths.codWarzoneLive0,
        streamerName: 'Erick Donnelley',
        streamerImage: ImagePaths.streamer0,
        streamDescription:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        contentCategoryList: [
          CategoryModel.dummyList[0],
          CategoryModel.dummyList[3],
          CategoryModel.dummyList[5],
        ],
      ),
      LiveContentModel(
        contentImage: ImagePaths.lolLive0,
        streamerName: 'Kelley Hudson',
        streamerImage: ImagePaths.streamer1,
        streamDescription:
            'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
        contentCategoryList: [
          CategoryModel.dummyList[1],
          CategoryModel.dummyList[4],
          CategoryModel.dummyList[6],
        ],
      ),
      LiveContentModel(
        contentImage: ImagePaths.valorantLive0,
        streamerName: 'Sherri Kilback DVM',
        streamerImage: ImagePaths.streamer2,
        streamDescription:
            ' It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.',
        contentCategoryList: [
          CategoryModel.dummyList[2],
          CategoryModel.dummyList[7],
          CategoryModel.dummyList[8],
        ],
      ),
      LiveContentModel(
        contentImage: ImagePaths.pubgLive0,
        streamerName: 'Harold Saber',
        streamerImage: ImagePaths.streamer3,
        streamDescription:
            'Contrary to popular belief, Lorem Ipsum is not simply random text.',
        contentCategoryList: [
          CategoryModel.dummyList[9],
          CategoryModel.dummyList[10],
          CategoryModel.dummyList[11],
        ],
      ),
    ];
  }
}
