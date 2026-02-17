import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../res/constants/app_constants.dart';
import '../../utils/helpers/common_functions.dart';
import 'network_base_services.dart';

part 'network_services.g.dart';

@Riverpod(keepAlive: true)
NetworkServices networkServices(Ref ref) {
  return NetworkServices();
}

class NetworkServices extends NetWorkBaseServices {
  static const kConnectTimeOut = Duration(milliseconds: 60000);
  static const kReceiveTimeOut = Duration(milliseconds: 60000);

  @override
  Either<ResponseError, BaseResponse> checkHttpStatus(BaseResponse response) {
    return getStatus(response);
  }

  @override
  Future<BaseResponse> getRequest({
    required String endPoint,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? queryParameters,
    bool isFromAuth = false,
  }) async {
    if (!(await isInternetAvailable())) {
      throw ApiExceptions.noInternet();
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseURL,
        receiveDataWhenStatusError: true,
        connectTimeout: kConnectTimeOut,
        receiveTimeout: kReceiveTimeOut,
        headers: {"Content-Type": "application/json"},
      ),
    );

    try {
      Response response = await dio
          .get(endPoint, data: parameters, queryParameters: queryParameters)
          .timeout(kConnectTimeOut);

      return BaseResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ApiExceptions.oops();
    }
  }

  @override
  Future<BaseResponse> postRequest({
    required String endPoint,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? queryParameters,
    bool isFromAuth = false,
  }) async {
    if (!(await isInternetAvailable())) {
      throw ApiExceptions.noInternet();
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseURL,
        receiveDataWhenStatusError: true,
        connectTimeout: kConnectTimeOut,
        receiveTimeout: kReceiveTimeOut,
        headers: {"Content-Type": "application/json"},
      ),
    );

    try {
      Response response = await dio
          .post(endPoint, data: parameters, queryParameters: queryParameters)
          .timeout(kConnectTimeOut);

      return BaseResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ApiExceptions.oops();
    }
  }

  @override
  Future<BaseResponse> getRequestWithUrl({required String url}) async {
    if (!(await isInternetAvailable())) {
      throw ApiExceptions.noInternet();
    }

    final dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: kConnectTimeOut,
        receiveTimeout: kReceiveTimeOut,
      ),
    );

    try {
      Response response = await dio.get(url).timeout(kConnectTimeOut);
      return BaseResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ApiExceptions.oops();
    }
  }

  @override
  Future<BaseResponse> downloadRequest({
    required String endPoint,
    Map<String, dynamic>? parameters,
    bool isFromAuth = false,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse> patchRequest({
    required String endPoint,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? queryParameters,
    bool isFromAuth = false,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse> deleteRequest({
    required String endPoint,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? queryParameters,
    bool isFromAuth = false,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse> multiPartRequest({
    required String endPoint,
    required FormData formFields,
    Function(int, int)? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse> postFile({
    required String endPoint,
    required FormData formFields,
    required void Function(int, int)? onSendProgress,
    bool isFromAuth = false,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> geAccessTokenWithRefreshToken() async {
    return false;
  }

  @override
  Either<ResponseError, BaseResponse> getStatus(BaseResponse response) {
    if (response.statusCode == null) {
      return Left(
        ResponseError(key: ApiErrorTypes.unknown, message: 'Unknown error'),
      );
    }

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return Right(response);
    }

    ApiErrorTypes errorType;
    switch (response.statusCode) {
      case 400:
        errorType = ApiErrorTypes.badRequest;
        break;
      case 401:
        errorType = ApiErrorTypes.unAuthorized;
        break;
      case 404:
        errorType = ApiErrorTypes.notFound;
        break;
      case 500:
        errorType = ApiErrorTypes.internalServerError;
        break;
      case 503:
        errorType = ApiErrorTypes.serviceUnavailable;
        break;
      default:
        errorType = ApiErrorTypes.badResponse;
    }

    return Left(
      ResponseError(
        key: errorType,
        message: 'HTTP ${response.statusCode}',
        response: response.data,
      ),
    );
  }

  @override
  Future<Either<ResponseError, BaseResponse>> safe(
    Future<BaseResponse> request,
  ) async {
    try {
      final response = await request;
      return Right(response);
    } on ApiExceptions catch (e) {
      return Left(
        ResponseError(
          key: e.errorType,
          message: e.message,
          response: e.response,
        ),
      );
    } catch (e) {
      return Left(
        ResponseError(key: ApiErrorTypes.unknown, message: e.toString()),
      );
    }
  }

  @override
  Future<Either<ResponseError, dynamic>> parseJson(
    BaseResponse response,
  ) async {
    try {
      if (response.data is String) {
        final decoded = json.decode(response.data);
        return Right(decoded);
      }
      return Right(response.data);
    } catch (e) {
      return Left(
        ResponseError(
          key: ApiErrorTypes.jsonParsing,
          message: 'Failed to parse JSON: $e',
        ),
      );
    }
  }

  ApiExceptions _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiExceptions(
          message: 'Connection timeout',
          errorType: ApiErrorTypes.connectionTimeout,
        );
      case DioExceptionType.sendTimeout:
        return ApiExceptions(
          message: 'Send timeout',
          errorType: ApiErrorTypes.sendTimeout,
        );
      case DioExceptionType.receiveTimeout:
        return ApiExceptions(
          message: 'Receive timeout',
          errorType: ApiErrorTypes.receiveTimeout,
        );
      case DioExceptionType.badCertificate:
        return ApiExceptions(
          message: 'Bad certificate',
          errorType: ApiErrorTypes.badCertificate,
        );
      case DioExceptionType.badResponse:
        return ApiExceptions(
          message: 'Bad response',
          errorType: ApiErrorTypes.badResponse,
          response: error.response?.data,
        );
      case DioExceptionType.cancel:
        return ApiExceptions(
          message: 'Request cancelled',
          errorType: ApiErrorTypes.cancel,
        );
      case DioExceptionType.connectionError:
        return ApiExceptions(
          message: 'Connection error',
          errorType: ApiErrorTypes.connectionError,
        );
      default:
        return ApiExceptions(
          message: 'Unknown error',
          errorType: ApiErrorTypes.unknown,
        );
    }
  }
}
