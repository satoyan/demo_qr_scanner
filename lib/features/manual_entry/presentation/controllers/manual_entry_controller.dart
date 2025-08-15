import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_qr_scanner/features/employee/domain/models/employee.dart';
import 'package:demo_qr_scanner/routes/app_pages.dart';
import 'package:demo_qr_scanner/core/utils/app_logger.dart';

class ManualEntryController extends GetxController {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void confirmEntry() {
    if (formKey.currentState!.validate()) {
      final employee = Employee(
        id: idController.text,
        name: nameController.text,
      );
      appLogger.d(
        'Manually entered Employee: ${employee.id}, ${employee.name}',
      );
      Get.offNamed(Routes.attendanceStatus, arguments: employee);
    }
  }

  @override
  void onClose() {
    idController.dispose();
    nameController.dispose();
    super.onClose();
  }
}

