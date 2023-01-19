import 'package:app_flutter/app/shared/dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlertDialogWidget extends ConsumerWidget {
  const AlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      actions: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ref.read(deleteFavoriteProvider.notifier).clearList();
              },
              child: const Text('SIM'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('NÃO'),
            ),
          ],
        )
      ],
      title: const Text('Excluir dados?'),
    );
  }
}
