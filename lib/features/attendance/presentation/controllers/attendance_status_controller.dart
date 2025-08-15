import 'dart:async';
import 'package:get/get.dart';

class AttendanceStatusController extends GetxController {
  final _currentTime = DateTime.now().obs;
  late Timer _timer;

  DateTime get currentTime => _currentTime.value;

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _currentTime.value = DateTime.now();
    });
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
