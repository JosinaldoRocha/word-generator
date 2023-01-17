import 'package:english_words/english_words.dart';

abstract class GeneratorState {}

class InitialGeneratorState implements GeneratorState {}

class LoadingGeneratorState implements GeneratorState {}

class SuccessGeneratorState implements GeneratorState {
  SuccessGeneratorState({required this.newWord});
  final WordPair newWord;
}

class FailureGeneratorState implements GeneratorState {
  FailureGeneratorState({required this.errorMessage});
  final String errorMessage;
}
