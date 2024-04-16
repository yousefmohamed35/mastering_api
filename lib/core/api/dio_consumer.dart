import 'package:api/core/api/api_consumer.dart';
import 'package:api/core/errors/error_model.dart';
import 'package:api/core/errors/exceptions.dart';
import 'package:dio/dio.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio});
  @override
  Future delete(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    // TODO: implement delete
    try {
      final response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      handleDioExceptios(e);
    }
  }

  
  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async{
  try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      handleDioExceptios(e);
    }
  }

  @override
  Future patch(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async{
    try {
      final response = await dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      handleDioExceptios(e);
    }
  }

  @override
  Future post(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      handleDioExceptios(e);
    }
  }
}
