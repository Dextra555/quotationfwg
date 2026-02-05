import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/login_response_model.dart';
import '../models/questionnaire_template_model.dart';
import 'session_service.dart';
import 'network_service.dart';

class ApiService {
  static const String devBaseUrl = 'https://dev-fwg.dextragroups.com/api/v1';

  static Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    // Check network connectivity first
    if (!(await NetworkService.isConnected())) {
      throw Exception('No internet connection. Please check your network settings.');
    }
    
    final url = Uri.parse('$devBaseUrl/employee/auth/login');
    
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () => throw Exception('Request timeout. Please check your internet connection.'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return LoginResponse.fromJson(responseData);
      } else if (response.statusCode >= 500) {
        throw Exception('Server error. Please try again later.');
      } else if (response.statusCode == 401) {
        throw Exception('Invalid credentials. Please check your email and password.');
      } else {
        throw Exception('Login failed: ${response.statusCode} - ${response.body}');
      }
    } on http.ClientException catch (e) {
      throw Exception('Network error: Unable to connect to server. Please check your internet connection.');
    } catch (e) {
      if (e.toString().contains('timeout')) {
        throw Exception('Connection timeout. Please check your internet connection and try again.');
      }
      throw Exception('Network error: $e');
    }
  }

  // Questionnaire API methods
  static Future<QuestionnaireTemplateResponse> getQuestionnaireTemplates() async {
    // Check network connectivity first
    if (!(await NetworkService.isConnected())) {
      throw Exception('No internet connection. Please check your network settings.');
    }
    
    final url = Uri.parse('$devBaseUrl/questionnaires/templates');
    
    try {
      // Get authentication token
      final token = await SessionService.getToken();
      
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
      
      final response = await http.get(
        url,
        headers: headers,
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () => throw Exception('Request timeout. Please check your internet connection.'),
      );

      if (response.statusCode == 200) {
        try {
          print('API Response body: ${response.body}'); // Debug log
          
          // Check if response body is empty
          if (response.body.isEmpty) {
            throw Exception('Empty response from server');
          }
          
          final Map<String, dynamic> responseData = jsonDecode(response.body);
          
          // Check if response data is valid
          if (responseData == null) {
            print('Response data is null'); // Debug log
            throw Exception('Invalid response from server');
          }
          
          print('Parsed response data: $responseData'); // Debug log
          
          // Check if the response has the expected structure
          if (!responseData.containsKey('success') || !responseData.containsKey('data')) {
            print('Invalid response structure: $responseData'); // Debug log
            throw Exception('Invalid response format from server');
          }
          
          return QuestionnaireTemplateResponse.fromJson(responseData);
        } catch (e) {
          print('JSON parsing error: $e'); // Debug log
          if (e.toString().contains('Null')) {
            throw Exception('Server returned invalid data. Please try again later.');
          }
          rethrow;
        }
      } else if (response.statusCode >= 500) {
        throw Exception('Server error. Please try again later.');
      } else if (response.statusCode == 401) {
        throw Exception('Session expired. Please login again.');
      } else {
        throw Exception('Failed to fetch questionnaire templates: ${response.statusCode} - ${response.body}');
      }
    } on http.ClientException catch (e) {
      throw Exception('Network error: Unable to connect to server. Please check your internet connection.');
    } catch (e) {
      if (e.toString().contains('timeout')) {
        throw Exception('Connection timeout. Please check your internet connection and try again.');
      }
      throw Exception('Network error: $e');
    }
  }

  static Future<QuestionnaireQuestionsResponse> getQuestionnaireQuestions(String templateId) async {
    // Check network connectivity first
    if (!(await NetworkService.isConnected())) {
      throw Exception('No internet connection. Please check your network settings.');
    }
    
    final url = Uri.parse('$devBaseUrl/questionnaires/templates/$templateId');
    print('Fetching questions from: $url'); // Debug log
    
    try {
      // Get authentication token
      final token = await SessionService.getToken();
      
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () => throw Exception('Request timeout. Please check your internet connection.'),
      );

      print('Questions API Response Status: ${response.statusCode}'); // Debug log
      print('Questions API Response Body: ${response.body}'); // Debug log

      if (response.statusCode == 200) {
        try {
          final Map<String, dynamic> responseData = jsonDecode(response.body);
          
          // Check if response data is valid
          if (responseData == null) {
            print('Response data is null'); // Debug log
            throw Exception('Invalid response from server');
          }
          
          // Validate the response structure before parsing
          if (responseData['success'] != true || responseData['data'] == null) {
            print('Invalid response structure: $responseData'); // Debug log
            throw Exception('Invalid response structure from server');
          }
          
          final data = responseData['data'];
          if (data['questions'] == null) {
            print('No questions in response: $responseData'); // Debug log
            throw Exception('No questions found in response');
          }
          
          print('Parsed questions response: $responseData'); // Debug log
          return QuestionnaireQuestionsResponse.fromJson(responseData);
        } catch (e) {
          print('JSON parsing error in questions: $e'); // Debug log
          print('Response body was: ${response.body}'); // Debug log
          
          if (e.toString().contains('Null') || e.toString().contains('subtype')) {
            // Try to parse manually with more error tolerance - completely manual approach
            try {
              final Map<String, dynamic> responseData = jsonDecode(response.body);
              final data = responseData['data'];
              
              if (data != null && data['questions'] != null) {
                final questions = data['questions'] as List;
                final validQuestions = <Question>[];
                
                for (var question in questions) {
                  if (question is Map<String, dynamic>) {
                    // Manually create Question objects with safe defaults
                    try {
                      // Handle options that can come in any format
                      List<String>? parsedOptions;
                      if (question['options'] != null) {
                        if (question['options'] is String) {
                          // Split comma-separated string options
                          parsedOptions = (question['options'] as String)
                              .split(',')
                              .map((option) => option.trim())
                              .where((option) => option.isNotEmpty)
                              .toList();
                        } else if (question['options'] is List) {
                          // Handle list options
                          parsedOptions = (question['options'] as List<dynamic>)
                              .map((option) => option.toString())
                              .toList();
                        } else if (question['options'] is Map) {
                          // Handle map options - extract values
                          final optionsMap = question['options'] as Map<String, dynamic>;
                          parsedOptions = optionsMap.values.map((option) => option.toString()).toList();
                        } else {
                          // Handle any other type by converting to string
                          parsedOptions = [question['options'].toString()];
                        }
                      }

                      // Extract display order from various possible field names
                      int? displayOrder;
                      final possibleOrderFields = ['display_order', 'displayOrder', 'order', 'sort_order', 'sortOrder'];
                      for (final field in possibleOrderFields) {
                        if (question[field] != null) {
                          if (question[field] is num) {
                            displayOrder = (question[field] as num).toInt();
                          } else {
                            displayOrder = int.tryParse(question[field].toString()) ?? 0;
                          }
                          break;
                        }
                      }

                      // Extract mandatory status from various possible field names
                      bool isMandatory = false;
                      final possibleMandatoryFields = ['is_mandatory', 'isMandatory', 'mandatory', 'required', 'isRequired'];
                      for (final field in possibleMandatoryFields) {
                        if (question[field] != null) {
                          if (question[field] is bool) {
                            isMandatory = question[field] as bool;
                          } else {
                            isMandatory = question[field].toString().toLowerCase() == 'true';
                          }
                          break;
                        }
                      }

                      final questionObj = Question(
                        id: question['id']?.toString() ?? question['_id']?.toString() ?? '',
                        text: question['text']?.toString() ?? question['question']?.toString() ?? question['title']?.toString() ?? '',
                        type: question['type']?.toString() ?? question['question_type']?.toString() ?? question['inputType']?.toString() ?? 'text',
                        isMandatory: isMandatory,
                        options: parsedOptions,
                        helpText: question['help_text']?.toString() ?? question['helpText']?.toString() ?? question['description']?.toString(),
                        conditionalLogic: question['conditional_logic'] ?? question['conditionalLogic'] ?? question['conditions'],
                        displayOrder: displayOrder ?? 0,
                      );
                      validQuestions.add(questionObj);
                    } catch (questionError) {
                      print('Error parsing individual question: $questionError');
                      // Skip this question and continue with others
                      continue;
                    }
                  }
                }
                
                // Create template manually
                final templateData = data['template'] as Map<String, dynamic>? ?? {};
                final template = QuestionnaireTemplate(
                  id: templateData['id']?.toString() ?? '',
                  name: templateData['name']?.toString() ?? '',
                  description: templateData['description']?.toString() ?? '',
                  serviceType: ServiceType(
                    id: templateData['service_type']?['id'] as int? ?? 1,
                    name: templateData['service_type']?['name']?.toString() ?? '',
                  ),
                  questionCount: validQuestions.length,
                );
                
                // Parse inventory items if available
                final List<InventoryItem>? inventoryItems;
                if (data['inventory_items'] != null) {
                  final inventoryList = data['inventory_items'] as List;
                  inventoryItems = inventoryList.map((item) {
                    final itemData = item as Map<String, dynamic>;
                    final inventoryItemData = itemData['inventory_item'] as Map<String, dynamic>;
                    
                    return InventoryItem(
                      id: itemData['id']?.toString() ?? '',
                      inventoryItem: InventoryItemData(
                        id: inventoryItemData['id']?.toString() ?? '',
                        name: inventoryItemData['name']?.toString() ?? '',
                        description: inventoryItemData['description']?.toString() ?? '',
                        sku: inventoryItemData['sku']?.toString() ?? '',
                        category: Category(
                          id: inventoryItemData['category']?['id']?.toString() ?? '',
                          name: inventoryItemData['category']?['name']?.toString() ?? '',
                        ),
                        unit: inventoryItemData['unit']?.toString() ?? '',
                        costPrice: inventoryItemData['cost_price']?.toString() ?? '0',
                        sellingPrice: inventoryItemData['selling_price']?.toString() ?? '0',
                        stockQuantity: inventoryItemData['stock_quantity'] as int?,
                        reorderLevel: inventoryItemData['reorder_level'] as int?,
                        isActive: inventoryItemData['is_active'] as bool? ?? true,
                      ),
                      triggerCondition: itemData['trigger_condition'],
                      optionLabel: itemData['option_label']?.toString(),
                      defaultQuantity: itemData['default_quantity'] as int?,
                      isOptional: itemData['is_optional'] as bool?,
                      displayOrder: itemData['display_order'] as int?,
                      totalCost: itemData['total_cost'],
                    );
                  }).toList();
                } else {
                  inventoryItems = null;
                }
                
                final questionnaireData = QuestionnaireData(
                  template: template,
                  questions: validQuestions,
                  inventoryItems: inventoryItems,
                );
                
                final response = QuestionnaireQuestionsResponse(
                  success: true,
                  data: questionnaireData,
                );
                
                print('Manual parsing successful with ${validQuestions.length} questions and ${inventoryItems?.length ?? 0} inventory items');
                return response;
              }
            } catch (fallbackError) {
              print('Manual parsing also failed: $fallbackError');
            }
            
            throw Exception('Server returned incomplete data. Please try again later.');
          }
          rethrow;
        }
      } else if (response.statusCode >= 500) {
        throw Exception('Server error. Please try again later.');
      } else if (response.statusCode == 401) {
        throw Exception('Session expired. Please login again.');
      } else {
        throw Exception('Failed to fetch questionnaire questions: ${response.statusCode} - ${response.body}');
      }
    } on http.ClientException catch (e) {
      throw Exception('Network error: Unable to connect to server. Please check your internet connection.');
    } catch (e) {
      if (e.toString().contains('timeout')) {
        throw Exception('Connection timeout. Please check your internet connection and try again.');
      }
      throw Exception('Network error: $e');
    }
  }

  static Future<LeadSubmissionResponse> submitLead(LeadSubmissionRequest leadData) async {
    // Check network connectivity first
    if (!(await NetworkService.isConnected())) {
      throw Exception('No internet connection. Please check your network settings.');
    }
    
    final url = Uri.parse('$devBaseUrl/leads');
    
    try {
      // Get authentication token
      final token = await SessionService.getToken();
      
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(leadData.toJson()),
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () => throw Exception('Request timeout. Please check your internet connection.'),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return LeadSubmissionResponse.fromJson(responseData);
      } else if (response.statusCode >= 500) {
        throw Exception('Server error. Please try again later.');
      } else if (response.statusCode == 401) {
        throw Exception('Session expired. Please login again.');
      } else {
        throw Exception('Failed to submit lead: ${response.statusCode} - ${response.body}');
      }
    } on http.ClientException catch (e) {
      throw Exception('Network error: Unable to connect to server. Please check your internet connection.');
    } catch (e) {
      if (e.toString().contains('timeout')) {
        throw Exception('Connection timeout. Please check your internet connection and try again.');
      }
      throw Exception('Network error: $e');
    }
  }

  static Future<Map<String, dynamic>> getLeadCounts(String token) async {
    // Check network connectivity first
    if (!(await NetworkService.isConnected())) {
      throw Exception('No internet connection. Please check your network settings.');
    }
    
    final url = Uri.parse('$devBaseUrl/leads/counts');
    
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () => throw Exception('Request timeout. Please check your internet connection.'),
      );

      if (response.statusCode == 200) {
        try {
          final Map<String, dynamic> responseData = jsonDecode(response.body);
          print('=== Lead Counts API RESPONSE DEBUG ===');
          print('Response Status: ${response.statusCode}');
          print('Response Body: ${response.body}');
          print('=====================================');
          
          return responseData;
        } catch (e) {
          throw Exception('Failed to parse lead counts response: $e');
        }
      } else if (response.statusCode == 401) {
        throw Exception('Session expired. Please login again.');
      } else if (response.statusCode == 404) {
        throw Exception('Lead counts endpoint not found.');
      } else {
        throw Exception('Failed to fetch lead counts: ${response.statusCode} - ${response.body}');
      }
    } on http.ClientException catch (e) {
      throw Exception('Network error: Unable to connect to server. Please check your internet connection.');
    } catch (e) {
      if (e.toString().contains('timeout')) {
        throw Exception('Connection timeout. Please check your internet connection and try again.');
      }
      throw Exception('Network error: $e');
    }
  }

  static Future<LeadSubmissionResponse> submitLeadWithManualJson(Map<String, dynamic> jsonData) async {
    // Check network connectivity first
    if (!(await NetworkService.isConnected())) {
      throw Exception('No internet connection. Please check your network settings.');
    }
    
    final url = Uri.parse('$devBaseUrl/leads');
    
    try {
      // Get authentication token
      final token = await SessionService.getToken();
      
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(jsonData),
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () => throw Exception('Request timeout. Please check your internet connection.'),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          final Map<String, dynamic> responseData = jsonDecode(response.body);
          print('=== API RESPONSE DEBUG ===');
          print('Response Status: ${response.statusCode}');
          print('Response Body: ${response.body}');
          print('==========================');
          
          // Simple success check - if success is true, return success response
          if (responseData['success'] == true) {
            return LeadSubmissionResponse(
              success: true,
              message: responseData['message'] ?? 'Lead created successfully',
              data: LeadData(
                id: responseData['data']['id']?.toString() ?? '',
                companyName: responseData['data']['company_name']?.toString() ?? '',
                contactPersonName: responseData['data']['contact_person_name']?.toString() ?? '',
                mobileNumber: responseData['data']['mobile_number']?.toString() ?? '',
                email: responseData['data']['email']?.toString() ?? '',
                address: responseData['data']['address']?.toString() ?? '',
                city: responseData['data']['city']?.toString() ?? '',
                state: responseData['data']['state']?.toString() ?? '',
                country: responseData['data']['country']?.toString() ?? '',
                postalCode: responseData['data']['postal_code']?.toString() ?? '',
                leadSource: responseData['data']['lead_source']?.toString() ?? '',
                assignedSalesExecId: responseData['data']['assigned_sales_exec_id'] as int? ?? 0,
                serviceTypeId: responseData['data']['service_type_id'] as int? ?? 0,
                tentativeGuardsCount: responseData['data']['tentative_guards_count'] as int? ?? 0,
                workingHoursType: responseData['data']['working_hours_type']?.toString() ?? '',
                siteType: responseData['data']['site_type']?.toString() ?? '',
                serviceLocation: responseData['data']['service_location']?.toString() ?? '',
                complianceRequired: responseData['data']['compliance_required']?.toString() ?? '',
                salesNotes: responseData['data']['sales_notes']?.toString(),
                budgetRangeMin: responseData['data']['budget_range_min'] as int?,
                budgetRangeMax: responseData['data']['budget_range_max'] as int?,
                rbaApplicable: responseData['data']['rba_applicable'] as bool? ?? false,
                leadStatus: responseData['data']['lead_status']?.toString() ?? '',
                tenantId: responseData['data']['tenant_id'] as int? ?? 0,
                updatedAt: DateTime.now(),
                createdAt: DateTime.now(),
                serviceType: ServiceType(
                  id: responseData['data']['service_type']['id'] as int? ?? 1,
                  name: responseData['data']['service_type']['name']?.toString() ?? '',
                ),
                assignedSalesExec: null, // Make nullable to avoid parsing issues
                questionnaireResponses: [], // Empty list to avoid parsing issues
              ),
            );
          } else {
            throw Exception('API returned success: false');
          }
        } catch (e) {
          print('Error parsing API response: $e');
          print('Response body was: ${response.body}');
          
          // If parsing fails but status is 201, still return success
          if (response.statusCode == 201) {
            return LeadSubmissionResponse(
              success: true,
              message: 'Lead created successfully',
              data: LeadData(
                id: '',
                companyName: '',
                contactPersonName: '',
                mobileNumber: '',
                email: '',
                address: '',
                city: '',
                state: '',
                country: '',
                postalCode: '',
                leadSource: '',
                assignedSalesExecId: 0,
                serviceTypeId: 0,
                tentativeGuardsCount: 0,
                workingHoursType: '',
                siteType: '',
                serviceLocation: '',
                complianceRequired: '',
                salesNotes: null,
                budgetRangeMin: null,
                budgetRangeMax: null,
                rbaApplicable: false,
                leadStatus: '',
                tenantId: 0,
                updatedAt: DateTime.now(),
                createdAt: DateTime.now(),
                serviceType: ServiceType(id: 1, name: ''),
                assignedSalesExec: null,
                questionnaireResponses: [],
              ),
            );
          }
          rethrow;
        }
      } else if (response.statusCode >= 500) {
        throw Exception('Server error. Please try again later.');
      } else if (response.statusCode == 401) {
        throw Exception('Session expired. Please login again.');
      } else {
        throw Exception('Failed to submit lead: ${response.statusCode} - ${response.body}');
      }
    } on http.ClientException catch (e) {
      throw Exception('Network error: Unable to connect to server. Please check your internet connection.');
    } catch (e) {
      if (e.toString().contains('timeout')) {
        throw Exception('Connection timeout. Please check your internet connection and try again.');
      }
      throw Exception('Network error: $e');
    }
  }
}
