import 'package:api/cubit/user_state.dart';
import 'package:api/models/sign_in_model.dart';
import 'package:api/repostries/user_repostry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepositry) : super(UserInitial());
  final UserRepositry userRepositry;
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();
  SignIn? user;
  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  signUp() async {
    emit(UserSignUpLoading());
    final response = await userRepositry.signUp(
        signUpName: signUpName.text,
        signUpEmail: signUpEmail.text,
        signUpPassword: signUpPassword.text,
        confirmPassword: confirmPassword.text,
        signUpPhoneNumber: signUpPhoneNumber.text);
    response.fold(
      (errorMessage) => emit(UserSignUpFailure(error: errorMessage)),
      (signUpModel) => emit(
        UserSignUpSuccess(message: signUpModel.message),
      ),
    );
  }

  getUserProfile() async {}

  signIn() async {
    emit(UserInitial());
    final response = await userRepositry.signIn(
        email: signInEmail.text, password: signInPassword.text);
    response.fold((errorMessage) => emit(UserFailure(error: errorMessage)), (signInModel) => emit(UserSuccess(signIn: signInModel)));
  }
}
