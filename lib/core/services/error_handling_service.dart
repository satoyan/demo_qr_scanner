import 'package:demo_qr_scanner/core/services/snackbar_service.dart';
import 'package:demo_qr_scanner/core/utils/app_logger.dart';

abstract class ErrorHandlingService {
  void handleError(dynamic error, {String? message});
}

class GetxErrorHandlingService implements ErrorHandlingService {
  final SnackbarService _snackbarService;

  GetxErrorHandlingService(this._snackbarService);

  @override
  void handleError(dynamic error, {String? message}) {
    appLogger.e(message ?? 'An error occurred', error: error);
    _snackbarService.showSnackbar('Error', message ?? 'An unexpected error occurred. Please try again.');
  }
}
