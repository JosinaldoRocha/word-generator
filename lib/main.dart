import 'package:app_flutter/app/core/hive.dart';
import 'package:app_flutter/app/my_app_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await HiveInit.load();
  runApp(const MyApp());
}
