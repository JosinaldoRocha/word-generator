import 'package:hive_flutter/adapters.dart';
part 'favorite_model.g.dart';

@HiveType(typeId: 1)
class FavoriteModel extends HiveObject {
  @HiveField(0)
  String word;

  FavoriteModel({required this.word});
}
