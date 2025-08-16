import 'package:demo_qr_scanner/core/extensions/build_context_extension.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_qr_scanner/features/attendance/domain/services/attendance_service.dart';
import 'package:demo_qr_scanner/core/utils/app_logger.dart'; // Import appLogger

class NetworkController extends GetxController {
  final AttendanceService _attendanceService;
  final Connectivity _connectivity;
  var isConnected = false.obs;

  NetworkController(this._attendanceService, this._connectivity);

  @override
  void onInit() {
    super.onInit();
    checkConnectivity();
    _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results) {
      updateConnectivityStatus(results);
    });
  }

  Future<void> checkConnectivity() async {
    final List<ConnectivityResult> result = await _connectivity.checkConnectivity();
    updateConnectivityStatus(result);
  }

  void updateConnectivityStatus(List<ConnectivityResult> results) {
    if (!results.contains(ConnectivityResult.none)) {
      isConnected.value = true;
      syncData(); // Trigger sync when online
    } else {
      isConnected.value = false;
    }
  }

  Future<void> syncData() async {
    if (!isConnected.value) {
      return; // Only sync if connected
    }

    final unsyncedRecords = await _attendanceService.getUnsyncedAttendanceRecords();
    if (unsyncedRecords.isEmpty) {
      appLogger.d('No unsynced records to send.');
      return;
    }

    appLogger.d('Attempting to sync ${unsyncedRecords.length} records...');

    for (final record in unsyncedRecords) {
      // Mock API call
      await Future.delayed(
        const Duration(seconds: 1),
      ); // Simulate network delay
      appLogger.d('Sending record: ${record.id} - ${record.status}');

      // Assuming API call is successful
      await _attendanceService.markAsSynced(record);
      appLogger.d('Record ${record.id} synced successfully.');
    }

    Get.snackbar(
      Get.context!.l10n.snackbarSyncComplete,
      Get.context!.l10n.snackbarAllPendingRecordsSynced,
    );
  }
}
