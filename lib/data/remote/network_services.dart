import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:hrms_mobile/utils/routes/route_constants.dart';
import 'package:hrms_mobile/utils/routes/route_generator.dart';
import 'package:logger/logger.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../res/constants/app_constants.dart';
import '../../utils/helpers/common_functions.dart';
import '../local/sembast_services.dart';
import 'network_base_services.dart';

part 'network_services.g.dart';

@Riverpod(keepAlive: true)
NetworkServices networkServices(Ref ref) {
  return NetworkServices(ref);
}

class NetworkServices extends NetWorkBaseServices {
  final Ref ref;

  NetworkServices(this.ref);
  static const kConnectTimeOut = Duration(milliseconds: 60000);
  static const kReceiveTimeOut = Duration(milliseconds: 60000);

  @override
  Either<ResponseError, BaseResponse> checkHttpStatus(BaseResponse response) {
    return getStatus(response);
  }

  // ✦ Initialize Logger
  var logger = Logger(
    printer: PrettyPrinter(methodCount: 0, colors: true),
    level: Level.debug,
    output: ConsoleOutput(),
  );

  /* ┌──────────────────────────────┐
     │ API Client: GET Request      │
     │ Handles HTTP GET operations  │
     └──────────────────────────────┘ */
  @override
  Future<BaseResponse> getRequest({
    required String endPoint,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? queryParameters,
    bool isFromAuth = false,
  }) async {
    if (!(await isInternetAvailable())) {
      logger.w('⚠ No Internet Available'); // Warning log with emoji
      throw ApiExceptions.noInternet();
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseURL,
        receiveDataWhenStatusError: true,
        headers: {
          "Authorization":
              "Bearer ${AppConstants.accessToken}", // ➜ Token for auth
          "Content-Type": "application/json",
        },
      ),
    );

    try {
      logger.w(
        '🌐 GET Request Initiated',
        stackTrace: StackTrace.empty,
        time: null,
      ); // Info log with emoji
      logger.d(
        '🔗 URL: ${dio.options.baseUrl}$endPoint',
        stackTrace: StackTrace.empty,
        time: null,
      ); // Debug log for URL
      logger.d(
        '🔑 Headers - API Key: ${dio.options.headers["Api-Key"]}',
        stackTrace: StackTrace.empty,
        time: null,
      );
      logger.d(
        '🔒 Headers - Token: Bearer ${AppConstants.accessToken}',
        stackTrace: StackTrace.empty,
        time: null,
      );
      logger.d(
        'Params -  $queryParameters',
        stackTrace: StackTrace.empty,
        time: null,
      );

      Response response = await dio
          .get(endPoint, data: parameters, queryParameters: queryParameters)
          .timeout(
            kReceiveTimeOut,
            onTimeout: () {
              logger.e('⏳ Request Timed Out'); // Error log with emoji
              throw ApiExceptions.oops();
            },
          );

      logger.i('✅ Response Received - Status: ${response.statusCode}');
      log('📋 Response Data:\n${prettyJson(response.data)}');

      return BaseResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (error) {
      logger.e('❌ Dio Error - Status: ${error.response?.statusCode}');
      logger.e('📉 Error Data: ${error.response?.data}');

      if (error.response?.statusCode == 401) {
        logger.w('🔄 Unauthorized (401), logging out...');
        _logout();
        return BaseResponse(statusCode: 401, data: error.response?.data);
      }
      logger.e('📉 Error Data:\n${prettyJson(error.response?.data)}');

      return BaseResponse(
        statusCode: error.response?.statusCode,
        data: error.response?.data,
      );
    } catch (e) {
      logger.e('💥 Unexpected Error: $e'); // Error log with emoji
      throw ApiExceptions.oops();
    }
  }

