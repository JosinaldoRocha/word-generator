import 'package:app_flutter/app/modules/splash-page/views/states/splash_page_state.dart';
import 'package:app_flutter/app/shared/repositorys/app_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPageStateNotifier extends StateNotifier<SplashPageState> {
  SplashPageStateNotifier({required this.appRepository})
      : super(InitialSplashPageState());
  final AppRepository appRepository;

  load() async {
    state = LoadingSplashPageState();
    try {
      state = SuccessSplashPageState();
    } catch (e) {
      state = FailureSplashPageState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
