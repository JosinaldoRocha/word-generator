import 'package:app_flutter/app/modules/splash-page/views/states/splash_page_state.dart';
import 'package:app_flutter/app/shared/dependencies/dependencies.dart';
import 'package:app_flutter/app/shared/widgets/center_text_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPAge extends ConsumerStatefulWidget {
  const SplashPAge({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPAgeState();
}

class _SplashPAgeState extends ConsumerState<SplashPAge> {
  void _listen() {
    ref.listen(splashProvider, (previous, next) {
      if (next is SuccessSplashPageState) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(splashProvider.notifier).load());
  }

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme.primaryContainer;

    _listen();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              myColor,
              const Color.fromARGB(255, 54, 131, 86),
            ],
          ),
        ),
        child: const CenterTextCardWidget(title: 'Gerador de palavras'),
      ),
    );
  }
}
