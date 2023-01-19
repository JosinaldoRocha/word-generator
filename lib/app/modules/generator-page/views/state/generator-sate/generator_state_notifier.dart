import 'package:app_flutter/app/modules/generator-page/views/state/generator-sate/generator_state.dart';
import 'package:app_flutter/app/shared/repositorys/generator_word_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GeneratorStateNotifier extends StateNotifier<GeneratorState> {
  GeneratorStateNotifier({required this.generatorReporsitory})
      : super(InitialGeneratorState());
  final GeneratorWordRepository generatorReporsitory;

  void generator() async {
    state = LoadingGeneratorState();

    try {
      final success = await generatorReporsitory.generateWord();
      state = SuccessGeneratorState(newWord: success);
    } catch (e) {
      state = FailureGeneratorState(errorMessage: 'Erro ao gerar dados');
    }
  }
}
