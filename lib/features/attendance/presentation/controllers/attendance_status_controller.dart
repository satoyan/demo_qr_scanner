import 'dart:async';
import 'package:demo_qr_scanner/core/extensions/build_context_extension.dart';
import 'package:demo_qr_scanner/core/services/navigation_service.dart';
import 'package:get/get.dart';
import 'package:demo_qr_scanner/features/attendance/domain/services/attendance_service.dart';
import 'package:demo_qr_scanner/core/database/app_database.dart'; // For AttendanceRecordsCompanion
import 'package:drift/drift.dart' as drift; // Alias drift for Value
import 'package:demo_qr_scanner/features/attendance/domain/enums/attendance_status.dart'; // Import AttendanceStatus

class AttendanceStatusController extends GetxController {
  final AttendanceService _attendanceService;
  final NavigationService _navigationService;
  final _currentTime = DateTime.now().obs;
  late Timer _timer;

  AttendanceStatusController(this._attendanceService, this._navigationService);

  DateTime get currentTime => _currentTime.value;

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _currentTime.value = DateTime.now();
    });
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  Future<void> recordAttendance(
    String employeeId,
    String employeeName,
    AttendanceStatus status,
  ) async {
    final newRecord = AttendanceRecordsCompanion(
      employeeId: drift.Value(employeeId),
      employeeName: drift.Value(employeeName),
      timestamp: drift.Value(DateTime.now()),
      status: drift.Value(
        status.toString().split('.').last,
      ), // Convert enum to string
      isSynced: drift.Value(false),
    );
    await _attendanceService.saveAttendanceRecord(newRecord);
    _navigationService.back();
    Get.snackbar(
      Get.context!.l10n.snackbarSuccessTitle,
      '${Get.context!.l10n.snackbarAttendanceRecorded}: ${status.name}',
    );
  }
}
