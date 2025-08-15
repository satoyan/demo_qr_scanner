import 'package:flutter_test/flutter_test.dart';
import 'package:demo_qr_scanner/features/employee/domain/models/employee.dart';

void main() {
  group('Employee', () {
    test('fromJson creates a valid Employee object', () {
      final Map<String, dynamic> json = {
        'id': 'emp123',
        'name': 'John Doe',
      };
      final employee = Employee.fromJson(json);

      expect(employee.id, 'emp123');
      expect(employee.name, 'John Doe');
    });

    test('toJson converts Employee object to valid JSON', () {
      final employee = Employee(id: 'emp456', name: 'Jane Smith');
      final json = employee.toJson();

      expect(json['id'], 'emp456');
      expect(json['name'], 'Jane Smith');
    });
  });
}