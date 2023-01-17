import 'package:hive_flutter/adapters.dart';
part 'app_model.g.dart';

@HiveType(typeId: 1)
class AppModel extends HiveObject {
  @HiveField(0)
  String word;

  AppModel({required this.word});
}
