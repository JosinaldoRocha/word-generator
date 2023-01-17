import 'package:app_flutter/app/modules/favorites-page/views/states/delete-favorite-state/delete_favorite_state.dart';
import 'package:app_flutter/app/modules/favorites-page/views/states/favorites-list-state/favorites_list_states.dart';
import 'package:app_flutter/app/modules/favorites-page/widgets/favorite_list_view_widget.dart';
import 'package:app_flutter/app/shared/dependencies/dependencies.dart';
import 'package:app_flutter/app/shared/widgets/center_text_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage> {
  void _listen() {
    ref.listen<DeleteFavoriteState>(
      deleteFavoriteState,
      (previous, next) {
        if (next is SuccessDeleteFavoriteState) {
          ref.read(favoriteListState.notifier).load();
        }
        if (next is FailureDeleteFavoriteState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(next.errorMessage),
            ),
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(favoriteListState.notifier).load());
  }

  @override
  Widget build(BuildContext context) {
    _listen();
    final favoriteState = ref.watch(favoriteListState);
    final deleteState = ref.watch(deleteFavoriteState);

    if (favoriteState is LoadingFavoritesListState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (favoriteState is FailureFavoritesListState) {
      return AlertDialog(
        title: Text(favoriteState.errorMessage),
      );
    } else if (favoriteState is SuccessFavoritesListState) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: favoriteState.list.isEmpty
              ? const CenterTextCard(title: 'Você não tem favoritos.')
              : (deleteState is LoadingDeleteFavoriteState)
                  ? const Center(child: CircularProgressIndicator())
                  : _buildContext(favoriteState),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildContext(SuccessFavoritesListState state) {
    return Column(
      children: [
        (state.list.length <= 1)
            ? Text(
                'Você tem ${state.list.length} favorito.',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Text(
                'Você tem ${state.list.length} favoritos.',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
        const SizedBox(height: 10),
        FavoriteListViewWidget(state: state),
        ElevatedButton(
          onPressed: () {
            ref.read(deleteFavoriteState.notifier).clearList();
          },
          child: const Text(
            'Limpar dados',
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
