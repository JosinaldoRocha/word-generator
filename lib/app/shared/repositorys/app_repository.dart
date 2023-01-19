import 'package:app_flutter/app/shared/models/app_model.dart';
import 'package:hive_flutter/adapters.dart';

class AppRepository {
  final box = Hive.box<AppModel>('word');

  Future<List<AppModel>> getAll() async {
    await Future.delayed(const Duration(seconds: 1));
    List<AppModel> items = box.values.toList();
    return items;
  }

  Future<void> addFavorite(AppModel item) async {
    if (!box.values.any((element) => element.word == item.word)) {
      await box.add(item);
    }
  }

  Future<void> deleteFavorite(AppModel item) async {
    await item.delete();
  }

  Future<void> clearList() async {
    await Future.delayed(const Duration(seconds: 3));
    await box.clear();
  }
}
