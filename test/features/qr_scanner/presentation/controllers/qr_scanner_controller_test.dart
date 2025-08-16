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
  late MockSnackbarService mockSnackbarService;
  late MockLocalizationService mockLocalizationService;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    Get.testMode = true;
    Get.config(enableLog: false);

    mockNavigationService = MockGetxNavigationService();
    mockMobileScannerController = MockMobileScannerController();
    mockSnackbarService = MockSnackbarService();
    mockLocalizationService = MockLocalizationService();

    when(mockLocalizationService.snackbarErrorTitle).thenReturn('エラー');
    when(mockLocalizationService.snackbarInvalidQrCodeFormat).thenReturn('無効なQRコード形式です');

    controller = QrScannerController(mockNavigationService, scannerController: mockMobileScannerController, snackbarService: mockSnackbarService, localizationService: mockLocalizationService);
    Get.put(mockSnackbarService);
    Get.put(mockLocalizationService);
  });

  tearDown(() {
    Get.reset();
  });

  group('QrScannerController', () {
    test('navigateToManualEntry navigates to manual entry screen', () {
      // Act: 手動入力画面へ遷移
      controller.navigateToManualEntry();

      // Assert: ナビゲーションサービスが手動入力画面へ遷移するよう呼ばれたことを確認
      verify(mockNavigationService.toNamed(Routes.manualEntry)).called(1);
    });

    test('handleQrCode navigates to attendance status screen on valid QR code', () async {
      // Arrange: 有効なQRコード値を準備
      final employee = Employee(id: 'testId', name: 'testName');
      final qrCodeValue = jsonEncode(employee.toJson());
      when(mockMobileScannerController.stop()).thenAnswer((_) async {});
      when(mockMobileScannerController.start()).thenAnswer((_) async {});

      // Act: QRコードを処理
      await controller.handleQrCode(qrCodeValue);

      // Assert: ナビゲーションサービスが出退勤ステータス画面へ遷移するよう呼ばれたことを確認
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
      // Arrange: 無効なQRコード値を準備
      const qrCodeValue = 'invalid_json';
      when(mockMobileScannerController.stop()).thenAnswer((_) async {});
      when(mockMobileScannerController.start()).thenAnswer((_) async {});

      // Act: QRコードを処理
      await controller.handleQrCode(qrCodeValue);

      // Assert: ナビゲーションサービスが呼ばれないことを確認
      verifyNever(mockNavigationService.toNamed(any, arguments: anyNamed('arguments')));
      verify(mockSnackbarService.showSnackbar(any, any)).called(1);
    });
  });
}


