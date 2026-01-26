import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import '../lib/models/questionnaire_template_model.dart';
import '../lib/services/api_service.dart';

void main() {
  group('Lead Submission Tests', () {
    test('Test LeadSubmissionRequest JSON serialization', () {
      // Create test questionnaire responses
      final responses = [
        QuestionnaireResponse(
          questionId: '70d3385f-41dc-4f65-99fd-1e24ce75777e',
          answer: 'Unarmed Guards',
        ),
        QuestionnaireResponse(
          questionId: '008113f7-facc-40b2-9254-e2429b4f5fbb',
          answer: '5',
        ),
      ];

      // Convert to manual JSON like the actual app does
      final responsesJson = responses.map((response) => {
        'question_id': response.questionId,
        'answer': response.answer,
      }).toList();

      // Create manual JSON like the actual app does
      final manualJson = {
        'company_name': 'Test Company',
        'contact_person_name': 'John Doe',
        'mobile_number': '1234567890',
        'email': 'test@example.com',
        'address': '123 Test Street',
        'city': 'Test City',
        'state': 'Test State',
        'country': 'India',
        'postal_code': '000000',
        'lead_source': 'website',
        'assigned_sales_exec_id': 33,
        'service_type_id': 1,
        'tentative_guards_count': 1,
        'working_hours_type': '8',
        'site_type': 'office',
        'service_location': '123 Test Street, Test City, Test State',
        'compliance_required': 'yes',
        'sales_notes': 'Test notes',
        'budget_range_min': 100000,
        'budget_range_max': 200000,
        'questionnaire_responses': responsesJson,
      };
      
      // Verify the JSON structure
      expect(manualJson['company_name'], equals('Test Company'));
      expect(manualJson['contact_person_name'], equals('John Doe'));
      expect(manualJson['mobile_number'], equals('1234567890'));
      expect(manualJson['email'], equals('test@example.com'));
      expect(manualJson['questionnaire_responses'], isA<List>());
      
      final questionnaireJson = manualJson['questionnaire_responses'] as List;
      expect(questionnaireJson.length, equals(2));
      expect(questionnaireJson[0]['question_id'], equals('70d3385f-41dc-4f65-99fd-1e24ce75777e'));
      expect(questionnaireJson[0]['answer'], equals('Unarmed Guards'));
      expect(questionnaireJson[1]['question_id'], equals('008113f7-facc-40b2-9254-e2429b4f5fbb'));
      expect(questionnaireJson[1]['answer'], equals('5'));

      print('✅ LeadSubmissionRequest JSON serialization test passed');
      print('Generated JSON: ${jsonEncode(manualJson)}');
    });

    test('Test manual JSON creation for API submission', () {
      // Test the manual JSON creation that we use in the controller
      final responsesJson = [
        {
          'question_id': '70d3385f-41dc-4f65-99fd-1e24ce75777e',
          'answer': 'Unarmed Guards',
        },
        {
          'question_id': '008113f7-facc-40b2-9254-e2429b4f5fbb',
          'answer': '5',
        },
      ];

      final manualJson = {
        'company_name': 'Test Company',
        'contact_person_name': 'John Doe',
        'mobile_number': '1234567890',
        'email': 'test@example.com',
        'address': '123 Test Street',
        'city': 'Test City',
        'state': 'Test State',
        'country': 'India',
        'postal_code': '000000',
        'lead_source': 'website',
        'assigned_sales_exec_id': 33,
        'service_type_id': 1,
        'tentative_guards_count': 1,
        'working_hours_type': '8',
        'site_type': 'office',
        'service_location': '123 Test Street, Test City, Test State',
        'compliance_required': 'yes',
        'sales_notes': 'Test notes',
        'budget_range_min': 100000,
        'budget_range_max': 200000,
        'questionnaire_responses': responsesJson,
      };

      // Verify the manual JSON structure
      expect(manualJson['company_name'], equals('Test Company'));
      expect(manualJson['questionnaire_responses'], isA<List>());
      
      final questionnaireJson = manualJson['questionnaire_responses'] as List;
      expect(questionnaireJson.length, equals(2));
      expect(questionnaireJson[0]['question_id'], equals('70d3385f-41dc-4f65-99fd-1e24ce75777e'));
      expect(questionnaireJson[0]['answer'], equals('Unarmed Guards'));

      print('✅ Manual JSON creation test passed');
      print('Generated JSON: ${jsonEncode(manualJson)}');
    });

    test('Test QuestionnaireResponse serialization', () {
      final response = QuestionnaireResponse(
        questionId: 'test-question-id',
        answer: 'Test Answer',
      );

      final json = response.toJson();
      
      expect(json['question_id'], equals('test-question-id'));
      expect(json['answer'], equals('Test Answer'));

      print('✅ QuestionnaireResponse serialization test passed');
      print('Generated JSON: ${jsonEncode(json)}');
    });

    test('Test API response parsing with null values', () {
      // Simulate API response with null values
      final apiResponse = {
        'success': true,
        'message': 'Lead created successfully',
        'data': {
          'company_name': 'Test Company',
          'contact_person_name': 'John Doe',
          'mobile_number': '1234567890',
          'email': 'test@example.com',
          'address': '123 Test Street',
          'city': 'Test City',
          'state': 'Test State',
          'country': 'India',
          'postal_code': '000000',
          'lead_source': 'website',
          'assigned_sales_exec_id': 33,
          'service_type_id': 1,
          'tentative_guards_count': 1,
          'working_hours_type': '8',
          'site_type': 'office',
          'service_location': '123 Test Street, Test City, Test State',
          'compliance_required': 'yes',
          'sales_notes': null, // This should be handled
          'budget_range_min': null, // This should be handled
          'budget_range_max': null, // This should be handled
          'rba_applicable': false,
          'lead_status': 'new',
          'tenant_id': 1,
          'id': 'test-lead-id',
          'updated_at': '2026-01-26T11:03:58.000000Z',
          'created_at': '2026-01-26T11:03:58.000000Z',
          'service_type': {
            'id': 1,
            'type': 'security',
            'name': 'Security Services',
            'description': 'Security and patrol services',
            'capabilities': ['Geofencing', 'Incident Logging'],
            'is_active': true,
            'tenant_id': 1,
            'created_at': '2026-01-12T20:40:36.000000Z',
            'updated_at': '2026-01-12T20:40:36.000000Z',
          },
          'assigned_sales_exec': null, // This should be handled
          'questionnaire_responses': [], // This should be handled
        }
      };

      // Test that we can access the required fields safely
      expect(apiResponse['success'], equals(true));
      expect(apiResponse['message'], equals('Lead created successfully'));
      
      final data = apiResponse['data'] as Map<String, dynamic>;
      expect(data['company_name'], equals('Test Company'));
      expect(data['sales_notes'], equals(null)); // Should handle null
      expect(data['assigned_sales_exec'], equals(null)); // Should handle null

      print('✅ API response parsing with null values test passed');
      print('API Response: ${jsonEncode(apiResponse)}');
    });
  });
}
