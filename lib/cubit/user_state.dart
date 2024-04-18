class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {}

final class UserFailure extends UserState {
  final String error;

  UserFailure({required this.error});
}

final class UploadProfilePic extends UserState {}

final class UserSignUpLoading extends UserState {}

final class UserSignUpSuccess extends UserState {
  final String message;

  UserSignUpSuccess({required this.message});
}

final class UserSignUpFailure extends UserState {
  final String error;

  UserSignUpFailure({required this.error});
}
