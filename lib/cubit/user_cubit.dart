import 'package:api/core/api/api_consumer.dart';
import 'package:api/cubit/user_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.apiConsumer) : super(UserInitial());
  final ApiConsumer apiConsumer;
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
  SignIn() async {
    try {
      emit(UserLoading());
      Response response = await apiConsumer.post();
      //  'https://food-api-omega.vercel.app/api/v1/user/signin',
      //  data: {
      //    'email': signInEmail.text,
      //    'password': signInPassword,
      //  }
      emit(UserSuccess());
      print(response);
    } catch (e) {
      emit(Userfailure(error: e.toString()));
      print(e.toString());
    }
  }
}
