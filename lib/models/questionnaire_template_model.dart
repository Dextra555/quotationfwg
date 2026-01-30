import 'package:json_annotation/json_annotation.dart';

part 'questionnaire_template_model.g.dart';

@JsonSerializable()
class QuestionnaireTemplateResponse {
  final bool success;
  final List<QuestionnaireTemplate> data;

  QuestionnaireTemplateResponse({
    required this.success,
    required this.data,
  });

  factory QuestionnaireTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireTemplateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionnaireTemplateResponseToJson(this);
}

@JsonSerializable()
class QuestionnaireTemplate {
  final String id;
  final String name;
  final String description;
  @JsonKey(name: 'service_type')
  final ServiceType serviceType;
  @JsonKey(name: 'question_count')
  final int? questionCount;

  QuestionnaireTemplate({
    required this.id,
    required this.name,
    required this.description,
    required this.serviceType,
    this.questionCount,
  });

  factory QuestionnaireTemplate.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionnaireTemplateToJson(this);
}

@JsonSerializable()
class ServiceType {
  final int? id;
  final String name;

  ServiceType({
    this.id,
    required this.name,
  });

  factory ServiceType.fromJson(Map<String, dynamic> json) =>
      _$ServiceTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceTypeToJson(this);
}

@JsonSerializable()
class QuestionnaireQuestionsResponse {
  final bool success;
  final QuestionnaireData data;

  QuestionnaireQuestionsResponse({
    required this.success,
    required this.data,
  });

  factory QuestionnaireQuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireQuestionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionnaireQuestionsResponseToJson(this);
}

@JsonSerializable()
class QuestionnaireData {
  final QuestionnaireTemplate template;
  final List<Question> questions;
  @JsonKey(name: 'inventory_items')
  final List<InventoryItem>? inventoryItems;

  QuestionnaireData({
    required this.template,
    required this.questions,
    this.inventoryItems,
  });

  factory QuestionnaireData.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireDataFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionnaireDataToJson(this);
}

@JsonSerializable()
class Question {
  final String id;
  final String text;
  final String type;
  @JsonKey(name: 'is_mandatory')
  final bool isMandatory;
  final List<String>? options;
  @JsonKey(name: 'help_text')
  final String? helpText;
  @JsonKey(name: 'conditional_logic')
  final dynamic conditionalLogic;
  @JsonKey(name: 'display_order')
  final int? displayOrder;

