import 'package:flutter/cupertino.dart';

abstract class SplashPageState {}

class InitialSplashPageState implements SplashPageState {}

class LoadingSplashPageState implements SplashPageState {}

class SuccessSplashPageState implements SplashPageState {
  SuccessSplashPageState({required this.page});
  final Widget page;
}

class FailureSplashPageState implements SplashPageState {
  FailureSplashPageState({required this.errorMessage});
  final String errorMessage;
}
