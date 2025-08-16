import 'package:demo_qr_scanner/features/attendance/domain/enums/attendance_status.dart';
import 'package:demo_qr_scanner/features/attendance/presentation/controllers/attendance_status_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks.mocks.dart';

void main() {
  late AttendanceStatusController controller;
  late MockAttendanceService mockAttendanceService;
  late MockGetxNavigationService mockNavigationService;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    Get.testMode = true;
    Get.config(enableLog: false);
    mockAttendanceService = MockAttendanceService();
    mockNavigationService = MockGetxNavigationService();
    controller = AttendanceStatusController(mockAttendanceService, mockNavigationService);
    Get.put(mockNavigationService);
  });

  tearDown(() {
    Get.reset();
  });

  group('AttendanceStatusController', () {
    test('recordAttendance saves record and navigates back', () async {
      // Arrange
      const employeeId = 'testId';
      const employeeName = 'testName';
      const status = AttendanceStatus.clockIn;

      // Act
      await controller.recordAttendance(employeeId, employeeName, status);

      // Assert
      verify(mockAttendanceService.saveAttendanceRecord(any)).called(1);
      verify(mockNavigationService.back()).called(1);
    });
  });
}
