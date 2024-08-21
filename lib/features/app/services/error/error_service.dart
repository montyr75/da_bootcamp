import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app_config.dart';
import '../../../../utils/popup_utils.dart';

part 'error_service.g.dart';

@Riverpod(keepAlive: true)
class ErrorService extends _$ErrorService {
  @override
  AppError? build() => null;

  void onError({ProviderBase? provider, required Object error, StackTrace? st}) {
    final appError = error is AppError ? error : AppError(error: error, showAlert: false);

    if (log.debugMode) {
      log.error("${provider?.name ?? provider?.runtimeType ?? 'Unknown Source'} error: ${appError.toDebugString()}${st != null ? '\n$st' : ''}");
    }

    state = appError;

    if (appError.showAlert) {
      showErrorToast(appError.toString());
    }
  }
}

class AppError {
  final Object? error;
  final String? title;
  final String message;
  final bool showAlert;

  factory AppError({Object? error, String? title, String? message, bool showAlert = true}) {
    return AppError._internal(
      error,
      title,
      message ?? error?.toString() ?? "Unknown error.",
      showAlert,
    );
  }

  AppError._internal(this.error, this.title, this.message, this.showAlert);

  @override
  String toString() => message;

  String toDebugString() => error?.toString() ?? message;
}