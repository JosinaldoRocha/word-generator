abstract class DeleteFavoriteState {}

class InitialDeleteFavoriteState implements DeleteFavoriteState {}

class LoadingDeleteFavoriteState implements DeleteFavoriteState {}

class SuccessDeleteFavoriteState implements DeleteFavoriteState {}

class FailureDeleteFavoriteState implements DeleteFavoriteState {
  FailureDeleteFavoriteState({required this.errorMessage});
  final String errorMessage;
}
