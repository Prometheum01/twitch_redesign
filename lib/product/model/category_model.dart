import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String name;
  final int id;

  const CategoryModel({
    required this.name,
    required this.id,
  });

  static List<CategoryModel> get dummyList {
    return const [
      CategoryModel(
        name: 'Shooter',
        id: 0,
      ),
      CategoryModel(
        name: 'Battle Royale',
        id: 1,
      ),
      CategoryModel(
        name: 'Fps',
        id: 2,
      ),
      CategoryModel(
        name: 'Role-Playing',
        id: 3,
      ),
      CategoryModel(
        name: 'Moba',
        id: 4,
      ),
      CategoryModel(
        name: 'Simulation',
        id: 5,
      ),
      CategoryModel(
        name: 'Adventure',
        id: 6,
      ),
      CategoryModel(
        name: 'Action',
        id: 7,
      ),
      CategoryModel(
        name: 'Education',
        id: 8,
      ),
      CategoryModel(
        name: 'Music',
        id: 9,
      ),
      CategoryModel(
        name: 'Fighting',
        id: 10,
      ),
      CategoryModel(
        name: 'Strategy',
        id: 11,
      ),
      CategoryModel(
        name: 'Puzzles',
        id: 12,
      ),
    ];
  }

  @override
  List<Object?> get props => [id];
}
