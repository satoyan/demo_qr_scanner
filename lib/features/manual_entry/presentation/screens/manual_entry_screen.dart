import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for FilteringTextInputFormatter
import 'package:get/get.dart';
import 'package:demo_qr_scanner/core/extensions/build_context_extension.dart';
import 'package:demo_qr_scanner/core/constants/app_constants.dart'; // Import AppConstants
import 'package:demo_qr_scanner/features/manual_entry/presentation/controllers/manual_entry_controller.dart'; // Import ManualEntryController
import 'package:demo_qr_scanner/core/utils/app_validator.dart'; // Import AppValidator

class ManualEntryScreen extends GetView<ManualEntryController> {
  const ManualEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.noQrCodeOption),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.m),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.idController,
                keyboardType: TextInputType.text,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'))],
                decoration: InputDecoration(
                  labelText: context.l10n.enterIdHint,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) => AppValidator.isNotEmpty(value, context.l10n.idEmptyError),
              ),
              const SizedBox(height: AppSpacing.m),
              TextFormField(
                controller: controller.nameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: context.l10n.enterNameHint,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) => AppValidator.isNotEmpty(value, context.l10n.nameEmptyError),
              ),
              const SizedBox(height: AppSpacing.xl),
              ElevatedButton(
                onPressed: controller.confirmEntry,
                child: Text(context.l10n.confirmButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}