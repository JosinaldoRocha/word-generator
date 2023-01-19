import 'package:app_flutter/app/shared/models/app_model.dart';
import 'package:hive_flutter/adapters.dart';

class HiveInit {
  static Future<void> load() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AppModelAdapter());
    await Hive.openBox<AppModel>('word');
  }
}
