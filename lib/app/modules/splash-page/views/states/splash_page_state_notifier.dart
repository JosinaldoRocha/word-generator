import 'package:app_flutter/app/modules/splash-page/views/states/splash_page_state.dart';
import 'package:app_flutter/app/modules/favorites-page/data/repositorys/favorite_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPageStateNotifier extends StateNotifier<SplashPageState> {
  SplashPageStateNotifier({required this.favoriteRepository})
      : super(InitialSplashPageState());
  final FavoriteRepository favoriteRepository;

  load() async {
    state = LoadingSplashPageState();
    try {
      await favoriteRepository.newPage();
      state = SuccessSplashPageState();
    } catch (e) {
      state = FailureSplashPageState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
