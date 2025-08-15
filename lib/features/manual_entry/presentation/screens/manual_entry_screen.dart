import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_qr_scanner/core/extensions/build_context_extension.dart';
import 'package:demo_qr_scanner/features/employee/domain/models/employee.dart'; // Import Employee model
import 'package:demo_qr_scanner/routes/app_pages.dart'; // Import AppPages for Routes
import 'package:demo_qr_scanner/core/constants/app_constants.dart'; // Import AppConstants

class ManualEntryScreen extends StatefulWidget {
  const ManualEntryScreen({super.key});

  @override
  State<ManualEntryScreen> createState() => _ManualEntryScreenState();
}

class _ManualEntryScreenState extends State<ManualEntryScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.noQrCodeOption),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.m),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _idController,
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
                controller: _nameController,
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final employee = Employee(
                      id: _idController.text,
                      name: _nameController.text,
                    );
                    Get.toNamed(Routes.attendanceStatus, arguments: employee);
                  }
                },
                child: Text(context.l10n.confirmButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}