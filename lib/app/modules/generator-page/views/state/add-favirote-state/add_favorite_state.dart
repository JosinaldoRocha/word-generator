abstract class AddFavoriteState {}

class InitialAddFavoriteState implements AddFavoriteState {}

class LoadingAddFavoriteState implements AddFavoriteState {}

class SuccessAddFavoriteState implements AddFavoriteState {}

class FailureAddFavoriteState implements AddFavoriteState {
  FailureAddFavoriteState({required this.errorMessage});
  final String errorMessage;
}
