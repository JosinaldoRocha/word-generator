import 'package:app_flutter/app/modules/home/views/pages/home_page.dart';
import 'package:app_flutter/app/modules/splash-page/views/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPAge(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
