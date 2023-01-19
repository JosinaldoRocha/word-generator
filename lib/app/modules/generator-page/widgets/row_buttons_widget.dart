import 'package:app_flutter/app/modules/favorites-page/views/states/favorites-list-state/favorites_list_states.dart';
import 'package:app_flutter/app/modules/generator-page/views/state/generator-sate/generator_state.dart';
import 'package:app_flutter/app/shared/dependencies/dependencies.dart';
import 'package:app_flutter/app/shared/models/app_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RowButtonsWidget extends ConsumerStatefulWidget {
  const RowButtonsWidget({
    super.key,
    required this.word,
  });
  final String word;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RowButtonsWidgetState();
}

class _RowButtonsWidgetState extends ConsumerState<RowButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    final favoriteState = ref.watch(favoriteProvider);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (favoriteState is LoadingFavoritesListState)
          const Center(
            child: CircularProgressIndicator(),
          )
        else
          ElevatedButton.icon(
            onPressed: () {
              final item = AppModel(word: widget.word);
              ref.read(addFavoriteProvider.notifier).addWord(item);
            },
            icon: Icon(icon()),
            label: const Text('Like'),
          ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            ref.read(generatorProvider.notifier).generator();
          },
          child: const Text('Next'),
        ),
      ],
    );
  }

  IconData icon() {
    final generateState = ref.watch(generatorProvider);
    final favoriteState = ref.watch(favoriteProvider);
    IconData icon = Icons.favorite_border;

    if (generateState is SuccessGeneratorState) {
      final item = AppModel(word: generateState.newWord.asLowerCase);
      if (favoriteState is SuccessFavoritesListState) {
        if (favoriteState.list.any((element) => element.word == item.word)) {
          icon = Icons.favorite;
        } else {
          icon = Icons.favorite_border;
        }
      }
    }
    return icon;
  }
}