  /* ┌──────────────────────────────┐
     │ API Client: POST Request     │
     │ Handles HTTP POST operations │
     └──────────────────────────────┘ */
  @override
  Future<BaseResponse> postRequest({
    required String endPoint,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? queryParameters,
    bool isFromAuth = false,
    Map<String, String>? extraHeaders,
  }) async {
    if (!(await isInternetAvailable())) {
      logger.w('⚠ No Internet Connection'); // Warning with emoji
      throw ApiExceptions.noInternet();
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseURL,
        receiveDataWhenStatusError: true,
        headers: {
          if (!isFromAuth && AppConstants.accessToken.isNotEmpty)
            "Authorization":
                "Bearer ${AppConstants.accessToken}", // ➜ Token for auth
          "Content-Type": "application/json",
          ...?extraHeaders,
        },
      ),
    );

    try {
      logger.w(
        '🌐 POST Request Initiated',
        stackTrace: StackTrace.empty,
        time: null,
      ); // Info log with emoji
      logger.d(
        '🔗 URL: ${dio.options.baseUrl}$endPoint',
        stackTrace: StackTrace.empty,
        time: null,
      ); // Debug log for URL
      logger.d(
        '🔑 Headers - API Key: ${dio.options.headers["Api-Key"]}',
        stackTrace: StackTrace.empty,
        time: null,
      );
      logger.d(
        '🔒 Headers - Token: Bearer ${AppConstants.accessToken}',
        stackTrace: StackTrace.empty,
        time: null,
      );
      logger.d(
        '📦 Body: ${jsonEncode(parameters)}',
        stackTrace: StackTrace.empty,
        time: null,
      ); // Pretty print request body

      Response response = await dio
          .post(endPoint, data: parameters, queryParameters: queryParameters)
          .timeout(
            kReceiveTimeOut,
            onTimeout: () {
              logger.e('⏳ Request Timed Out'); // Error log with emoji
              throw ApiExceptions.oops();
            },
          );

      logger.i(
        '✅ Response Received - Status: ${response.statusCode}',
        stackTrace: StackTrace.empty,
      );
      log('📋 Response Data:\n${prettyJson(response.data)}');

      return BaseResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (error) {
      logger.e('❌ Dio Error - Status: ${error.response?.statusCode}');
      logger.e('📉 Error Data:\n${prettyJson(error.response?.data)}');

      if (error.response?.statusCode == 401) {
        logger.w('🔄 Unauthorized (401), logging out...');
        _logout();
        return BaseResponse(statusCode: 401, data: error.response?.data);
      }
      return BaseResponse(
        statusCode: error.response?.statusCode,
        data: error.response?.data,
      );
    } catch (e) {
      logger.e('💥 Unexpected Error: $e'); // Error log with emoji
      throw ApiExceptions.oops();
    }
  }

  /* ┌──────────────────────────────┐
     │ API Client: Patch Request     │
     │ Handles HTTP Patch operations │
     └──────────────────────────────┘ */
  @override
  Future<BaseResponse> patchRequest({
    required String endPoint,
    // Map<String, dynamic>? parameters,
    //Changed parameters to dynamic (so it can accept either Map<String, dynamic> or FormData).
    dynamic parameters,
    Map<String, dynamic>? queryParameters,
    bool isFromAuth = false,
  }) async {
    if (!(await isInternetAvailable())) {
      logger.w('⚠ No Internet Connection'); // Warning with emoji
      throw ApiExceptions.noInternet();
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseURL,
        receiveDataWhenStatusError: true,
        headers: {
          if (!isFromAuth && AppConstants.accessToken.isNotEmpty)
            "Authorization":
                "Bearer ${AppConstants.accessToken}", // ➜ Token for auth
          "Content-Type": "application/json",
        },
      ),
    );

