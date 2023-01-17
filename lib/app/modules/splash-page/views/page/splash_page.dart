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
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(splashState.notifier).load());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(splashState);
    final myColor = Theme.of(context).colorScheme.primaryContainer;

    if (state is LoadingSplashPageState) {
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
          child: const CenterTextCard(title: 'Gerador de palavras'),
        ),
      );
    } else if (state is SuccessSplashPageState) {
      return state.page;
    } else if (state is FailureSplashPageState) {
      return AlertDialog(
        title: Text(state.errorMessage),
      );
    } else {
      return Container();
    }
  }
}
