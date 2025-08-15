import 'package:get/get.dart';
import 'package:demo_qr_scanner/core/services/navigation_service.dart';

class GetxNavigationService implements NavigationService {
  @override
  Future<T?>? toNamed<T>(String pageName, {dynamic arguments}) {
    return Get.toNamed(pageName, arguments: arguments);
  }

  @override
  void back<T>({T? result}) {
    Get.back(result: result);
  }

  @override
  Future<T?>? offNamed<T>(String pageName, {dynamic arguments}) {
    return Get.offNamed(pageName, arguments: arguments);
  }

  @override
  Future<T?>? offAllNamed<T>(String pageName, {dynamic arguments}) {
    return Get.offAllNamed(pageName, arguments: arguments);
  }
}

