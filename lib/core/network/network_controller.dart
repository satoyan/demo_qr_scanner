import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_qr_scanner/features/attendance/domain/services/attendance_service.dart';
import 'package:demo_qr_scanner/core/database/app_database.dart'; // For AttendanceRecord

class NetworkController extends GetxController {
  final AttendanceService _attendanceService;
  var isConnected = false.obs;

  NetworkController(this._attendanceService);

  @override
  void onInit() {
    super.onInit();
    _checkConnectivity();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _updateConnectivityStatus(result);
    });
  }

  Future<void> _checkConnectivity() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    _updateConnectivityStatus(result);
  }

  void _updateConnectivityStatus(ConnectivityResult result) {
    if (result != ConnectivityResult.none) {
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

    final unsyncedRecords = await _attendanceService.getUnsyncedAttendanceRecords();
    if (unsyncedRecords.isEmpty) {
      print('No unsynced records to send.');
      return;
    }

    print('Attempting to sync ${unsyncedRecords.length} records...');

    for (var record in unsyncedRecords) {
      // Mock API call
      await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
      print('Sending record: ${record.id} - ${record.status}');

      // Assuming API call is successful
      await _attendanceService.markAsSynced(record);
      print('Record ${record.id} synced successfully.');
    }
    Get.snackbar('Sync Complete', 'All pending records synced successfully!');
  }
}
