import 'package:app_flutter/app/modules/generator-page/views/state/add-favirote-state/add_favorite_state.dart';
import 'package:app_flutter/app/modules/generator-page/views/state/generator-sate/generator_state.dart';
import 'package:app_flutter/app/modules/generator-page/widgets/new_word_card_widget.dart';
import 'package:app_flutter/app/modules/generator-page/widgets/row_buttons_widget.dart';
import 'package:app_flutter/app/shared/dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GeneratorPage extends ConsumerStatefulWidget {
  const GeneratorPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends ConsumerState<GeneratorPage> {
  void _listen() {
    ref.listen<AddFavoriteState>(
      addFavoriteProvider,
      (previous, next) {
        if (next is SuccessAddFavoriteState) {
          ref.read(favoriteProvider.notifier).load();
        }
        if (next is FailureAddFavoriteState) {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text('Erro ao gerar dados'),
            ),
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(generatorProvider.notifier).generator());
  }

  @override
  Widget build(BuildContext context) {
    _listen();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildContext(),
        ],
      ),
    );
  }

  Widget _buildContext() {
    final generateState = ref.watch(generatorProvider);

    if (generateState is LoadingGeneratorState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (generateState is SuccessGeneratorState) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NewWordCardWidget(pair: generateState.newWord.asLowerCase),
          const SizedBox(height: 10),
          RowButtonsWidget(
            word: generateState.newWord.asLowerCase,
          ),
        ],
      );
    } else if (generateState is FailureGeneratorState) {
      return AlertDialog(
        title: Text(generateState.errorMessage),
      );
    } else {
      return Container();
    }
  }
}
