import 'package:demo_qr_scanner/bindings/app_bindings.dart';
import 'package:demo_qr_scanner/core/services/navigation_service.dart';
import 'package:demo_qr_scanner/features/manual_entry/presentation/bindings/manual_entry_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

import 'package:demo_qr_scanner/features/manual_entry/presentation/controllers/manual_entry_controller.dart';
import 'package:demo_qr_scanner/routes/app_pages.dart';
import 'package:demo_qr_scanner/features/employee/domain/models/employee.dart';

import '../../../../mocks.mocks.dart';

void main() {
  late ManualEntryController manualEntryController;
  late MockFormState mockFormState;
  late MockFormStateKey mockFormStateKey;
  late MockGetxNavigationService mockGetxNavigationService;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    Get.testMode = true; // Enable test mode for GetX
    Get.config(enableLog: false); // Disable GetX logs during tests
    mockFormStateKey = MockFormStateKey();
    Get.replace<GlobalKey<FormState>>(mockFormStateKey);
    mockFormState = MockFormState();
    when(mockFormStateKey.currentState).thenReturn(mockFormState);
    mockGetxNavigationService = MockGetxNavigationService();
    Get.replace<NavigationService>(mockGetxNavigationService);
    AppBindings().dependencies();
    ManualEntryBinding().dependencies();
    manualEntryController = ManualEntryController();
  });

  tearDown(() {
    manualEntryController.dispose();
    Get.reset(); // Reset GetX state after each test
  });

  group('ManualEntryController', () {
    test('confirmEntry navigates to attendanceStatus on valid input', () {
      // Mock form validation to return true
      when(mockFormState.validate()).thenReturn(true);

      // Set text field values
      manualEntryController.idController.text = 'testId';
      manualEntryController.nameController.text = 'testName';
      manualEntryController.confirmEntry();

      verify(
        mockGetxNavigationService.offNamed(
          Routes.attendanceStatus,
          arguments: argThat(
            isA<Employee>()
                .having((e) => e.id, 'id', 'testId')
                .having((e) => e.name, 'name', 'testName'),
            named: 'arguments',
          ),
        ),
      ).called(1);
    });

    test('confirmEntry does not navigate on invalid input', () {
      // Mock form validation to return false
      when(mockFormState.validate()).thenReturn(false);

      // Call confirmEntry
      manualEntryController.confirmEntry();

      // Verify navigation did not occur
      verifyNever(
        mockGetxNavigationService.offNamed(
          any,
          arguments: anyNamed('arguments'),
        ),
      );
    });
  });
}
