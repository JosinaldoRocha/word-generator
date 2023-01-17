import 'package:app_flutter/app/my_app_widget.dart';
import 'package:app_flutter/app/shared/models/app_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AppModelAdapter());
  await Hive.openBox<AppModel>('word');
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
