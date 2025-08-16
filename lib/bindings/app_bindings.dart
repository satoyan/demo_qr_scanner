import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_qr_scanner/core/services/getx_navigation_service.dart';
import 'package:demo_qr_scanner/core/services/getx_snackbar_service.dart';
import 'package:demo_qr_scanner/core/services/navigation_service.dart';
import 'package:demo_qr_scanner/core/services/snackbar_service.dart';
import 'package:demo_qr_scanner/core/services/localization_service.dart';
import 'package:demo_qr_scanner/core/services/getx_localization_service.dart';
import 'package:get/get.dart';
import 'package:demo_qr_scanner/core/database/app_database.dart';
import 'package:demo_qr_scanner/features/attendance/domain/services/attendance_service.dart';
import 'package:demo_qr_scanner/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:demo_qr_scanner/features/attendance/data/repositories/attendance_repository_impl.dart';
import 'package:demo_qr_scanner/core/network/network_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationService>(() => GetxNavigationService(), fenix: true);
    Get.lazyPut<AppDatabase>(() => AppDatabase(), fenix: true);
    Get.lazyPut<AttendanceRepository>(
      () => AttendanceRepositoryImpl(Get.find<AppDatabase>()),
      fenix: true,
    );
    Get.lazyPut<AttendanceService>(
      () => AttendanceService(Get.find<AttendanceRepository>()),
    );
    Get.lazyPut<Connectivity>(() => Connectivity(), fenix: true);
    Get.lazyPut<SnackbarService>(() => GetxSnackbarService(), fenix: true);
    Get.lazyPut<LocalizationService>(
      () => GetxLocalizationService(),
      fenix: true,
    );
    Get.lazyPut<NetworkController>(
      () => NetworkController(
        Get.find<AttendanceService>(),
        Get.find<Connectivity>(),
      ),
      fenix: true,
    );
  }
}
