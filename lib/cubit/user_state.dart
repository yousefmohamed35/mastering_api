class UserState {}

final class UserInitial extends UserState {}
final class UserLoading extends UserState {}
final class UserSuccess extends UserState {}
final class Userfailure extends UserState {
  final String error;

  Userfailure({required this.error});
}