    try {
      logger.w(
        '🌐 POST Request Initiated',
        stackTrace: StackTrace.empty,
        time: null,
      ); // Info log with emoji
      logger.d(
        '🔗 URL: ${dio.options.baseUrl}$endPoint',
        stackTrace: StackTrace.empty,
        time: null,
      ); // Debug log for URL
      logger.d(
        '🔑 Headers - API Key: ${dio.options.headers["Api-Key"]}',
        stackTrace: StackTrace.empty,
        time: null,
      );
      logger.d(
        '🔒 Headers - Token: Bearer ${AppConstants.accessToken}',
        stackTrace: StackTrace.empty,
        time: null,
      );
      if (parameters is FormData) {
        logger.d('📦 Body (FormData):');
        for (final field in parameters.fields) {
          logger.d('📝 ${field.key} = ${field.value}');
        }
        for (final file in parameters.files) {
          logger.d('📁 ${file.key} = ${file.value.filename}');
        }
      } else {
        logger.d(
          '📦 Body: ${jsonEncode(parameters)}',
          stackTrace: StackTrace.empty,
          time: null,
        );
      }

      Response response = await dio
          .patch(endPoint, data: parameters, queryParameters: queryParameters)
          .timeout(
            kReceiveTimeOut,
            onTimeout: () {
              logger.e('⏳ Request Timed Out'); // Error log with emoji
              throw ApiExceptions.oops();
            },
          );

      logger.i(
        '✅ Response Received - Status: ${response.statusCode}',
        stackTrace: StackTrace.empty,
      );
      log('📋 Response Data:\n${prettyJson(response.data)}');

      return BaseResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (error) {
      logger.e('❌ Dio Error - Status: ${error.response?.statusCode}');
      logger.e('📉 Error Data:\n${prettyJson(error.response?.data)}');
      if (error.response?.statusCode == 401) {
        logger.w('🔄 Unauthorized (401), logging out...');
        _logout();
        return BaseResponse(statusCode: 401, data: error.response?.data);
      }
      return BaseResponse(
        statusCode: error.response?.statusCode,
        data: error.response?.data,
      );
    } catch (e) {
      logger.e('💥 Unexpected Error: $e'); // Error log with emoji
      throw ApiExceptions.oops();
    }
  }

  /* ┌──────────────────────────────┐
     │ API Client: PUT Request      │
     │ Handles HTTP PUT operations  │
     └──────────────────────────────┘ */
  @override
  Future<BaseResponse> putRequest({
    required String endPoint,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? queryParameters,
    bool isFromAuth = false,
  }) async {
    if (!(await isInternetAvailable())) {
      logger.w('⚠ No Internet Connection');
      throw ApiExceptions.noInternet();
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseURL,
        receiveDataWhenStatusError: true,
        headers: {
          if (!isFromAuth && AppConstants.accessToken.isNotEmpty)
            "Authorization": "Bearer ${AppConstants.accessToken}",
          "Content-Type": "application/json",
        },
      ),
    );

    try {
      logger.w('🌐 PUT Request Initiated');
      logger.d('🔗 URL: ${dio.options.baseUrl}$endPoint');
      logger.d(
        '📦 Body: ${jsonEncode(parameters)}',
        stackTrace: StackTrace.empty,
        time: null,
      );

      Response response = await dio
          .put(endPoint, data: parameters, queryParameters: queryParameters)
          .timeout(
            kReceiveTimeOut,
            onTimeout: () {
              logger.e('⏳ Request Timed Out');
              throw ApiExceptions.oops();
            },
          );

      logger.i('✅ Response Received - Status: ${response.statusCode}');
      log('📋 Response Data:\n${prettyJson(response.data)}');

      return BaseResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (error) {
      logger.e('❌ Dio Error - Status: ${error.response?.statusCode}');
      logger.e('📉 Error Data:\n${prettyJson(error.response?.data)}');

      if (error.response?.statusCode == 401) {
        logger.w('🔄 Unauthorized (401), logging out...');
        _logout();
        return BaseResponse(statusCode: 401, data: error.response?.data);
      }
      return BaseResponse(
        statusCode: error.response?.statusCode,
        data: error.response?.data,
      );
    } catch (e) {
      logger.e('💥 Unexpected Error: $e');
      throw ApiExceptions.oops();
    }
  }