  Question({
    required this.id,
    required this.text,
    required this.type,
    required this.isMandatory,
    this.options,
    this.helpText,
    this.conditionalLogic,
    this.displayOrder,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    // Handle options that can come in any format
    List<String>? parsedOptions;
    if (json['options'] != null) {
      if (json['options'] is String) {
        // Split comma-separated string options
        parsedOptions = (json['options'] as String)
            .split(',')
            .map((option) => option.trim())
            .where((option) => option.isNotEmpty)
            .toList();
      } else if (json['options'] is List) {
        // Handle list options
        parsedOptions = (json['options'] as List<dynamic>)
            .map((option) => option.toString())
            .toList();
      } else if (json['options'] is Map) {
        // Handle map options - extract values
        final optionsMap = json['options'] as Map<String, dynamic>;
        parsedOptions = optionsMap.values.map((option) => option.toString()).toList();
      } else {
        // Handle any other type by converting to string
        parsedOptions = [json['options'].toString()];
      }
    }

    // Extract display order from various possible field names
    int? displayOrder;
    final possibleOrderFields = ['display_order', 'displayOrder', 'order', 'sort_order', 'sortOrder'];
    for (final field in possibleOrderFields) {
      if (json[field] != null) {
        if (json[field] is num) {
          displayOrder = (json[field] as num).toInt();
        } else {
          displayOrder = int.tryParse(json[field].toString()) ?? 0;
        }
        break;
      }
    }

    // Extract mandatory status from various possible field names
    bool isMandatory = false;
    final possibleMandatoryFields = ['is_mandatory', 'isMandatory', 'mandatory', 'required', 'isRequired'];
    for (final field in possibleMandatoryFields) {
      if (json[field] != null) {
        if (json[field] is bool) {
          isMandatory = json[field] as bool;
        } else {
          isMandatory = json[field].toString().toLowerCase() == 'true';
        }
        break;
      }
    }

    return Question(
      id: json['id']?.toString() ?? json['_id']?.toString() ?? '',
      text: json['text']?.toString() ?? json['question']?.toString() ?? json['title']?.toString() ?? '',
      type: json['type']?.toString() ?? json['question_type']?.toString() ?? json['inputType']?.toString() ?? 'text',
      isMandatory: isMandatory,
      options: parsedOptions,
      helpText: json['help_text']?.toString() ?? json['helpText']?.toString() ?? json['description']?.toString(),
      conditionalLogic: json['conditional_logic'] ?? json['conditionalLogic'] ?? json['conditions'],
      displayOrder: displayOrder ?? 0,
    );
  }

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

@JsonSerializable()
class LeadSubmissionRequest {
  @JsonKey(name: 'company_name')
  final String companyName;
  @JsonKey(name: 'contact_person_name')
  final String contactPersonName;
  @JsonKey(name: 'mobile_number')
  final String mobileNumber;
  final String email;
  final String address;
  final String city;
  final String state;
  final String country;
  @JsonKey(name: 'postal_code')
  final String postalCode;
  @JsonKey(name: 'lead_source')
  final String leadSource;
  @JsonKey(name: 'assigned_sales_exec_id')
  final int assignedSalesExecId;
  @JsonKey(name: 'service_type_id')
  final int serviceTypeId;
  @JsonKey(name: 'tentative_guards_count')
  final int tentativeGuardsCount;
  @JsonKey(name: 'working_hours_type')
  final String workingHoursType;
  @JsonKey(name: 'site_type')
  final String siteType;
  @JsonKey(name: 'service_location')
  final String serviceLocation;
  @JsonKey(name: 'compliance_required')
  final String complianceRequired;
  @JsonKey(name: 'sales_notes')
  final String salesNotes;
  @JsonKey(name: 'budget_range_min')
  final int? budgetRangeMin;
  @JsonKey(name: 'budget_range_max')
  final int? budgetRangeMax;
  @JsonKey(name: 'questionnaire_responses')
  final List<QuestionnaireResponse> questionnaireResponses;

  LeadSubmissionRequest({
    required this.companyName,
    required this.contactPersonName,
    required this.mobileNumber,
    required this.email,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    required this.leadSource,
    required this.assignedSalesExecId,
    required this.serviceTypeId,
    required this.tentativeGuardsCount,
    required this.workingHoursType,
    required this.siteType,
    required this.serviceLocation,
    required this.complianceRequired,
    required this.salesNotes,
    this.budgetRangeMin,
    this.budgetRangeMax,
    required this.questionnaireResponses,
  });

  Map<String, dynamic> toJson() => _$LeadSubmissionRequestToJson(this);
}

@JsonSerializable()
class QuestionnaireResponse {
  @JsonKey(name: 'question_id')
  final String questionId;
  final String answer;

  QuestionnaireResponse({
    required this.questionId,
    required this.answer,
  });

  factory QuestionnaireResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionnaireResponseToJson(this);
}

@JsonSerializable()
class LeadSubmissionResponse {
  final bool success;
  final String message;
  final LeadData data;

  LeadSubmissionResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LeadSubmissionResponse.fromJson(Map<String, dynamic> json) =>
      _$LeadSubmissionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LeadSubmissionResponseToJson(this);
}

@JsonSerializable()
class LeadData {
  final String id;
  final String companyName;
  final String contactPersonName;
  final String mobileNumber;
  final String email;
  final String address;
  final String city;
  final String state;
  final String country;
  final String postalCode;
  final String leadSource;
  final int assignedSalesExecId;
  final int serviceTypeId;
  final int tentativeGuardsCount;
  final String workingHoursType;
  final String siteType;
  final String serviceLocation;
  final String complianceRequired;
  final String? salesNotes;
  final int? budgetRangeMin;
  final int? budgetRangeMax;
  final bool rbaApplicable;
  final String leadStatus;
  final int tenantId;
  final DateTime updatedAt;
  final DateTime createdAt;
  final ServiceType serviceType;
  final AssignedSalesExec? assignedSalesExec;
  final List<QuestionnaireSubmissionResponse> questionnaireResponses;

  LeadData({
    required this.id,
    required this.companyName,
    required this.contactPersonName,
    required this.mobileNumber,
    required this.email,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    required this.leadSource,
    required this.assignedSalesExecId,
    required this.serviceTypeId,
    required this.tentativeGuardsCount,
    required this.workingHoursType,
    required this.siteType,
    required this.serviceLocation,
    required this.complianceRequired,
    this.salesNotes,
    this.budgetRangeMin,
    this.budgetRangeMax,
    required this.rbaApplicable,
    required this.leadStatus,
    required this.tenantId,
    required this.updatedAt,
    required this.createdAt,
    required this.serviceType,
    this.assignedSalesExec,
    required this.questionnaireResponses,
  });

  factory LeadData.fromJson(Map<String, dynamic> json) =>
      _$LeadDataFromJson(json);

  Map<String, dynamic> toJson() => _$LeadDataToJson(this);
}

@JsonSerializable()
class AssignedSalesExec {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String? lastLoginAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  AssignedSalesExec({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.lastLoginAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AssignedSalesExec.fromJson(Map<String, dynamic> json) =>
      _$AssignedSalesExecFromJson(json);

  Map<String, dynamic> toJson() => _$AssignedSalesExecToJson(this);
}

@JsonSerializable()
class QuestionnaireSubmissionResponse {
  final String id;
  final String questionId;
  final String? questionText;
  final String answer;
  final String? answerDisplay;

  QuestionnaireSubmissionResponse({
    required this.id,
    required this.questionId,
    this.questionText,
    required this.answer,
    this.answerDisplay,
  });

  factory QuestionnaireSubmissionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireSubmissionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionnaireSubmissionResponseToJson(this);
}

@JsonSerializable()
class InventoryItem {
  final String id;
  @JsonKey(name: 'inventory_item')
  final InventoryItemData inventoryItem;
  @JsonKey(name: 'trigger_condition')
  final dynamic triggerCondition;
  @JsonKey(name: 'option_label')
  final String? optionLabel;
  @JsonKey(name: 'default_quantity')
  final int? defaultQuantity;
  @JsonKey(name: 'is_optional')
  final bool? isOptional;
  @JsonKey(name: 'display_order')
  final int? displayOrder;
  @JsonKey(name: 'total_cost')
  final dynamic totalCost;

  InventoryItem({
    required this.id,
    required this.inventoryItem,
    this.triggerCondition,
    this.optionLabel,
    this.defaultQuantity,
    this.isOptional,
    this.displayOrder,
    this.totalCost,
  });

  factory InventoryItem.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryItemToJson(this);
}

@JsonSerializable()
class InventoryItemData {
  final String id;
  final String name;
  final String description;
  final String sku;
  final Category category;
  final String unit;
  @JsonKey(name: 'cost_price')
  final String costPrice;
  @JsonKey(name: 'selling_price')
  final String sellingPrice;
  @JsonKey(name: 'stock_quantity')
  final int? stockQuantity;
  @JsonKey(name: 'reorder_level')
  final int? reorderLevel;
  @JsonKey(name: 'is_active')
  final bool isActive;

  InventoryItemData({
    required this.id,
    required this.name,
    required this.description,
    required this.sku,
    required this.category,
    required this.unit,
    required this.costPrice,
    required this.sellingPrice,
    this.stockQuantity,
    this.reorderLevel,
    required this.isActive,
  });

  factory InventoryItemData.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemDataFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryItemDataToJson(this);
}

@JsonSerializable()
class Category {
  final String id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
