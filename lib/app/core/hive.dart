import 'package:app_flutter/app/modules/favorites-page/data/models/favorite_model.dart';
import 'package:hive_flutter/adapters.dart';

class HiveInit {
  static Future<void> load() async {
    await Hive.initFlutter();
    Hive.registerAdapter(FavoriteModelAdapter());
    await Hive.openBox<FavoriteModel>('word');
  }
}
