import 'package:api/core/errors/error_model.dart';

class UserState {}

final class UserInitial extends UserState {}
final class UserLoading extends UserState {}
final class UserSuccess extends UserState {}
final class UserFailure extends UserState {
  final String error;

  UserFailure( {required this.error});
}