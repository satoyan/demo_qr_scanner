import 'package:get/get.dart';
import 'package:demo_qr_scanner/features/manual_entry/presentation/controllers/manual_entry_controller.dart';

class ManualEntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManualEntryController>(() => ManualEntryController());
  }
}

