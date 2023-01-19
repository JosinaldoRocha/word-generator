import 'package:app_flutter/app/modules/favorites-page/views/states/delete-favorite-state/delete_favorite_state.dart';
import 'package:app_flutter/app/modules/favorites-page/data/models/favorite_model.dart';
import 'package:app_flutter/app/modules/favorites-page/data/repositorys/favorite_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteFavoriteStateNotifier extends StateNotifier<DeleteFavoriteState> {
  DeleteFavoriteStateNotifier({required this.favoriteRepository})
      : super(InitialDeleteFavoriteState());
  final FavoriteRepository favoriteRepository;

  void deleteFavorite(FavoriteModel item) async {
    state = LoadingDeleteFavoriteState();
    try {
      await favoriteRepository.deleteFavorite(item);
      state = SuccessDeleteFavoriteState();
    } catch (e) {
      state = FailureDeleteFavoriteState(errorMessage: 'Erro ao excluir dados');
    }
  }

  void clearList() async {
    state = LoadingDeleteFavoriteState();
    try {
      await favoriteRepository.clearList();
      state = SuccessDeleteFavoriteState();
    } catch (e) {
      state = FailureDeleteFavoriteState(errorMessage: 'Erro ao excluir dados');
    }
  }
}
