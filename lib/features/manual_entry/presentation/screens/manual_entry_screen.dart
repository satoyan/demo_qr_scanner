import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_qr_scanner/core/extensions/build_context_extension.dart';
import 'package:demo_qr_scanner/core/constants/app_constants.dart'; // Import AppConstants
import 'package:demo_qr_scanner/features/manual_entry/presentation/controllers/manual_entry_controller.dart'; // Import ManualEntryController

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
                decoration: InputDecoration(
                  labelText: context.l10n.enterIdHint,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter ID'; // TODO: Localize this
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSpacing.m),
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  labelText: context.l10n.enterNameHint,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Name'; // TODO: Localize this
                  }
                  return null;
                },
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