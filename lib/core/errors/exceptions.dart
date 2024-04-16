import 'package:api/core/errors/error_model.dart';
import 'package:dio/dio.dart';

class ServerExpetion implements Exception {
  final ErorrModel erorrModel;

  ServerExpetion({required this.erorrModel});

}
void handleDioExceptios(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throw ServerExpetion(erorrModel: ErorrModel.fromJson(e.response!.data),);
      case DioExceptionType.sendTimeout:
      throw ServerExpetion(erorrModel: ErorrModel.fromJson(e.response!.data));
      case DioExceptionType.receiveTimeout:
      throw ServerExpetion(erorrModel: ErorrModel.fromJson(e.response!.data));
      case DioExceptionType.badCertificate:
      throw ServerExpetion(erorrModel: ErorrModel.fromJson(e.response!.data));
      case DioExceptionType.badResponse:
      throw ServerExpetion(erorrModel: ErorrModel.fromJson(e.response!.data));
      case DioExceptionType.cancel:
      throw ServerExpetion(erorrModel: ErorrModel.fromJson(e.response!.data));
      case DioExceptionType.connectionError:
      throw ServerExpetion(erorrModel: ErorrModel.fromJson(e.response!.data));
      case DioExceptionType.unknown:
      throw ServerExpetion(erorrModel: ErorrModel.fromJson(e.response!.data));
    }
  }
