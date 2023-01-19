import 'package:english_words/english_words.dart';

class GeneratorWordRepository {
  Future<WordPair> generateWord() async {
    await Future.delayed(const Duration(seconds: 1));
    WordPair newWord = WordPair.random();
    return newWord;
  }
}
