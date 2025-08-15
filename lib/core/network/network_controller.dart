import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_qr_scanner/features/attendance/domain/services/attendance_service.dart';
// For AttendanceRecord

class NetworkController extends GetxController {
  final AttendanceService _attendanceService;
  var isConnected = false.obs;

  NetworkController(this._attendanceService);

  @override
  void onInit() {
    super.onInit();
    _checkConnectivity();
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) { // Changed parameter type
      _updateConnectivityStatus(results); // Pass the list
    });
  }

  Future<void> _checkConnectivity() async {
    final List<ConnectivityResult> result = await Connectivity().checkConnectivity(); // Changed return type
    _updateConnectivityStatus(result); // Pass the list
  }

  void _updateConnectivityStatus(List<ConnectivityResult> results) { // Changed parameter type
    if (!results.contains(ConnectivityResult.none)) { // Check if none is NOT in the list
      isConnected.value = true;
      _syncData(); // Trigger sync when online
    } else {
      isConnected.value = false;
    }
  }

  Future<void> _syncData() async {
    if (!isConnected.value) {
      return; // Only sync if connected
    }

    final unsyncedRecords = await _attendanceService
        .getUnsyncedAttendanceRecords();
    if (unsyncedRecords.isEmpty) {
      // print('No unsynced records to send.'); // Removed print
      return;
    }

    // print('Attempting to sync ${unsyncedRecords.length} records...'); // Removed print

    for (var record in unsyncedRecords) {
      // Mock API call
      await Future.delayed(
        const Duration(seconds: 1),
      ); // Simulate network delay
      // print('Sending record: ${record.id} - ${record.status}'); // Removed print

      // Assuming API call is successful
      await _attendanceService.markAsSynced(record);
      // print('Record ${record.id} synced successfully.'); // Removed print
    }
    Get.snackbar('Sync Complete', 'All pending records synced successfully!');
  }
}
