import 'package:app_flutter/app/modules/generator-page/views/state/add-favirote-state/add_favorite_state.dart';
import 'package:app_flutter/app/modules/favorites-page/data/models/favorite_model.dart';
import 'package:app_flutter/app/modules/favorites-page/data/repositorys/favorite_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddFavoriteStateNotifier extends StateNotifier<AddFavoriteState> {
  AddFavoriteStateNotifier({required this.favoriteRepository})
      : super(InitialAddFavoriteState());
  final FavoriteRepository favoriteRepository;

  void addWord(FavoriteModel item) async {
    state = LoadingAddFavoriteState();
    try {
      await favoriteRepository.addFavorite(item);
      state = SuccessAddFavoriteState();
    } catch (e) {
      state = FailureAddFavoriteState(errorMessage: 'Erro ao salvar dados');
    }
  }
}
