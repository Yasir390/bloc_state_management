import 'package:bloc_state_management/favorite_app/model/favorite_item_model.dart';

class FavoriteRepository {
  Future<List<FavoriteItemModel>> fetchItem() async {
    await Future.delayed(Duration(seconds: 3));
    return List.of(list);
  }
}

List<FavoriteItemModel> list = [
  FavoriteItemModel(id: "0", value: "Item 0"),
  FavoriteItemModel(id: "1", value: "Item 1"),
  FavoriteItemModel(id: "2", value: "Item 2"),
  FavoriteItemModel(id: "3", value: "Item 3"),
  FavoriteItemModel(id: "4", value: "Item 4"),
  FavoriteItemModel(id: "5", value: "Item 5"),
  FavoriteItemModel(id: "6", value: "Item 6"),
  FavoriteItemModel(id: "7", value: "Item 7"),
  FavoriteItemModel(id: "8", value: "Item 8"),
  FavoriteItemModel(id: "9", value: "Item 9"),
  FavoriteItemModel(id: "10", value: "Item 10"),
  FavoriteItemModel(id: "11", value: "Item 11"),
];











// class FavoriteRepository {
//   Future<List<FavoriteItemModel>> fetchItem() async {
//     await Future.delayed(Duration(seconds: 3));
//     return List.of(_generateList(10));
//   }
// }

// List<FavoriteItemModel> _generateList(int length) {
//   return List.generate(
//     length,
//     (index) => FavoriteItemModel(id: index.toString(), value: "Item $index"),
//   );
// }

