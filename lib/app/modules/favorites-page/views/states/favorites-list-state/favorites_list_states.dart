import 'package:app_flutter/app/modules/favorites-page/data/models/favorite_model.dart';

abstract class FavoritesListState {}

class InitialFavoritesListState implements FavoritesListState {}

class LoadingFavoritesListState implements FavoritesListState {}

class SuccessFavoritesListState implements FavoritesListState {
  SuccessFavoritesListState({required this.list});
  final List<FavoriteModel> list;
}

class FailureFavoritesListState implements FavoritesListState {
  FailureFavoritesListState({required this.errorMessage});
  final String errorMessage;
}
