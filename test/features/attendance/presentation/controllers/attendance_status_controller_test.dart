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
  late MockSnackbarService mockSnackbarService;
  late MockLocalizationService mockLocalizationService;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    Get.testMode = true;
    Get.config(enableLog: false);
    mockAttendanceService = MockAttendanceService();
    mockNavigationService = MockGetxNavigationService();
    mockSnackbarService = MockSnackbarService();
    mockLocalizationService = MockLocalizationService();

    when(mockLocalizationService.snackbarSuccessTitle).thenReturn('成功');
    when(mockLocalizationService.snackbarAttendanceRecorded).thenReturn('勤怠を記録しました');

    controller = AttendanceStatusController(mockAttendanceService, mockNavigationService, mockSnackbarService, mockLocalizationService);
    Get.put(mockNavigationService);
    Get.put(mockSnackbarService);
    Get.put(mockLocalizationService);
  });

  tearDown(() {
    Get.reset();
  });

  group('AttendanceStatusController', () {
    test('recordAttendance saves record and navigates back', () async {
      // Arrange: テストデータの準備
      const employeeId = 'testId';
      const employeeName = 'testName';
      const status = AttendanceStatus.clockIn;

      // Act: 勤怠記録を保存
      await controller.recordAttendance(employeeId, employeeName, status);

      // Assert: 勤怠記録が保存され、画面が戻ることを確認
      verify(mockAttendanceService.saveAttendanceRecord(any)).called(1);
      verify(mockNavigationService.back()).called(1);
      verify(mockSnackbarService.showSnackbar(any, any)).called(1);
    });
  });
}
