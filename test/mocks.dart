import 'package:demo_qr_scanner/core/services/getx_navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';

import 'package:demo_qr_scanner/core/database/database_service.dart'; // Import DatabaseService

@GenerateNiceMocks([
  MockSpec<DatabaseService>(as: #MockDatabaseService),

  MockSpec<GlobalKey<FormState>>(as: #MockFormStateKey),
  MockSpec<FormState>(),
  MockSpec<GetxNavigationService>(),
])
void main() {}

