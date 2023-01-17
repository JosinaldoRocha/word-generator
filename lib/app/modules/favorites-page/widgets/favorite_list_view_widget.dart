import 'package:app_flutter/app/modules/favorites-page/views/states/favorites-list-state/favorites_list_states.dart';
import 'package:app_flutter/app/shared/dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteListViewWidget extends ConsumerStatefulWidget {
  const FavoriteListViewWidget({
    required this.state,
    super.key,
  });
  final SuccessFavoritesListState state;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FavoriteListViewWidgetState();
}

class _FavoriteListViewWidgetState
    extends ConsumerState<FavoriteListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.favorite),
          title: Text(widget.state.list[index].word),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              ref
                  .read(deleteFavoriteState.notifier)
                  .deleteFavorite(widget.state.list[index]);
            },
          ),
        ),
        separatorBuilder: (context, index) => const Divider(thickness: 1),
        itemCount: widget.state.list.length,
      ),
    );
  }
}
