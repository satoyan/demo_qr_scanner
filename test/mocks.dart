import 'package:mockito/annotations.dart';

import 'package:demo_qr_scanner/core/database/database_service.dart'; // Import DatabaseService

@GenerateNiceMocks([
  MockSpec<DatabaseService>(
    as: #MockDatabaseService,
  ),
])
void main() {}