import 'package:app_flutter/app/core/hive.dart';
import 'package:app_flutter/app/my_app_widget.dart';
import 'package:flutter/material.dart';

void main() async {
  await HiveInit.load();
  runApp(const MyApp());
}
