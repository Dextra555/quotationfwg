// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  token: json['token'] as String,
  token_type: json['token_type'] as String,
);

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
  'user': instance.user,
  'token': instance.token,
  'token_type': instance.token_type,
};

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num).toInt(),
  first_name: json['first_name'] as String,
  last_name: json['last_name'] as String,
  email: json['email'] as String,
  last_login_at: json['last_login_at'] as String,
  departments: (json['departments'] as List<dynamic>)
      .map((e) => Department.fromJson(e as Map<String, dynamic>))
      .toList(),
  designations: (json['designations'] as List<dynamic>)
      .map((e) => Designation.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.first_name,
  'last_name': instance.last_name,
  'email': instance.email,
  'last_login_at': instance.last_login_at,
  'departments': instance.departments,
  'designations': instance.designations,
};

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  pivot: Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'pivot': instance.pivot,
    };

Designation _$DesignationFromJson(Map<String, dynamic> json) => Designation(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  risk_level: json['risk_level'] as String,
  requires_replacement: json['requires_replacement'] as bool,
  pivot: Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DesignationToJson(Designation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'risk_level': instance.risk_level,
      'requires_replacement': instance.requires_replacement,
      'pivot': instance.pivot,
    };

Pivot _$PivotFromJson(Map<String, dynamic> json) => Pivot(
  user_id: (json['user_id'] as num).toInt(),
  department_id: (json['department_id'] as num?)?.toInt(),
  designation_id: (json['designation_id'] as num?)?.toInt(),
  created_at: json['created_at'] as String,
  updated_at: json['updated_at'] as String,
);

Map<String, dynamic> _$PivotToJson(Pivot instance) => <String, dynamic>{
  'user_id': instance.user_id,
  'department_id': instance.department_id,
  'designation_id': instance.designation_id,
  'created_at': instance.created_at,
  'updated_at': instance.updated_at,
};
