// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionnaire_template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionnaireTemplateResponse _$QuestionnaireTemplateResponseFromJson(
  Map<String, dynamic> json,
) => QuestionnaireTemplateResponse(
  success: json['success'] as bool,
  data: (json['data'] as List<dynamic>)
      .map((e) => QuestionnaireTemplate.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$QuestionnaireTemplateResponseToJson(
  QuestionnaireTemplateResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

QuestionnaireTemplate _$QuestionnaireTemplateFromJson(
  Map<String, dynamic> json,
) => QuestionnaireTemplate(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  serviceType: ServiceType.fromJson(
    json['service_type'] as Map<String, dynamic>,
  ),
  questionCount: (json['question_count'] as num).toInt(),
);

Map<String, dynamic> _$QuestionnaireTemplateToJson(
  QuestionnaireTemplate instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'service_type': instance.serviceType,
  'question_count': instance.questionCount,
};

ServiceType _$ServiceTypeFromJson(Map<String, dynamic> json) =>
    ServiceType(id: (json['id'] as num).toInt(), name: json['name'] as String);

Map<String, dynamic> _$ServiceTypeToJson(ServiceType instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

QuestionnaireQuestionsResponse _$QuestionnaireQuestionsResponseFromJson(
  Map<String, dynamic> json,
) => QuestionnaireQuestionsResponse(
  success: json['success'] as bool,
  data: QuestionnaireData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$QuestionnaireQuestionsResponseToJson(
  QuestionnaireQuestionsResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

QuestionnaireData _$QuestionnaireDataFromJson(Map<String, dynamic> json) =>
    QuestionnaireData(
      template: QuestionnaireTemplate.fromJson(
        json['template'] as Map<String, dynamic>,
      ),
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionnaireDataToJson(QuestionnaireData instance) =>
    <String, dynamic>{
      'template': instance.template,
      'questions': instance.questions,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
  id: json['id'] as String,
  text: json['text'] as String,
  type: json['type'] as String,
  isMandatory: json['is_mandatory'] as bool,
  options: (json['options'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  helpText: json['help_text'] as String?,
  conditionalLogic: json['conditional_logic'],
  displayOrder: (json['display_order'] as num?)?.toInt(),
);

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
  'id': instance.id,
  'text': instance.text,
  'type': instance.type,
  'is_mandatory': instance.isMandatory,
  'options': instance.options,
  'help_text': instance.helpText,
  'conditional_logic': instance.conditionalLogic,
  'display_order': instance.displayOrder,
};

LeadSubmissionRequest _$LeadSubmissionRequestFromJson(
  Map<String, dynamic> json,
) => LeadSubmissionRequest(
  companyName: json['company_name'] as String,
  contactPersonName: json['contact_person_name'] as String,
  mobileNumber: json['mobile_number'] as String,
  email: json['email'] as String,
  address: json['address'] as String,
  city: json['city'] as String,
  state: json['state'] as String,
  country: json['country'] as String,
  postalCode: json['postal_code'] as String,
  leadSource: json['lead_source'] as String,
  assignedSalesExecId: (json['assigned_sales_exec_id'] as num).toInt(),
  serviceTypeId: (json['service_type_id'] as num).toInt(),
  tentativeGuardsCount: (json['tentative_guards_count'] as num).toInt(),
  workingHoursType: json['working_hours_type'] as String,
  siteType: json['site_type'] as String,
  serviceLocation: json['service_location'] as String,
  complianceRequired: json['compliance_required'] as String,
  salesNotes: json['sales_notes'] as String,
  budgetRangeMin: (json['budget_range_min'] as num?)?.toInt(),
  budgetRangeMax: (json['budget_range_max'] as num?)?.toInt(),
  questionnaireResponses: (json['questionnaire_responses'] as List<dynamic>)
      .map((e) => QuestionnaireResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LeadSubmissionRequestToJson(
  LeadSubmissionRequest instance,
) => <String, dynamic>{
  'company_name': instance.companyName,
  'contact_person_name': instance.contactPersonName,
  'mobile_number': instance.mobileNumber,
  'email': instance.email,
  'address': instance.address,
  'city': instance.city,
  'state': instance.state,
  'country': instance.country,
  'postal_code': instance.postalCode,
  'lead_source': instance.leadSource,
  'assigned_sales_exec_id': instance.assignedSalesExecId,
  'service_type_id': instance.serviceTypeId,
  'tentative_guards_count': instance.tentativeGuardsCount,
  'working_hours_type': instance.workingHoursType,
  'site_type': instance.siteType,
  'service_location': instance.serviceLocation,
  'compliance_required': instance.complianceRequired,
  'sales_notes': instance.salesNotes,
  'budget_range_min': instance.budgetRangeMin,
  'budget_range_max': instance.budgetRangeMax,
  'questionnaire_responses': instance.questionnaireResponses,
};

QuestionnaireResponse _$QuestionnaireResponseFromJson(
  Map<String, dynamic> json,
) => QuestionnaireResponse(
  questionId: json['question_id'] as String,
  answer: json['answer'] as String,
);

Map<String, dynamic> _$QuestionnaireResponseToJson(
  QuestionnaireResponse instance,
) => <String, dynamic>{
  'question_id': instance.questionId,
  'answer': instance.answer,
};

LeadSubmissionResponse _$LeadSubmissionResponseFromJson(
  Map<String, dynamic> json,
) => LeadSubmissionResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: LeadData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LeadSubmissionResponseToJson(
  LeadSubmissionResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

LeadData _$LeadDataFromJson(Map<String, dynamic> json) => LeadData(
  id: json['id'] as String,
  companyName: json['companyName'] as String,
  contactPersonName: json['contactPersonName'] as String,
  mobileNumber: json['mobileNumber'] as String,
  email: json['email'] as String,
  address: json['address'] as String,
  city: json['city'] as String,
  state: json['state'] as String,
  country: json['country'] as String,
  postalCode: json['postalCode'] as String,
  leadSource: json['leadSource'] as String,
  assignedSalesExecId: (json['assignedSalesExecId'] as num).toInt(),
  serviceTypeId: (json['serviceTypeId'] as num).toInt(),
  tentativeGuardsCount: (json['tentativeGuardsCount'] as num).toInt(),
  workingHoursType: json['workingHoursType'] as String,
  siteType: json['siteType'] as String,
  serviceLocation: json['serviceLocation'] as String,
  complianceRequired: json['complianceRequired'] as String,
  salesNotes: json['salesNotes'] as String?,
  budgetRangeMin: (json['budgetRangeMin'] as num?)?.toInt(),
  budgetRangeMax: (json['budgetRangeMax'] as num?)?.toInt(),
  rbaApplicable: json['rbaApplicable'] as bool,
  leadStatus: json['leadStatus'] as String,
  tenantId: (json['tenantId'] as num).toInt(),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  serviceType: ServiceType.fromJson(
    json['serviceType'] as Map<String, dynamic>,
  ),
  assignedSalesExec: json['assignedSalesExec'] == null
      ? null
      : AssignedSalesExec.fromJson(
          json['assignedSalesExec'] as Map<String, dynamic>,
        ),
  questionnaireResponses: (json['questionnaireResponses'] as List<dynamic>)
      .map(
        (e) =>
            QuestionnaireSubmissionResponse.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$LeadDataToJson(LeadData instance) => <String, dynamic>{
  'id': instance.id,
  'companyName': instance.companyName,
  'contactPersonName': instance.contactPersonName,
  'mobileNumber': instance.mobileNumber,
  'email': instance.email,
  'address': instance.address,
  'city': instance.city,
  'state': instance.state,
  'country': instance.country,
  'postalCode': instance.postalCode,
  'leadSource': instance.leadSource,
  'assignedSalesExecId': instance.assignedSalesExecId,
  'serviceTypeId': instance.serviceTypeId,
  'tentativeGuardsCount': instance.tentativeGuardsCount,
  'workingHoursType': instance.workingHoursType,
  'siteType': instance.siteType,
  'serviceLocation': instance.serviceLocation,
  'complianceRequired': instance.complianceRequired,
  'salesNotes': instance.salesNotes,
  'budgetRangeMin': instance.budgetRangeMin,
  'budgetRangeMax': instance.budgetRangeMax,
  'rbaApplicable': instance.rbaApplicable,
  'leadStatus': instance.leadStatus,
  'tenantId': instance.tenantId,
  'updatedAt': instance.updatedAt.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
  'serviceType': instance.serviceType,
  'assignedSalesExec': instance.assignedSalesExec,
  'questionnaireResponses': instance.questionnaireResponses,
};

AssignedSalesExec _$AssignedSalesExecFromJson(Map<String, dynamic> json) =>
    AssignedSalesExec(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      lastLoginAt: json['lastLoginAt'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AssignedSalesExecToJson(AssignedSalesExec instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'lastLoginAt': instance.lastLoginAt,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

QuestionnaireSubmissionResponse _$QuestionnaireSubmissionResponseFromJson(
  Map<String, dynamic> json,
) => QuestionnaireSubmissionResponse(
  id: json['id'] as String,
  questionId: json['questionId'] as String,
  questionText: json['questionText'] as String?,
  answer: json['answer'] as String,
  answerDisplay: json['answerDisplay'] as String?,
);

Map<String, dynamic> _$QuestionnaireSubmissionResponseToJson(
  QuestionnaireSubmissionResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'questionId': instance.questionId,
  'questionText': instance.questionText,
  'answer': instance.answer,
  'answerDisplay': instance.answerDisplay,
};
