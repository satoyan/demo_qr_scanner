import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_qr_scanner/core/network/network_controller.dart';
import 'package:demo_qr_scanner/features/attendance/domain/services/attendance_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';

void main() {
  late NetworkController networkController;
  late MockAttendanceService mockAttendanceService;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockAttendanceService = MockAttendanceService();
    mockConnectivity = MockConnectivity();
    networkController = NetworkController(mockAttendanceService, mockConnectivity);
  });

  group('NetworkController', () {
    test('should be connected when connectivity result is not none', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => [ConnectivityResult.wifi]);

      // Act
      await networkController.checkConnectivity();

      // Assert
      expect(networkController.isConnected.value, true);
    });

    test('should not be connected when connectivity result is none', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => [ConnectivityResult.none]);

      // Act
      await networkController.checkConnectivity();

      // Assert
      expect(networkController.isConnected.value, false);
    });

    test('should sync data when connected', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => [ConnectivityResult.wifi]);
      when(mockAttendanceService.getUnsyncedAttendanceRecords()).thenAnswer((_) async => []);

      // Act
      await networkController.checkConnectivity();

      // Assert
      verify(mockAttendanceService.getUnsyncedAttendanceRecords()).called(1);
    });

    test('should not sync data when not connected', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => [ConnectivityResult.none]);

      // Act
      await networkController.checkConnectivity();

      // Assert
      verifyNever(mockAttendanceService.getUnsyncedAttendanceRecords());
    });
  });
}
