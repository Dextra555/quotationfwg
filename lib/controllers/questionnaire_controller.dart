import 'package:flutter/foundation.dart';
import 'dart:convert';
import '../models/questionnaire_template_model.dart';
import '../services/api_service.dart';
import '../services/session_service.dart';

class QuestionnaireController extends ChangeNotifier {
  List<QuestionnaireTemplate> _templates = [];
  Map<String, List<Question>> _questionsByTemplate = {}; // Store questions by template ID
  Map<String, dynamic> _answers = {};
  List<QuestionnaireTemplate> _selectedTemplates = []; // Changed to support multiple selections
  Map<String, List<InventoryItem>> _inventoryItemsByTemplate = {}; // Store inventory items by template ID
  
  bool _isLoadingTemplates = false;
  bool _isLoadingQuestions = false;
  bool _isSubmitting = false;
  bool _hasAttemptedLoad = false; // Add this flag to prevent multiple loads
  String? _error;

  // Getters
  List<QuestionnaireTemplate> get templates => _templates;
  Map<String, List<Question>> get questionsByTemplate => _questionsByTemplate;
  List<Question> get questions => _questionsByTemplate.values.expand((q) => q).toList(); // Flatten all questions
  Map<String, dynamic> get answers => _answers;
  List<QuestionnaireTemplate> get selectedTemplates => _selectedTemplates; // Changed to support multiple selections
  Map<String, List<InventoryItem>> get inventoryItemsByTemplate => _inventoryItemsByTemplate;
  
  bool get isLoadingTemplates => _isLoadingTemplates;
  bool get isLoadingQuestions => _isLoadingQuestions;
  bool get isSubmitting => _isSubmitting;
  String? get error => _error;

  // Load questions for a specific template ID
  Future<void> loadQuestionsForTemplate(String templateId) async {
    if (_hasAttemptedLoad) {
      print('Already attempted to load questions, skipping...'); // Debug log
      return;
    }
    
    _setLoadingQuestions(true);
    _hasAttemptedLoad = true; // Set flag to prevent multiple loads
    _error = null;
    
    try {
      print('Loading questions for template: $templateId'); // Debug log
      final response = await ApiService.getQuestionnaireQuestions(templateId);
      
      if (response.success && response.data.questions.isNotEmpty) {
        _questionsByTemplate[templateId] = response.data.questions;
        _inventoryItemsByTemplate[templateId] = response.data.inventoryItems ?? []; // Store inventory items by template ID
        print('Successfully loaded ${response.data.questions.length} questions and ${response.data.inventoryItems?.length ?? 0} inventory items for template: $templateId'); // Debug log
        
        // Initialize answers for new questions
        for (var question in response.data.questions) {
          if (!_answers.containsKey(question.id)) {
            _answers[question.id] = '';
          }
        }
        
        // Set appropriate default answer based on question type
        for (var question in response.data.questions) {
          switch (question.type.toLowerCase()) {
            case 'checkbox':
            case 'multiselect':
              _answers[question.id] = <String>[];
              break;
            case 'number':
            case 'range':
              _answers[question.id] = 0;
              break;
            case 'rating':
              _answers[question.id] = 0;
              break;
            default:
              _answers[question.id] = '';
          }
        }
      } else {
        // Handle empty questions response
        print('No questions found for template: $templateId'); // Debug log
        _questionsByTemplate.remove(templateId);
        _error = 'No questions available for this service type';
      }
      
      _setLoadingQuestions(false);
      notifyListeners();
    } catch (e) {
      String errorMessage = e.toString();
      print('Error loading questions: $errorMessage'); // Debug log
      
      // Reset the attempt flag on error so user can retry
      _hasAttemptedLoad = false;
      
      // Try to provide more user-friendly error messages
      if (errorMessage.contains('unauthorized') || errorMessage.contains('401')) {
        _error = 'Authentication required. Please login first.';
      } else if (errorMessage.contains('Network error') || errorMessage.contains('internet')) {
        _error = 'Network error. Please check your internet connection.';
      } else if (errorMessage.contains('timeout')) {
        _error = 'Connection timeout. Please check your internet connection.';
      } else if (errorMessage.contains('Server error') || errorMessage.contains('500')) {
        _error = 'Server is temporarily unavailable. Please try again later.';
      } else if (errorMessage.contains('Invalid response') || errorMessage.contains('Null')) {
        _error = 'Server returned invalid data. Please try again later.';
      } else if (errorMessage.contains('type') && errorMessage.contains('subtype')) {
        // Handle JSON parsing errors gracefully
        print('JSON parsing error, but continuing with empty questions'); // Debug log
        _questionsByTemplate.clear();
        _error = null; // Don't show error for parsing issues, just continue with empty questions
      } else {
        _error = 'Failed to load questions: $errorMessage';
      }
      
      _setLoadingQuestions(false);
      notifyListeners();
    }
  }

