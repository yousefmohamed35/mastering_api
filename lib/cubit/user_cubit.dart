import 'package:api/cash/cash_helper.dart';
import 'package:api/core/api/api_consumer.dart';
import 'package:api/core/api/end_points.dart';
import 'package:api/core/errors/exceptions.dart';
import 'package:api/core/funactions/upload_image_to_api.dart';
import 'package:api/cubit/user_state.dart';
import 'package:api/models/sign_in_model.dart';
import 'package:api/models/sign_up_model.dart';
import 'package:api/models/user_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
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
  SignIn? user;
  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  signUp() async {
    try {
      emit(UserSignUpLoading());
      final response =
          await apiConsumer.post(EndPoints.signUp, isFormData: true, data: {
        ApiKey.name: signUpName.text,
        ApiKey.email: signUpEmail.text,
        ApiKey.password: signUpPassword.text,
        ApiKey.phone: signUpPhoneNumber.text,
        ApiKey.confirmPassword: confirmPassword.text,
        ApiKey.profilePic: uploadImageToApi(profilePic!),
      });
      SignUpModel signUpModel = SignUpModel.fromJson(response);
      emit(UserSignUpSuccess(message: signUpModel.message));
    } on ServerExpetion catch (e) {
      emit(UserSignUpFailure(error: e.erorrModel.message));
    }
  }

  getUserProfile() async {
    try {
      emit(GetUserLoading());
      final response = await apiConsumer.get(
        EndPoints.getUserData(
          CacheHelper().getData(key: ApiKey.id),
        ),
      );
      emit(GetUserSuccess(userModel: UserModel.fromJson(response),),);
    }on ServerExpetion catch (e) {
      emit(GetUserFailure(error: e.erorrModel.message),);
    }
  }

  signIn() async {
    try {
      final response = await apiConsumer.post(EndPoints.signIn, data: {
        ApiKey.email: signInEmail.text,
        ApiKey.password: signInPassword.text
      });
      emit(UserSuccess());
      user = SignIn.fromJson(response);
      final decodeToken = JwtDecoder.decode(user!.token);
      CacheHelper().saveData(key: ApiKey.token, value: user!.token);
      CacheHelper().saveData(key: ApiKey.id, value: decodeToken[ApiKey.id]);
    } on ServerExpetion catch (e) {
      emit(UserFailure(error: e.erorrModel.message));
    }
  }
}
