import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../common/common.dart';
import '../../simple_result.dart';

enum NetworkErrorType {
  networkConnectionError,
  serviceError,
}

class ApiError {
  int? statusCode;
  bool isApplicationError;
  String message;
  NetworkErrorType networkErrorType;

  ApiError({
    this.statusCode,
    this.isApplicationError = false,
    required this.message,
    this.networkErrorType = NetworkErrorType.serviceError,
  });

  // error 처리
  static SimpleResult<T, ApiError> createErrorResult<T>(Object? e) {
    if (e is DioException) {
      if (e.error is SocketException) {
        return SimpleResult.failure(ApiError(
          message: '통신상태를 확인해주세요.',
          networkErrorType: NetworkErrorType.networkConnectionError,
        ));
      }

      if (!kReleaseMode) {
        return SimpleResult.failure(ApiError(
          message: e.error?.toString() ?? e.message ?? '알 수 없는 에러 발생',
          isApplicationError: e.response == null,
        ));
      } else {
        return SimpleResult.failure(ApiError(
          message: 'apiError'.tr(), // 번역 처리된 메시지
          statusCode: e.response?.statusCode ?? 0,
        ));
      }
    }

    // DioException 외의 일반 오류 처리
    return SimpleResult.failure(ApiError(
      message: e?.toString() ?? '알 수 없는 오류 발생', // null 처리
    ));
  }
}
