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
  final int questionCount;

  QuestionnaireTemplate({
    required this.id,
    required this.name,
    required this.description,
    required this.serviceType,
    required this.questionCount,
  });

  factory QuestionnaireTemplate.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionnaireTemplateToJson(this);
}

@JsonSerializable()
class ServiceType {
  final int id;
  final String name;

  ServiceType({
    required this.id,
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

  QuestionnaireData({
    required this.template,
    required this.questions,
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

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

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
