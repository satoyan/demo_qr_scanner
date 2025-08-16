import 'dart:convert';

import 'package:demo_qr_scanner/features/employee/domain/models/employee.dart';
import 'package:demo_qr_scanner/features/qr_scanner/presentation/controllers/qr_scanner_controller.dart';
import 'package:demo_qr_scanner/routes/app_pages.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks.mocks.dart';

void main() {
  late QrScannerController controller;
  late MockGetxNavigationService mockNavigationService;
  late MockMobileScannerController mockMobileScannerController;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    Get.testMode = true;
    Get.config(enableLog: false);

    mockNavigationService = MockGetxNavigationService();
    mockMobileScannerController = MockMobileScannerController();

    controller = QrScannerController(mockNavigationService, scannerController: mockMobileScannerController);
  });

  tearDown(() {
    Get.reset();
  });

  group('QrScannerController', () {
    test('navigateToManualEntry navigates to manual entry screen', () {
      // Act
      controller.navigateToManualEntry();

      // Assert
      verify(mockNavigationService.toNamed(Routes.manualEntry)).called(1);
    });

    test('handleQrCode navigates to attendance status screen on valid QR code', () async {
      // Arrange
      final employee = Employee(id: 'testId', name: 'testName');
      final qrCodeValue = jsonEncode(employee.toJson());
      when(mockMobileScannerController.stop()).thenAnswer((_) async {});
      when(mockMobileScannerController.start()).thenAnswer((_) async {});

      // Act
      await controller.handleQrCode(qrCodeValue);

      // Assert
      verify(mockNavigationService.toNamed(
        Routes.attendanceStatus,
        arguments: argThat(
          isA<Employee>()
              .having((e) => e.id, 'id', 'testId')
              .having((e) => e.name, 'name', 'testName'),
          named: 'arguments',
        ),
      )).called(1);
    });

    test('handleQrCode does not navigate on invalid QR code', () async {
      // Arrange
      const qrCodeValue = 'invalid_json';
      when(mockMobileScannerController.stop()).thenAnswer((_) async {});
      when(mockMobileScannerController.start()).thenAnswer((_) async {});

      // Act
      await controller.handleQrCode(qrCodeValue);

      // Assert
      verifyNever(mockNavigationService.toNamed(any, arguments: anyNamed('arguments')));
    });
  });
}
