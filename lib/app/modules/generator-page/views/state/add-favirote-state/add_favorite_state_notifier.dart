import 'package:app_flutter/app/modules/generator-page/views/state/add-favirote-state/add_favorite_state.dart';
import 'package:app_flutter/app/shared/models/app_model.dart';
import 'package:app_flutter/app/shared/repositorys/app_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddFavoriteStateNotifier extends StateNotifier<AddFavoriteState> {
  AddFavoriteStateNotifier({required this.appRepository})
      : super(InitialAddFavoriteState());
  final AppRepository appRepository;

  void addWord(AppModel item) async {
    state = LoadingAddFavoriteState();
    try {
      await appRepository.addFavorite(item);
      state = SuccessAddFavoriteState();
    } catch (e) {
      state = FailureAddFavoriteState(errorMessage: 'Erro ao salvar dados');
    }
  }
}
