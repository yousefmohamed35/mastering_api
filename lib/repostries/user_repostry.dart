import 'package:api/cash/cash_helper.dart';
import 'package:api/core/api/api_consumer.dart';
import 'package:api/core/api/end_points.dart';
import 'package:api/core/errors/exceptions.dart';
import 'package:api/core/funactions/upload_image_to_api.dart';
import 'package:api/models/sign_in_model.dart';
import 'package:api/models/sign_up_model.dart';
import 'package:api/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserRepositry{
  final ApiConsumer apiConsumer;

  UserRepositry({required this.apiConsumer});
Future<Either<String,SignIn>>signIn({required email,required password})async{
    try {
      final response = await apiConsumer.post(EndPoints.signIn, data: {
        ApiKey.email: email,
        ApiKey.password: password
      });
      
    final  user = SignIn.fromJson(response);
      final decodeToken = JwtDecoder.decode(user!.token);
      CacheHelper().saveData(key: ApiKey.token, value: user!.token);
      CacheHelper().saveData(key: ApiKey.id, value: decodeToken[ApiKey.id]);
      return right(user);
    } on ServerExpetion catch (e) {
      return left(e.erorrModel.message);
    }
  }


Future<Either<String,SignUpModel>>  signUp(
  {
    required String signUpName,
    required String signUpEmail,
    required String signUpPassword,
    required String confirmPassword,
    required String signUpPhoneNumber,
    XFile? profilePic,
  }
)async{
     try {
      final response =
          await apiConsumer.post(EndPoints.signUp, isFormData: true, data: {
        ApiKey.name: signUpName,
        ApiKey.email: signUpEmail,
        ApiKey.password: signUpPassword,
        ApiKey.phone: signUpPhoneNumber,
        ApiKey.confirmPassword: confirmPassword,
        ApiKey.profilePic: uploadImageToApi(profilePic!),
      });
      SignUpModel signUpModel = SignUpModel.fromJson(response);
      return right(signUpModel);
    } on ServerExpetion catch (e) {
      return left(e.erorrModel.message);
    }
  }

Future<Either<String,UserModel>>  getUserData()async{
    try {
      final response = await apiConsumer.get(
        EndPoints.getUserData(
          CacheHelper().getData(key: ApiKey.id),
        ),
      );
     
      return right(UserModel.fromJson(response));
    }on ServerExpetion catch (e) {
      return left(e.erorrModel.message);
    }
  }
}