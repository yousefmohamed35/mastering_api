import 'package:api/core/api/api_consumer.dart';
import 'package:api/core/api/api_interceptors.dart';
import 'package:api/core/api/end_points.dart';

import 'package:api/core/errors/exceptions.dart';
import 'package:dio/dio.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      request: true,
      requestHeader: true,
      responseHeader: true,
      error: true,

    ));
  }
  @override
  Future delete(String path,
      {dynamic? data, Map<String, dynamic>? queryParameters,bool isFormData=false}) async {
    // TODO: implement delete
    try {
      final response = await dio.delete(
        path,
        data: isFormData? FormData.fromMap(data): data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      handleDioExceptios(e);
    }
  }

  @override
  Future get(String path,
      {dynamic? data, Map<String, dynamic>? queryParameters,bool isFormData=false}) async {
    try {
      final response = await dio.get(
        path,
        data: isFormData? FormData.fromMap(data): data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      handleDioExceptios(e);
    }
  }

  @override
  Future patch(String path,
      {dynamic? data, Map<String, dynamic>? queryParameters,bool isFormData=false}) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData? FormData.fromMap(data): data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      handleDioExceptios(e);
    }
  }

  @override
  Future post(String path,
      {dynamic? data, Map<String, dynamic>? queryParameters,bool isFormData=false}) async {
    try {
      final response = await dio.post(
        path,
        data:isFormData? FormData.fromMap(data): data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      handleDioExceptios(e);
    }
  }
}
