abstract class LocalizationService {
  String get snackbarSuccessTitle;
  String get snackbarAttendanceRecorded;
  String snackbarAttendanceRecordedWithStatus(String status);
  String get snackbarErrorTitle;
  String get snackbarInvalidQrCodeFormat;
}