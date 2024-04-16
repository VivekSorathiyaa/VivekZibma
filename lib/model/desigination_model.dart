import 'dart:convert';

class DesignationModel {
  List<Designation> lstDesignation;
  dynamic totalRecords;
  dynamic statusCode;
  dynamic responseMessage;
  dynamic errors;

  DesignationModel({
    required this.lstDesignation,
    required this.totalRecords,
    required this.statusCode,
    required this.responseMessage,
    required this.errors,
  });

  DesignationModel copyWith({
    List<Designation>? lstDesignation,
    dynamic? totalRecords,
    dynamic? statusCode,
    dynamic responseMessage,
    dynamic errors,
  }) =>
      DesignationModel(
        lstDesignation: lstDesignation ?? this.lstDesignation,
        totalRecords: totalRecords ?? this.totalRecords,
        statusCode: statusCode ?? this.statusCode,
        responseMessage: responseMessage ?? this.responseMessage,
        errors: errors ?? this.errors,
      );

  factory DesignationModel.fromJson(String str) =>
      DesignationModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DesignationModel.fromMap(Map<String, dynamic> json) =>
      DesignationModel(
        lstDesignation: List<Designation>.from(
            json["lstDesignation"].map((x) => Designation.fromMap(x))),
        totalRecords: json["totalRecords"],
        statusCode: json["statusCode"],
        responseMessage: json["responseMessage"],
        errors: json["errors"],
      );

  Map<String, dynamic> toMap() => {
        "lstDesignation":
            List<dynamic>.from(lstDesignation.map((x) => x.toMap())),
        "totalRecords": totalRecords,
        "statusCode": statusCode,
        "responseMessage": responseMessage,
        "errors": errors,
      };
}

class Designation {
  dynamic designationId;
  String designationName;
  List<LstRole> lstRole;
  dynamic serialNo;

  Designation({
    required this.designationId,
    required this.designationName,
    required this.lstRole,
    required this.serialNo,
  });

  Designation copyWith({
    dynamic? designationId,
    String? designationName,
    List<LstRole>? lstRole,
    dynamic? serialNo,
  }) =>
      Designation(
        designationId: designationId ?? this.designationId,
        designationName: designationName ?? this.designationName,
        lstRole: lstRole ?? this.lstRole,
        serialNo: serialNo ?? this.serialNo,
      );

  factory Designation.fromJson(String str) =>
      Designation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Designation.fromMap(Map<String, dynamic> json) => Designation(
        designationId: json["designationId"],
        designationName: json["designationName"],
        lstRole:
            List<LstRole>.from(json["lstRole"].map((x) => LstRole.fromMap(x))),
        serialNo: json["serialNo"],
      );

  Map<String, dynamic> toMap() => {
        "designationId": designationId,
        "designationName": designationName,
        "lstRole": List<dynamic>.from(lstRole.map((x) => x.toMap())),
        "serialNo": serialNo,
      };
}

class LstRole {
  dynamic roleId;
  String roleName;
  dynamic eUserDesignation;

  LstRole({
    required this.roleId,
    required this.roleName,
    required this.eUserDesignation,
  });

  LstRole copyWith({
    dynamic? roleId,
    String? roleName,
    dynamic? eUserDesignation,
  }) =>
      LstRole(
        roleId: roleId ?? this.roleId,
        roleName: roleName ?? this.roleName,
        eUserDesignation: eUserDesignation ?? this.eUserDesignation,
      );

  factory LstRole.fromJson(String str) => LstRole.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LstRole.fromMap(Map<String, dynamic> json) => LstRole(
        roleId: json["roleId"],
        roleName: json["roleName"],
        eUserDesignation: json["eUserDesignation"],
      );

  Map<String, dynamic> toMap() => {
        "roleId": roleId,
        "roleName": roleName,
        "eUserDesignation": eUserDesignation,
      };
}