  // Retry loading questions
  Future<void> retryLoadQuestions(String templateId) async {
    _hasAttemptedLoad = false; // Reset flag to allow retry
    await loadQuestionsForTemplate(templateId);
  }

  // Load questionnaire templates
  Future<void> loadTemplates() async {
    _setLoadingTemplates(true);
    _error = null;
    
    try {
      // Check if user is logged in
      final isLoggedIn = await SessionService.isLoggedIn();
      if (!isLoggedIn) {
        _error = 'Please login first to access service types.';
        notifyListeners();
        _setLoadingTemplates(false);
        return;
      }
      
      final response = await ApiService.getQuestionnaireTemplates();
      _templates = response.data;
      notifyListeners();
    } catch (e) {
      String errorMessage = e.toString();
      print('Template loading error: $errorMessage'); // Debug log
      
      if (errorMessage.contains('unauthorized') || errorMessage.contains('401')) {
        _error = 'Authentication required. Please login first.';
      } else if (errorMessage.contains('Network error') || errorMessage.contains('internet')) {
        _error = 'Network error. Please check your internet connection and try again.';
      } else if (errorMessage.contains('timeout')) {
        _error = 'Connection timeout. Please check your internet connection and try again.';
      } else if (errorMessage.contains('Server error') || errorMessage.contains('500')) {
        _error = 'Server is temporarily unavailable. Please try again later.';
      } else if (errorMessage.contains('Invalid response') || errorMessage.contains('Null')) {
        _error = 'Server returned invalid data. Please try again later.';
      } else {
        _error = 'Failed to load service types: $errorMessage';
      }
      notifyListeners();
    } finally {
      _setLoadingTemplates(false);
    }
  }

  // Select/deselect a template (for multi-select)
  void toggleTemplateSelection(String templateId) {
    final template = _templates.firstWhere(
      (t) => t.id == templateId,
      orElse: () => _templates.first,
    );
    
    if (_selectedTemplates.any((t) => t.id == templateId)) {
      _selectedTemplates.removeWhere((t) => t.id == templateId);
    } else {
      _selectedTemplates.add(template);
    }
    
    notifyListeners();
  }

  // Check if a template is selected
  bool isTemplateSelected(String templateId) {
    return _selectedTemplates.any((t) => t.id == templateId);
  }

  // Clear all selected templates
  void clearSelectedTemplates() {
    _selectedTemplates.clear();
    notifyListeners();
  }

  // Select a template (kept for backward compatibility)
  void selectTemplate(String? templateId) {
    if (templateId == null) {
      _selectedTemplates.clear();
      _questionsByTemplate.clear();
      _answers.clear();
      notifyListeners();
      return;
    }
    
    final template = _templates.firstWhere(
      (t) => t.id == templateId,
      orElse: () => _templates.first,
    );
    _selectedTemplates = [template]; // Set as single selection for backward compatibility
    notifyListeners();
  }

  // Load questions for selected template
  Future<void> loadQuestions(String templateId) async {
    _setLoadingQuestions(true);
    _error = null;
    _answers.clear(); // Clear previous answers
    
    try {
      final response = await ApiService.getQuestionnaireQuestions(templateId);
      _questionsByTemplate[templateId] = response.data.questions;
      // Note: _selectedTemplate is no longer used, keeping for backward compatibility
      
      // Initialize answers with empty values
      for (var question in response.data.questions) {
        _answers[question.id] = '';
      }
      
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    } finally {
      _setLoadingQuestions(false);
    }
  }

  // Load questions for all selected templates
  Future<void> loadQuestionsForSelectedTemplates() async {
    if (_selectedTemplates.isEmpty) {
      _questionsByTemplate.clear();
      _answers.clear();
      notifyListeners();
      return;
    }
    
    _setLoadingQuestions(true);
    _error = null;
    _answers.clear();
    
    try {
      List<Question> allQuestions = [];
      
      // Load questions for each selected template
      for (var template in _selectedTemplates) {
        if ((template.questionCount ?? 0) > 0) {
          final response = await ApiService.getQuestionnaireQuestions(template.id);
          _questionsByTemplate[template.id] = response.data.questions;
          _inventoryItemsByTemplate[template.id] = response.data.inventoryItems ?? []; // Store inventory items by template ID
          allQuestions.addAll(response.data.questions);
        }
      }
      
      // Initialize answers with empty values
      for (var question in allQuestions) {
        _answers[question.id] = '';
      }
      
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    } finally {
      _setLoadingQuestions(false);
    }
  }

