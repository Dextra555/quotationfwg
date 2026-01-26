import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponse {
  final bool success;
  final String message;
  final LoginData data;

  LoginResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginData {
  final User user;
  final String token;
  final String token_type;

  LoginData({
    required this.user,
    required this.token,
    required this.token_type,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

@JsonSerializable()
class User {
  final int id;
  final String first_name;
  final String last_name;
  final String email;
  final String last_login_at;
  final List<Department> departments;
  final List<Designation> designations;

  User({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.last_login_at,
    required this.departments,
    required this.designations,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Department {
  final int id;
  final String name;
  final String description;
  final Pivot pivot;

  Department({
    required this.id,
    required this.name,
    required this.description,
    required this.pivot,
  });

  factory Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);
  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}

@JsonSerializable()
class Designation {
  final int id;
  final String name;
  final String description;
  final String risk_level;
  final bool requires_replacement;
  final Pivot pivot;

  Designation({
    required this.id,
    required this.name,
    required this.description,
    required this.risk_level,
    required this.requires_replacement,
    required this.pivot,
  });

  factory Designation.fromJson(Map<String, dynamic> json) => _$DesignationFromJson(json);
  Map<String, dynamic> toJson() => _$DesignationToJson(this);
}

@JsonSerializable()
class Pivot {
  final int user_id;
  final int? department_id;
  final int? designation_id;
  final String created_at;
  final String updated_at;

  Pivot({
    required this.user_id,
    this.department_id,
    this.designation_id,
    required this.created_at,
    required this.updated_at,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);
  Map<String, dynamic> toJson() => _$PivotToJson(this);
}