  /* ┌──────────────────────────────┐
     │ API Client: Delete Request    │
     │ Handles HTTP Delete operations │
     └──────────────────────────────┘ */
  @override
  Future<BaseResponse> deleteRequest({
    required String endPoint,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? queryParameters,
    bool isFromAuth = false,
  }) async {
    if (!(await isInternetAvailable())) {
      logger.w('⚠ No Internet Connection'); // Warning with emoji
      throw ApiExceptions.noInternet();
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseURL,
        receiveDataWhenStatusError: true,
        headers: {
          if (!isFromAuth && AppConstants.accessToken.isNotEmpty)
            "Authorization":
                "Bearer ${AppConstants.accessToken}", // ➜ Token for auth
          "Content-Type": "application/json",
        },
      ),
    );

    try {
      logger.w(
        '🌐 DELETE Request Initiated',
        stackTrace: StackTrace.empty,
        time: null,
      ); // Info log with emoji
      logger.d(
        '🔗 URL: ${dio.options.baseUrl}$endPoint',
        stackTrace: StackTrace.empty,
        time: null,
      ); // Debug log for URL
      logger.d(
        '🔑 Headers - API Key: ${dio.options.headers["Api-Key"]}',
        stackTrace: StackTrace.empty,
        time: null,
      );
      logger.d(
        '🔒 Headers - Token: Bearer ${AppConstants.accessToken}',
        stackTrace: StackTrace.empty,
        time: null,
      );
      logger.d(
        '📦 Body: ${jsonEncode(parameters)}',
        stackTrace: StackTrace.empty,
        time: null,
      ); // Pretty print request body

      Response response = await dio
          .delete(endPoint, data: parameters, queryParameters: queryParameters)
          .timeout(
            kReceiveTimeOut,
            onTimeout: () {
              logger.e('⏳ Request Timed Out'); // Error log with emoji
              throw ApiExceptions.oops();
            },
          );

      logger.i(
        '✅ Response Received - Status: ${response.statusCode}',
        stackTrace: StackTrace.empty,
      );
      log('📋 Response Data:\n${prettyJson(response.data)}');

      return BaseResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (error) {
      logger.e('❌ Dio Error - Status: ${error.response?.statusCode}');
      logger.e('📉 Error Data:\n${prettyJson(error.response?.data)}');

      if (error.response?.statusCode == 401) {
        logger.w('🔄 Unauthorized (401), logging out...');
        _logout();
        return BaseResponse(statusCode: 401, data: error.response?.data);
      }

      return BaseResponse(
        statusCode: error.response?.statusCode,
        data: error.response?.data,
      );
    } catch (e) {
      logger.e('💥 Unexpected Error: $e'); // Error log with emoji
      throw ApiExceptions.oops();
    }
  }

