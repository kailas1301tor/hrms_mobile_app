import 'dart:io';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import '../common_widgets/custom_toast_widget.dart';

import '../../data/remote/network_base_services.dart';
import '../../res/enums/enums.dart';

Future<bool> isInternetAvailable() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
  return false;
}

void afterInit(VoidCallback callback) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    callback();
  });
}

void hideKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}

void showSnackBar(
  BuildContext context,
  String message, {
  bool isError = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: isError ? Colors.red : Colors.green,
      duration: const Duration(seconds: 3),
    ),
  );
}

LoaderState handleResponseError(ApiErrorTypes errorType) {
  return switch (errorType) {
    ApiErrorTypes.cancel => LoaderState.error,
    ApiErrorTypes.noInternet => LoaderState.networkError,
    ApiErrorTypes.badCertificate => LoaderState.error,
    ApiErrorTypes.badResponse => LoaderState.error,
    ApiErrorTypes.connectionError => LoaderState.error,
    ApiErrorTypes.connectionTimeout => LoaderState.error,
    ApiErrorTypes.badRequest => LoaderState.error,
    ApiErrorTypes.jsonParsing => LoaderState.error,
    ApiErrorTypes.internalServerError => LoaderState.serverError,
    ApiErrorTypes.serviceUnavailable => LoaderState.serverError,
    ApiErrorTypes.notFound => LoaderState.error,
    ApiErrorTypes.unAuthorized => LoaderState.error,
    ApiErrorTypes.unknown => LoaderState.error,
    ApiErrorTypes.oops => LoaderState.error,
    ApiErrorTypes.sendTimeout => LoaderState.error,
    ApiErrorTypes.receiveTimeout => LoaderState.error,
  };
}

String? getErrorFromResponse({required String key, required dynamic response}) {
  if (response == null) return null;
  try {
    if (response is Map<String, dynamic>) {
      if (response.containsKey(key)) {
        final error = response[key];
        if (error is List && error.isNotEmpty) {
          return error[0].toString();
        }
        return error?.toString();
      }
      if (response.containsKey('message')) {
        return response['message']?.toString();
      }
      if (response.containsKey('error')) {
        return response['error']?.toString();
      }
    }
  } catch (e) {
    return null;
  }
  return null;
}

void showCustomToast({
  required String message,
  bool? isSuccess,
  Duration? duration,
  String? link,
  VoidCallback? onLinkTap,
}) {
  toastification.showCustom(
    alignment: Alignment.bottomCenter,
    autoCloseDuration: duration ?? const Duration(seconds: 4),
    builder: (context, holder) {
      return CustomToastWidget(
        message: message,
        isSuccess: isSuccess,
        link: link,
        onLinkTap: onLinkTap,
        onClose: () => toastification.dismiss(holder),
      );
    },
  );
}

void executeAfterFrame(VoidCallback callback) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    callback();
  });
}
