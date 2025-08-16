import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_qr_scanner/core/network/network_controller.dart';
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
      // Arrange: 接続状態がnoneではない場合を想定
      when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => [ConnectivityResult.wifi]);

      // Act: 接続状態を確認
      await networkController.checkConnectivity();

      // Assert: 接続されていることを確認
      expect(networkController.isConnected.value, true);
    });

    test('should not be connected when connectivity result is none', () async {
      // Arrange: 接続状態がnoneの場合を想定
      when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => [ConnectivityResult.none]);

      // Act: 接続状態を確認
      await networkController.checkConnectivity();

      // Assert: 接続されていないことを確認
      expect(networkController.isConnected.value, false);
    });

    test('should sync data when connected', () async {
      // Arrange: 接続状態がwifiで、未同期レコードがある場合を想定
      when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => [ConnectivityResult.wifi]);
      when(mockAttendanceService.getUnsyncedAttendanceRecords()).thenAnswer((_) async => []);

      // Act: 接続状態を確認
      await networkController.checkConnectivity();

      // Assert: 未同期レコードの取得が呼ばれたことを確認
      verify(mockAttendanceService.getUnsyncedAttendanceRecords()).called(1);
    });

    test('should not sync data when not connected', () async {
      // Arrange: 接続状態がnoneの場合を想定
      when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => [ConnectivityResult.none]);

      // Act: 接続状態を確認
      await networkController.checkConnectivity();

      // Assert: 未同期レコードの取得が呼ばれないことを確認
      verifyNever(mockAttendanceService.getUnsyncedAttendanceRecords());
    });
  });
}
