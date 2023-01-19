import 'package:app_flutter/app/modules/favorites-page/views/states/favorites-list-state/favorites_list_states.dart';
import 'package:app_flutter/app/modules/favorites-page/data/repositorys/favorite_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesListStateNotifier extends StateNotifier<FavoritesListState> {
  FavoritesListStateNotifier({required this.favoriteRepository})
      : super(InitialFavoritesListState());

  final FavoriteRepository favoriteRepository;

  void load() async {
    state = LoadingFavoritesListState();

    try {
      final success = await favoriteRepository.getAll();
      state = SuccessFavoritesListState(list: success);
    } catch (e) {
      state = FailureFavoritesListState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
