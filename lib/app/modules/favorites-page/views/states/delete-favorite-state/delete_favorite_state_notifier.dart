import 'package:app_flutter/app/modules/favorites-page/views/states/delete-favorite-state/delete_favorite_state.dart';
import 'package:app_flutter/app/shared/models/app_model.dart';
import 'package:app_flutter/app/shared/repositorys/app_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteFavoriteStateNotifier extends StateNotifier<DeleteFavoriteState> {
  DeleteFavoriteStateNotifier({required this.appRepository})
      : super(InitialDeleteFavoriteState());
  final AppRepository appRepository;

  void deleteFavorite(AppModel item) async {
    state = LoadingDeleteFavoriteState();
    try {
      await appRepository.deleteFavorite(item);
      state = SuccessDeleteFavoriteState();
    } catch (e) {
      state = FailureDeleteFavoriteState(errorMessage: 'Erro ao excluir dados');
    }
  }

  void clearList() async {
    state = LoadingDeleteFavoriteState();
    try {
      await appRepository.clearList();
      state = SuccessDeleteFavoriteState();
    } catch (e) {
      state = FailureDeleteFavoriteState(errorMessage: 'Erro ao excluir dados');
    }
  }
}
