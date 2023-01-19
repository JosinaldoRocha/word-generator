abstract class SplashPageState {}

class InitialSplashPageState implements SplashPageState {}

class LoadingSplashPageState implements SplashPageState {}

class SuccessSplashPageState implements SplashPageState {}

class FailureSplashPageState implements SplashPageState {
  FailureSplashPageState({required this.errorMessage});
  final String errorMessage;
}