  // Load questions for ALL templates (for showing all services with questions)
  Future<void> loadQuestionsForAllTemplates() async {
    if (_templates.isEmpty) {
      _questionsByTemplate.clear();
      _answers.clear();
      notifyListeners();
      return;
    }
    
    _setLoadingQuestions(true);
    _error = null;
    _answers.clear();
    
    try {
      List<Question> allQuestions = [];
      
      // Load questions for ALL templates
      for (var template in _templates) {
        if ((template.questionCount ?? 0) > 0) {
          try {
            final response = await ApiService.getQuestionnaireQuestions(template.id);
            _questionsByTemplate[template.id] = response.data.questions;
            _inventoryItemsByTemplate[template.id] = response.data.inventoryItems ?? []; // Store inventory items by template ID
            allQuestions.addAll(response.data.questions);
          } catch (e) {
            print('Failed to load questions for template ${template.name}: $e');
            // Continue with other templates even if one fails
            _questionsByTemplate[template.id] = [];
          }
        }
      }
      
      // Initialize answers with empty values
      for (var question in allQuestions) {
        _answers[question.id] = '';
      }
      
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    } finally {
      _setLoadingQuestions(false);
    }
  }

  // Update answer for a question
  void updateAnswer(String questionId, dynamic answer) {
    _answers[questionId] = answer;
    notifyListeners();
  }

  // Update multiple answers (for checkbox questions)
  void updateMultipleAnswer(String questionId, String value, bool isSelected) {
    final currentAnswers = _answers[questionId] as List<String>? ?? [];
    
    if (isSelected) {
      if (!currentAnswers.contains(value)) {
        currentAnswers.add(value);
      }
    } else {
      currentAnswers.remove(value);
    }
    
    _answers[questionId] = currentAnswers;
    notifyListeners();
  }

  // Validate mandatory questions
  bool validateMandatoryQuestions() {
    for (var question in questions) {
      if (question.isMandatory) {
        final answer = _answers[question.id];
        
        if (answer == null || answer == '') {
          return false;
        }
        
        // Check for empty lists in checkbox questions
        if (question.type == 'checkbox' && answer is List) {
          if (answer.isEmpty) {
            return false;
          }
        }
      }
    }
    return true;
  }

  // Get unanswered mandatory questions
  List<Question> getUnansweredMandatoryQuestions() {
    return questions.where((question) {
      if (!question.isMandatory) return false;
      
      final answer = _answers[question.id];
      if (answer == null || answer == '') return true;
      
      if (question.type == 'checkbox' && answer is List) {
        return answer.isEmpty;
      }
      
      return false;
    }).toList();
  }

