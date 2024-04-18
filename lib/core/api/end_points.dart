class EndPoints {
  static const String baseUrl = 'https://food-api-omega.vercel.app/api/v1/';
  static const String signIn = 'user/signin';
  static const String signUp = 'user/signup';
  static const String checkEmail = 'user/check-email';
  static const String updateUser = 'user/update';
  static const String deleteUser = 'user/delete?id=64a1fa760db6e1f0ad3c52e6';
  static const String logOut = 'user/logout';
  static String getUserData(id){
    return 'user/get-user/$id';
  }
}

class ApiKey {
  static const String status = 'status';
  static const String errorMessage = 'ErrorMessage';
  static const String token = 'token';
  static const String id = 'id';
  static const String email = 'email';
  static const String password = 'password';
  static const String message = 'message';
  static const String name = 'name';
  static const String phone = 'phone';
  static const String confirmPassword = 'confirmPassword';
  static const String location = 'location';
  static const String profilePic = 'profilePic';
}
