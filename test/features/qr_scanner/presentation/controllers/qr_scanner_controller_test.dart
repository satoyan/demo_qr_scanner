import 'dart:convert';

import 'package:demo_qr_scanner/features/employee/domain/models/employee.dart';
import 'package:demo_qr_scanner/features/qr_scanner/presentation/controllers/qr_scanner_controller.dart';
import 'package:demo_qr_scanner/routes/app_pages.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks.mocks.dart';

void main() {
  group('QrScannerController', () {
    late QrScannerController controller;
    late MockGetxNavigationService mockNavigationService;
    late MockSnackbarService mockSnackbarService;
    late MockLocalizationService mockLocalizationService;
    late MockMobileScannerController mockScannerController;
    late MockErrorHandlingService mockErrorHandlingService;

    setUp(() {
      mockNavigationService = MockGetxNavigationService();
      mockSnackbarService = MockSnackbarService();
      mockLocalizationService = MockLocalizationService();
      mockScannerController = MockMobileScannerController();
      mockErrorHandlingService = MockErrorHandlingService();

      Get.put<QrScannerController>(
        QrScannerController(
          mockNavigationService,
          snackbarService: mockSnackbarService,
          localizationService: mockLocalizationService,
          scannerController: mockScannerController,
          errorHandlingService: mockErrorHandlingService,
        ),
      );

      controller = Get.find<QrScannerController>();
    });

    tearDown(() {
      Get.reset();
    });

    test(
      'should navigate to attendanceStatus when a valid QR code is scanned',
      () async {
        // Arrange
        final employee = Employee(id: '123', name: 'John Doe');
        final qrCode = jsonEncode(employee.toJson());
        final barcode = Barcode(rawValue: qrCode);
        final barcodeCapture = BarcodeCapture(barcodes: [barcode]);

        // Act
        await controller.onBarcodeDetected(barcodeCapture);

        // Assert
        verify(
          mockNavigationService.toNamed(
            Routes.attendanceStatus,
            arguments: predicate<Employee>(
              (e) => e.id == employee.id && e.name == employee.name,
            ),
          ),
        ).called(1);
      },
    );

    test(
      'should show error snackbar when an invalid QR code is scanned',
      () async {
        // Arrange
        const invalidQrCode = 'invalid_qr_code';
        final barcode = Barcode(rawValue: invalidQrCode);
        final barcodeCapture = BarcodeCapture(barcodes: [barcode]);
        when(mockLocalizationService.snackbarErrorTitle).thenReturn('Error');
        when(
          mockLocalizationService.snackbarInvalidQrCodeFormat,
        ).thenReturn('Invalid QR code format');

        // Act
        await controller.onBarcodeDetected(barcodeCapture);

        // Assert
        verify(
          mockErrorHandlingService.handleError(
            any,
            message: anyNamed('message'),
          ),
        ).called(1);
      },
    );
  });
}
