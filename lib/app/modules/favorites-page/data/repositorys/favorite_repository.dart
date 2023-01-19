import 'package:app_flutter/app/modules/favorites-page/data/models/favorite_model.dart';
import 'package:hive_flutter/adapters.dart';

class FavoriteRepository {
  final box = Hive.box<FavoriteModel>('word');

  Future<List<FavoriteModel>> getAll() async {
    await Future.delayed(const Duration(seconds: 1));
    List<FavoriteModel> items = box.values.toList();
    return items;
  }

  Future<void> addFavorite(FavoriteModel item) async {
    if (!box.values.any((element) => element.word == item.word)) {
      await box.add(item);
    }
  }

  Future<void> deleteFavorite(FavoriteModel item) async {
    await item.delete();
  }

  Future<void> clearList() async {
    await Future.delayed(const Duration(seconds: 3));
    await box.clear();
  }

  Future<bool> newPage() async {
    await Future.delayed(const Duration(seconds: 4));
    return true;
  }
}
