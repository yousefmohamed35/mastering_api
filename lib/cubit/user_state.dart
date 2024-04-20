import 'package:api/models/sign_in_model.dart';
import 'package:api/models/user_model.dart';

class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {
  final SignIn signIn;

  UserSuccess({required this.signIn});
}

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

  UserSignUpFailure( {required this.error});
}

final class GetUserSuccess extends UserState {
  final UserModel userModel;

  GetUserSuccess({required this.userModel});
}

final class GetUserLoading extends UserState {}

final class GetUserFailure extends UserState {
  final String error;

  GetUserFailure({required this.error});
}
