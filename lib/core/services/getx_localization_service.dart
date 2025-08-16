import 'package:get/get.dart';
import 'package:demo_qr_scanner/core/services/localization_service.dart';
import 'package:demo_qr_scanner/core/extensions/build_context_extension.dart';

class GetxLocalizationService implements LocalizationService {
  @override
  String get snackbarSuccessTitle => Get.context!.l10n.snackbarSuccessTitle;

  @override
  String get snackbarAttendanceRecorded => Get.context!.l10n.snackbarAttendanceRecorded;

  @override
  String snackbarAttendanceRecordedWithStatus(String status) {
    return Get.context!.l10n.snackbarAttendanceRecordedWithStatus(status);
  }

  @override
  String get snackbarErrorTitle => Get.context!.l10n.snackbarErrorTitle;

  @override
  String get snackbarInvalidQrCodeFormat => Get.context!.l10n.snackbarInvalidQrCodeFormat;
}