  /* ┌────────────────────────────────────┐
     │ API Client: Multipart Request      │
     │ Handles multipart/form-data POST   │
     └────────────────────────────────────┘ */
  @override
  Future<BaseResponse> multiPartRequest({
    required String endPoint,
    required FormData formFields,
    Function(int, int)? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    if (!(await isInternetAvailable())) {
      logger.w('⚠ No Internet Available'); // Warning with emoji
      throw ApiExceptions.noInternet();
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseURL,
        receiveDataWhenStatusError: true,
        headers: {
          "Authorization":
              "Bearer ${AppConstants.accessToken}", // ➜ Token for auth
          "Content-Type": "application/json",
        },
      ),
    );

    try {
      logger.w('🌐 Multipart Request Initiated'); // Info log
      logger.d(
        '🔗 URL: ${dio.options.baseUrl}$endPoint',
        stackTrace: StackTrace.empty,
        time: null,
      );
      logger.d(
        '🔑 Headers - API Key: ${dio.options.headers["Api-Key"]}',
        stackTrace: StackTrace.empty,
        time: null,
      );
      logger.d(
        '🌍 Headers - Country: ${dio.options.headers["X-App-Country"]}',
        stackTrace: StackTrace.empty,
        time: null,
      );
      logger.d(
        '🔒 Headers - Token: Bearer ${AppConstants.accessToken}',
        stackTrace: StackTrace.empty,
        time: null,
      );
      logger.d(
        '📦 Form Data: ${formFields.fields}',
        stackTrace: StackTrace.empty,
        time: null,
      ); // Log form fields

      Response response = await dio
          .post(
            endPoint,
            data: formFields,
            onSendProgress: onSendProgress,
            cancelToken: cancelToken,
          )
          .timeout(
            kReceiveTimeOut,
            onTimeout: () {
              logger.e('⏳ Request Timed Out'); // Error log with emoji
              throw ApiExceptions.oops();
            },
          );

      logger.i(
        '✅ Response Received - Status: ${response.statusCode}',
        stackTrace: StackTrace.empty,
      );
      log('📋 Response Data:\n${prettyJson(response.data)}');

      return BaseResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (error) {
      logger.e('❌ Dio Error - Status: ${error.response?.statusCode}');
      logger.e('📉 Error Data:\n${prettyJson(error.response?.data)}');

      return BaseResponse(
        statusCode: error.response?.statusCode,
        data: error.response?.data,
      );
    } catch (e) {
      logger.e('💥 Unexpected Error: $e'); // Error log with emoji
      throw ApiExceptions.oops();
    }
  }

  /* ┌────────────────────────────────────┐
     │ API Client: Post File Request      │
     │ Uploads files with progress        │
     └────────────────────────────────────┘ */
  @override
  Future<BaseResponse> postFile({
    required String endPoint,
    required FormData formFields,
    required void Function(int, int)? onSendProgress,
    bool isFromAuth = false,
  }) async {
    if (!(await isInternetAvailable())) {
      logger.w('⚠ No Internet Available'); // Warning with emoji
      throw ApiExceptions.noInternet();
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseURL,
        receiveDataWhenStatusError: true,
        headers: {
          "Authorization":
              "Bearer ${AppConstants.accessToken}", // ➜ Token for auth
          "Content-Type": "application/json",
        },
      ),
    );

    try {
      logger.w(
        '📤 File Upload Request Initiated',
      ); // Info log with upload emoji
      logger.d('🔗 URL: ${dio.options.baseUrl}$endPoint');
      logger.d(
        '🔑 Headers - API Key: ${dio.options.headers["Api-Key"]}',
        stackTrace: StackTrace.empty,
        time: null,
      );
      logger.d(
        '🌍 Headers - Country: ${dio.options.headers["X-App-Country"]}',
        stackTrace: StackTrace.empty,
        time: null,
      );
      logger.d(
        '🔒 Headers - Token: Bearer ${AppConstants.accessToken}',
        stackTrace: StackTrace.empty,
        time: null,
      );
      logger.d(
        '📦 Form Data: ${formFields.fields}',
        stackTrace: StackTrace.empty,
        time: null,
      ); // Log form fields

      Response response = await dio
          .post(
            endPoint,
            data: formFields,
            onSendProgress: (sent, total) {
              logger.d(
                '📊 Upload Progress: ${((sent / total) * 100).toStringAsFixed(0)}%',
              );
              if (onSendProgress != null) onSendProgress(sent, total);
            },
          )
          .timeout(
            kReceiveTimeOut,
            onTimeout: () {
              logger.e('⏳ Request Timed Out'); // Error log with emoji
              throw ApiExceptions.oops();
            },
          );

      logger.f(
        '✅ Response Received - Status: ${response.statusCode}',
        stackTrace: StackTrace.empty,
        time: null,
      );
      log('📋 Response Data:\n${prettyJson(response.data)}');

      return BaseResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (error) {
      logger.e('❌ Dio Error - Status: ${error.response?.statusCode}');
      logger.e('📉 Error Data:\n${prettyJson(error.response?.data)}');

      if (error.response?.statusCode == 401) {
        logger.w('🔄 Unauthorized (401), logging out...');
        _logout();
        return BaseResponse(statusCode: 401, data: error.response?.data);
      }

      return BaseResponse(
        statusCode: error.response?.statusCode,
        data: error.response?.data,
      );
    } catch (e) {
      logger.e('💥 Unexpected Error: $e'); // Error log with emoji
      throw ApiExceptions.oops();
    }
  }

  @override
  Either<ResponseError, BaseResponse> getStatus(BaseResponse response) {
    switch (response.statusCode) {
      case 201:
      case 200:
      case 204:
        return Right(response);
      case 401:
        return Left(
          ResponseError(
            key: ApiErrorTypes.unAuthorized,
            message:
                getErrorFromResponse(key: 'message', response: response.data) ??
                "UnAuthorized",
            response: response.data,
          ),
        );
      case 403:
        return Left(
          ResponseError(
            key: ApiErrorTypes.unAuthorized,
            message:
                getErrorFromResponse(key: 'message', response: response.data) ??
                "UnAuthorized",
            response: response.data,
          ),
        );
      case 404:
        return Left(
          ResponseError(
            key: ApiErrorTypes.notFound,
            message: "Not Found",
            response: response.data,
          ),
        );
      case 422:
        return Left(
          ResponseError(
            key: ApiErrorTypes.unknown,
            message: "Unknown",
            response: response.data,
          ),
        );
      case 500:
        return Left(
          ResponseError(
            key: ApiErrorTypes.internalServerError,
            message: "Internal Server Error",
            response: response.data,
          ),
        );
      case 503 || 502 || 504:
        return Left(
          ResponseError(
            key: ApiErrorTypes.serviceUnavailable,
            message: "Service Unavailable",
            response: response.data,
          ),
        );
      default:
        return Left(
          ResponseError(
            key: ApiErrorTypes.unknown,
            message: "Unknown",
            response: response.data,
          ),
        );
    }
  }

  @override
  Future<Either<ResponseError, dynamic>> parseJson(
    BaseResponse response,
  ) async {
    try {
      return Right(response.data);
    } catch (e) {
      return Left(
        ResponseError(
          key: ApiErrorTypes.jsonParsing,
          message: "Failed on json Parsing",
        ),
      );
    }
  }

  @override
  Future<Either<ResponseError, BaseResponse>> safe(
    Future<BaseResponse> request,
  ) async {
    try {
      return Right(await request);
    } on ApiExceptions catch (error) {
      return Left(
        ResponseError(
          key: error.errorType,
          message: error.message,
          response: error.response,
        ),
      );
    } catch (e) {
      return Left(
        ResponseError(
          key: ApiErrorTypes.unknown,
          message: "Unknown Error : $e",
        ),
      );
    }
  }

  @override
  Future<BaseResponse> downloadRequest({
    required String endPoint,
    Map<String, dynamic>? parameters,
    bool isFromAuth = false,
  }) async {
    if (!(await isInternetAvailable())) {
      logger.w('⚠ No Internet Connection'); // Warning with emoji
      throw ApiExceptions.noInternet();
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseURL,
        receiveDataWhenStatusError: true,
        headers: {
          "Authorization":
              "Bearer ${AppConstants.accessToken}", // ➜ Token for auth
          "Content-Type": "application/json",
        },
      ),
    );

    try {
      logger.w(
        '🌐 POST Request Initiated',
        stackTrace: StackTrace.empty,
        time: null,
      ); // Info log with emoji
      logger.d(
        '🔗 URL: ${dio.options.baseUrl}$endPoint',
        stackTrace: StackTrace.empty,
        time: null,
      ); // Debug log for URL
      logger.d(
        '🔑 Headers - API Key: ${dio.options.headers["Api-Key"]}',
        stackTrace: StackTrace.empty,
        time: null,
      );
      logger.d(
        '🔒 Headers - Token: Bearer ${AppConstants.accessToken}',
        stackTrace: StackTrace.empty,
        time: null,
      );
      logger.d(
        '📦 Body: $parameters',
        stackTrace: StackTrace.empty,
        time: null,
      ); // Pretty print request body

      Response response = await dio
          .post(endPoint, data: parameters)
          .timeout(
            kReceiveTimeOut,
            onTimeout: () {
              logger.e('⏳ Request Timed Out'); // Error log with emoji
              throw ApiExceptions.oops();
            },
          );

      logger.i(
        '✅ Response Received - Status: ${response.statusCode}',
        stackTrace: StackTrace.empty,
      );
      log('📋 Response Data:\n${prettyJson(response.data)}');

      return BaseResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (error) {
      logger.e('❌ Dio Error - Status: ${error.response?.statusCode}');
      logger.e('📉 Error Data:\n${prettyJson(error.response?.data)}');

      return BaseResponse(
        statusCode: error.response?.statusCode,
        data: error.response?.data,
      );
    } catch (e) {
      logger.e('💥 Unexpected Error: $e'); // Error log with emoji
      throw ApiExceptions.oops();
    }
  }

  @override
  Future<BaseResponse> getRequestWithUrl({required String url}) async {
    if (!(await isInternetAvailable())) {
      logger.w('⚠ No Internet Available'); // Warning log with emoji
      throw ApiExceptions.noInternet();
    }
    logger.i('✅ BASE URL ->: $url');
    try {
      Response response = await Dio()
          .get(url)
          .timeout(
            kReceiveTimeOut,
            onTimeout: () {
              logger.e('⏳ Request Timed Out'); // Error log with emoji
              throw ApiExceptions.oops();
            },
          );

      logger.i('✅ Response Received - Status: ${response.statusCode}');
      log('📋 Response Data:\n${prettyJson(response.data)}');

      return BaseResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (error) {
      logger.e('❌ Dio Error - Status: ${error.response?.statusCode}');
      logger.e('📉 Error Data:\n${prettyJson(error.response?.data)}');

      return BaseResponse(
        statusCode: error.response?.statusCode,
        data: error.response?.data,
      );
    } catch (e) {
      logger.e('💥 Unexpected Error: $e'); // Error log with emoji
      throw ApiExceptions.oops();
    }
  }

  @override
  Future<bool> geAccessTokenWithRefreshToken() async {
    if (AppConstants.refreshToken.isEmpty) {
      logger.e('🚫 No refresh token available');
      return false;
    }
    try {
      logger.i('🔄 Calling refresh token API...');
      final response = await safe(
        postRequest(
          endPoint: AppConstants.refresh,
          parameters: {'refreshToken': AppConstants.refreshToken},
          isFromAuth: true,
        ),
      );
      String? newToken;
      response.fold(
        (left) {
          logger.e('❌ Refresh failed: ${left.message}');
        },
        (right) {
          final data = right.data;
          if (data is! Map<String, dynamic>) {
            logger.e('❌ Refresh response is not a map');
            return;
          }
          final token = data['token']?.toString();
          if (token == null || token.isEmpty) {
            logger.e('❌ No token in refresh response');
            return;
          }
          newToken = token;
        },
      );
      if (newToken == null) return false;
      logger.i('✅ Access token refreshed');
      AppConstants.accessToken = newToken!;
      await ref.read(sembastServicesProvider).saveTokens(
            accessToken: newToken,
            refreshToken: AppConstants.refreshToken,
          );
      return true;
    } catch (e) {
      logger.e('💥 Unexpected Error: $e');
      return false;
    }
  }

  Future<void> _logout() async {
    logger.e('❌ Failed to refresh token, returning error response...');

    AppConstants.accessToken = '';
    AppConstants.refreshToken = '';
    final sembast = ref.read(sembastServicesProvider);
    await sembast.clearSembastDb();

    if (navigatorKey.currentState != null) {
      executeAfterFrame(() {
        if (AppConstants.currentRoute == RouteConstants.routeLoginScreen) {
          return;
        }
        Navigator.pushNamedAndRemoveUntil(
          navigatorKey.currentState!.context,
          RouteConstants.routeLoginScreen,
          (_) => false,
        );
      });
    }
  }

  /* ┌──────────────────────────────┐
     │ API Client: Download File     │
     │ Downloads file to storage    │
     └──────────────────────────────┘ */
  @override
  Future<BaseResponse> downloadFile({
    required String endPoint,
    required String fileName,
    bool isFromAuth = false,
  }) async {
    if (!(await isInternetAvailable())) {
      logger.w('⚠ No Internet Available');
      throw ApiExceptions.noInternet();
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseURL,
        receiveDataWhenStatusError: true,
        headers: {"Authorization": "Bearer ${AppConstants.accessToken}"},
      ),
    );

    try {
      logger.i('⬇ Initiating Download: $fileName');

      // Use path_provider to get temporary directory
      // Note: We need path_provider import in this file if not present, checking imports...
      // It is NOT imported in the original file view, but I cannot easily add it without potentially messing up imports.
      // Ideally I should pass the full path or handle path resolution here.
      // But repo implementation is passing "fileName".
      // Let's assume repo passes the FULL PATH or checks it.
      // Wait, standard pattern is usually to download to a temp path and return it.
      // Let's assume the repo handles the path generation logic? No, repo passed "fileName".

      // Actually, to avoid adding imports here, let's look at how repo uses it.
      // Repo: service.downloadFile(endPoint: ..., fileName: ...)
      // It expects the service to handle the file writing.
      // I need to import path_provider here or ask Repo to provide full path.
      // To be safe and clean, I will assume fileName is just the name, and I will save it to text/temp.
      // But I cannot add import easily.

      // ALTERNATIVE: Use `downloadRequest` with `ResponseType.bytes` and let Repo write the file.
      // But I already updated Repo to call `downloadFile`.
      // I will add `import 'package:path_provider/path_provider.dart';` to the top of NetworkServices if needed.
      // Looking at `pubspec.yaml`, `path_provider` is available.

      // Let's add the method and I will add the import in a separate step if needed.
      // WAIT. `NetworkServices` usually shouldn't depend on `path_provider` directly if it's a pure network layer,
      // but `downloadFile` implies file system interaction.

      // I will proceed with adding the method. I will assum `fileName` is the SAVE PATH.
      // If `fileName` is just a name, I need directory.
      // Repo said: `fileName: fileName`.
      // I'll update Repo to provide the full SAVE PATH.

      Response response = await dio.download(
        endPoint,
        fileName, // DIO takes savePath as second arg.
        onReceiveProgress: (received, total) {
          if (total != -1) {
            logger.d(
              "Download: ${(received / total * 100).toStringAsFixed(0)}%",
            );
          }
        },
      );

      logger.i('✅ Download Complete');
      return BaseResponse(
        statusCode: response.statusCode,
        data: fileName,
      ); // Return path as data
    } on DioException catch (error) {
      logger.e('❌ Download Failed: ${error.message}');
      return BaseResponse(
        statusCode: error.response?.statusCode,
        data: error.response?.data,
      );
    } catch (e) {
      logger.e('💥 Unexpected Error: $e');
      throw ApiExceptions.oops();
    }
  }
}

const reset = '\x1B[0m';
const orange = '\x1B[38;5;208m';
const white = '\x1B[37m'; // string values
const fluorescentGreen = '\x1B[38;5;46m';
const purple = '\x1B[35m'; // list color
const yellow = '\x1B[33m'; // boolean values

String prettyJson(dynamic data, {int indent = 0}) {
  final indentSpace = '  ' * indent;

  if (data is String) {
    try {
      data = json.decode(data);
    } catch (_) {
      return '$white"$data"$reset';
    }
  }

  if (data is Map) {
    final buffer = StringBuffer();
    buffer.writeln('$indentSpace{');
    data.forEach((key, value) {
      final coloredKey = '$orange"$key"$reset';
      buffer.write(
        '$indentSpace  $coloredKey: ${prettyJson(value, indent: indent + 1)},\n',
      );
    });
    buffer.write('$indentSpace}');
    return buffer.toString();
  } else if (data is List) {
    final buffer = StringBuffer();
    buffer.writeln('$purple$indentSpace[$reset');
    for (var item in data) {
      buffer.writeln('${prettyJson(item, indent: indent + 1)},');
    }
    buffer.write('$purple$indentSpace]$reset');
    return buffer.toString();
  } else if (data is num) {
    return '$fluorescentGreen$data$reset';
  } else if (data is bool) {
    return '$yellow$data$reset';
  } else if (data == null) {
    return 'null';
  } else {
    return '$white"$data"$reset';
  }
}
