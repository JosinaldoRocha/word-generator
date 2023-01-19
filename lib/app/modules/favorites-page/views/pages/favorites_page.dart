import 'package:app_flutter/app/modules/favorites-page/views/states/delete-favorite-state/delete_favorite_state.dart';
import 'package:app_flutter/app/modules/favorites-page/views/states/favorites-list-state/favorites_list_states.dart';
import 'package:app_flutter/app/modules/favorites-page/widgets/alert_dialog_widget.dart';
import 'package:app_flutter/app/modules/favorites-page/widgets/favorite_list_view_widget.dart';
import 'package:app_flutter/app/shared/dependencies/dependencies.dart';
import 'package:app_flutter/app/shared/models/app_model.dart';
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
      deleteFavoriteProvider,
      (previous, next) {
        if (next is SuccessDeleteFavoriteState) {
          ref.read(favoriteProvider.notifier).load();
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
    Future.microtask(() => ref.read(favoriteProvider.notifier).load());
  }

  @override
  Widget build(BuildContext context) {
    _listen();
    final favoriteState = ref.watch(favoriteProvider);

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
              ? const CenterTextCardWidget(title: 'Você não tem favoritos.')
              : _buildContext(favoriteState.list),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildContext(List<AppModel> data) {
    final deleteState = ref.watch(deleteFavoriteProvider);

    return (deleteState is LoadingDeleteFavoriteState)
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              (data.length <= 1)
                  ? Text(
                      'Você tem ${data.length} favorito.',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      'Você tem ${data.length} favoritos.',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              const SizedBox(height: 10),
              FavoriteListViewWidget(data: data),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialogWidget(),
                  );
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