  // Submit lead with questionnaire responses
  Future<LeadSubmissionResponse> submitLead({
    required String companyName,
    required String contactPersonName,
    required String mobileNumber,
    required String email,
    required String address,
    required String city,
    required String state,
    required String country,
    required String postalCode,
    required String leadSource,
    required int assignedSalesExecId,
    required int serviceTypeId,
    required int tentativeGuardsCount,
    required String workingHoursType,
    required String siteType,
    required String serviceLocation,
    required String complianceRequired,
    required String salesNotes,
    int? budgetRangeMin,
    int? budgetRangeMax,
    Map<String, int>? inventoryQuantities,
  }) async {
    _setSubmitting(true);
    _error = null;
    
    try {
      // Convert answers to questionnaire responses
      final questionnaireResponses = _answers.entries.map((entry) {
        String answerValue;
        
        if (entry.value is List) {
          // For checkbox questions, join multiple answers
          answerValue = (entry.value as List).join(', ');
        } else {
          answerValue = entry.value.toString();
        }
        
        return QuestionnaireResponse(
          questionId: entry.key,
          answer: answerValue,
        );
      }).toList();

      // Ensure we always have questionnaire responses, even if empty
      final responses = questionnaireResponses.isNotEmpty ? questionnaireResponses : [
        QuestionnaireResponse(
          questionId: 'no_questions',
          answer: 'No questionnaire questions for this service type',
        ),
      ];

      // Manual JSON conversion for questionnaire responses to ensure proper serialization
      final responsesJson = responses.map((response) => {
        'question_id': response.questionId,
        'answer': response.answer,
      }).toList();

      final leadRequest = LeadSubmissionRequest(
        companyName: companyName,
        contactPersonName: contactPersonName,
        mobileNumber: mobileNumber,
        email: email,
        address: address,
        city: city,
        state: state,
        country: country,
        postalCode: postalCode,
        leadSource: leadSource,
        assignedSalesExecId: assignedSalesExecId,
        serviceTypeId: _selectedTemplates.isNotEmpty ? _selectedTemplates.first.serviceType.id ?? 1 : 1, // Use first selected template's service type
        tentativeGuardsCount: tentativeGuardsCount,
        workingHoursType: workingHoursType,
        siteType: siteType,
        serviceLocation: serviceLocation,
        complianceRequired: complianceRequired,
        salesNotes: salesNotes,
        budgetRangeMin: budgetRangeMin,
        budgetRangeMax: budgetRangeMax,
        questionnaireResponses: responses,
      );

      // Get selected inventory items with quantities
      final selectedInventoryItems = getSelectedInventoryItems(inventoryQuantities ?? {});
      
      // Debug log to see what data is being sent
      // Create manual JSON to ensure proper serialization
      final manualJson = {
        'company_name': companyName,
        'contact_person_name': contactPersonName,
        'mobile_number': mobileNumber,
        'email': email,
        'address': address,
        'city': city,
        'state': state,
        'country': country,
        'postal_code': postalCode,
        'lead_source': leadSource,
        'assigned_sales_exec_id': assignedSalesExecId,
        'service_type_id': serviceTypeId,
        'tentative_guards_count': tentativeGuardsCount,
        'working_hours_type': workingHoursType,
        'site_type': siteType,
        'service_location': serviceLocation,
        'compliance_required': complianceRequired,
        'sales_notes': salesNotes,
        'budget_range_min': budgetRangeMin,
        'budget_range_max': budgetRangeMax,
        'questionnaire_responses': responsesJson,
        'selected_inventory_items': selectedInventoryItems,
      };
      
      print('=== LEAD SUBMISSION DEBUG ===');
      print('Manual JSON being sent: ${jsonEncode(manualJson)}');
      print('Company Name: "$companyName"');
      print('Contact Person: "$contactPersonName"');
      print('Mobile: "$mobileNumber"');
      print('Email: "$email"');
      print('Lead Source: "$leadSource"');
      print('Service Type ID: $serviceTypeId');
      print('Tentative Guards: $tentativeGuardsCount');
      print('Working Hours: "$workingHoursType"');
      print('Service Location: "$serviceLocation"');
      print('Compliance Required: "$complianceRequired"');
      print('Questionnaire Responses: ${responsesJson.length} items');
      print('Selected Inventory Items: ${selectedInventoryItems.length} items');
      
      // Show questionnaire responses JSON structure
      for (int i = 0; i < responsesJson.length; i++) {
        final response = responsesJson[i];
        print('  - Q: ${response['question_id']}, A: "${response['answer']}"');
      }
      
      // Show inventory items JSON structure
      for (int i = 0; i < selectedInventoryItems.length; i++) {
        final item = selectedInventoryItems[i];
        print('  - Item: ${item['template_inventory_item_id']}, Qty: ${item['quantity']}');
      }
      print('=============================');

      final response = await ApiService.submitLeadWithManualJson(manualJson);
      return response;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    } finally {
      _setSubmitting(false);
    }
  }

  // Get selected inventory items with quantities
  List<Map<String, dynamic>> getSelectedInventoryItems(Map<String, int> quantities) {
    List<Map<String, dynamic>> allSelectedItems = [];
    
    // Collect inventory items from all selected templates
    for (var template in _selectedTemplates) {
      final templateInventoryItems = _inventoryItemsByTemplate[template.id] ?? [];
      
      for (var item in templateInventoryItems) {
        final quantity = quantities[item.id] ?? (item.defaultQuantity ?? 1);
        allSelectedItems.add({
          'template_inventory_item_id': item.id,
          'quantity': quantity,
        });
      }
    }
    
    return allSelectedItems;
  }

  // Clear all data
  void clearData() {
    _templates.clear();
    _questionsByTemplate.clear();
    _answers.clear();
    _selectedTemplates.clear();
    _error = null;
    notifyListeners();
  }

  // Clear questions and answers only (when template changes)
  void clearQuestionsAndAnswers() {
    _questionsByTemplate.clear();
    _answers.clear();
    _inventoryItemsByTemplate.clear(); // Clear inventory items by template
    _error = null;
    _hasAttemptedLoad = false; // Reset flag when template changes
    notifyListeners();
  }

  // Clear all data including selected templates
  void clearAllData() {
    _templates.clear();
    _questionsByTemplate.clear();
    _answers.clear();
    _selectedTemplates.clear();
    _inventoryItemsByTemplate.clear(); // Clear inventory items by template
    _error = null;
    notifyListeners();
  }

  // Private setters
  void _setLoadingTemplates(bool value) {
    _isLoadingTemplates = value;
    notifyListeners();
  }

  void _setLoadingQuestions(bool value) {
    _isLoadingQuestions = value;
    notifyListeners();
  }

  void _setSubmitting(bool value) {
    _isSubmitting = value;
    notifyListeners();
  }
}
