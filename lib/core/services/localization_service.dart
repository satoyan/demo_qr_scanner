import 'package:get/get.dart';
import 'package:demo_qr_scanner/l10n/app_localizations.dart';

class LocalizationService extends GetxService {
  AppLocalizations? _l10n;

  // This method should be called after GetMaterialApp is built and context is available
  void initL10n() {
    if (Get.context != null) {
      _l10n = AppLocalizations.of(Get.context!);
    }
  }

  String get snackbarSuccessTitle => _l10n?.snackbarSuccessTitle ?? 'Success';
  String get snackbarAttendanceRecorded => _l10n?.snackbarAttendanceRecorded ?? 'Attendance recorded';
  String get snackbarErrorTitle => _l10n?.snackbarErrorTitle ?? 'Error';
  String get snackbarInvalidQrCodeFormat => _l10n?.snackbarInvalidQrCodeFormat ?? 'Invalid QR code format';
  String get snackbarSyncComplete => _l10n?.snackbarSyncComplete ?? 'Sync Complete';
  String get snackbarAllPendingRecordsSynced => _l10n?.snackbarAllPendingRecordsSynced ?? 'All pending records synced successfully!';

  // Generic getter for other localized strings if needed
  String getString(String key) {
    // This is a simplified example. A real implementation might use a Map or reflection.
    // For now, we'll just return the key if not found.
    switch (key) {
      case 'snackbarSuccessTitle': return snackbarSuccessTitle;
      case 'snackbarAttendanceRecorded': return snackbarAttendanceRecorded;
      case 'snackbarErrorTitle': return snackbarErrorTitle;
      case 'snackbarInvalidQrCodeFormat': return snackbarInvalidQrCodeFormat;
      case 'snackbarSyncComplete': return snackbarSyncComplete;
      case 'snackbarAllPendingRecordsSynced': return snackbarAllPendingRecordsSynced;
      default: return key;
    }
  }
}