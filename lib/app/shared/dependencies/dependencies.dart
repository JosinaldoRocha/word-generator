import 'package:app_flutter/app/modules/favorites-page/views/states/delete-favorite-state/delete_favorite_state.dart';
import 'package:app_flutter/app/modules/favorites-page/views/states/delete-favorite-state/delete_favorite_state_notifier.dart';
import 'package:app_flutter/app/modules/favorites-page/views/states/favorites-list-state/favorites_list_state_notifier.dart';
import 'package:app_flutter/app/modules/favorites-page/views/states/favorites-list-state/favorites_list_states.dart';
import 'package:app_flutter/app/modules/generator-page/views/state/add-favirote-state/add_favorite_state.dart';
import 'package:app_flutter/app/modules/generator-page/views/state/add-favirote-state/add_favorite_state_notifier.dart';
import 'package:app_flutter/app/modules/generator-page/views/state/generator-sate/generator_state.dart';
import 'package:app_flutter/app/modules/generator-page/views/state/generator-sate/generator_state_notifier.dart';
import 'package:app_flutter/app/modules/splash-page/views/states/splash_page_state.dart';
import 'package:app_flutter/app/modules/splash-page/views/states/splash_page_state_notifier.dart';
import 'package:app_flutter/app/shared/repositorys/app_repository.dart';
import 'package:app_flutter/app/shared/repositorys/generator_word_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appRepositoryProvider = Provider(
  (ref) => AppRepository(),
);

final generatorRepositoryProvider = Provider<GeneratorWordRepository>(
  (ref) => GeneratorWordRepository(),
);

final favoriteProvider =
    StateNotifierProvider<FavoritesListStateNotifier, FavoritesListState>(
  (ref) => FavoritesListStateNotifier(
    appRepository: ref.read(appRepositoryProvider),
  ),
);

final generatorProvider =
    StateNotifierProvider<GeneratorStateNotifier, GeneratorState>(
  (ref) => GeneratorStateNotifier(
    generatorReporsitory: ref.read(generatorRepositoryProvider),
  ),
);

final addFavoriteProvider =
    StateNotifierProvider<AddFavoriteStateNotifier, AddFavoriteState>(
  (ref) => AddFavoriteStateNotifier(
    appRepository: ref.read(appRepositoryProvider),
  ),
);

final deleteFavoriteProvider =
    StateNotifierProvider<DeleteFavoriteStateNotifier, DeleteFavoriteState>(
  (ref) => DeleteFavoriteStateNotifier(
    appRepository: ref.read(appRepositoryProvider),
  ),
);

final splashProvider =
    StateNotifierProvider<SplashPageStateNotifier, SplashPageState>(
  (ref) => SplashPageStateNotifier(
    appRepository: ref.read(appRepositoryProvider),
  ),
);
