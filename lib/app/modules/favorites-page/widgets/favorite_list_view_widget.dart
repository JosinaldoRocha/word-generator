import 'package:app_flutter/app/shared/dependencies/dependencies.dart';
import 'package:app_flutter/app/modules/favorites-page/data/models/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteListViewWidget extends ConsumerStatefulWidget {
  const FavoriteListViewWidget({
    super.key,
    required this.data,
  });
  final List<FavoriteModel> data;

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
          title: Text(widget.data[index].word),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              ref
                  .read(deleteFavoriteProvider.notifier)
                  .deleteFavorite(widget.data[index]);
            },
          ),
        ),
        separatorBuilder: (context, index) => const Divider(thickness: 1),
        itemCount: widget.data.length,
      ),
    );
  }
}
