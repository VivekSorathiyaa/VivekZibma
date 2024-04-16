import 'dart:convert';

class DepartMentModel {
  List<Department> lstDepartment;
  int statusCode;
  dynamic responseMessage;
  dynamic errors;

  DepartMentModel({
    required this.lstDepartment,
    required this.statusCode,
    required this.responseMessage,
    required this.errors,
  });

  DepartMentModel copyWith({
    List<Department>? lstDepartment,
    int? statusCode,
    dynamic responseMessage,
    dynamic errors,
  }) =>
      DepartMentModel(
        lstDepartment: lstDepartment ?? this.lstDepartment,
        statusCode: statusCode ?? this.statusCode,
        responseMessage: responseMessage ?? this.responseMessage,
        errors: errors ?? this.errors,
      );

  factory DepartMentModel.fromJson(String str) =>
      DepartMentModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DepartMentModel.fromMap(Map<String, dynamic> json) => DepartMentModel(
        lstDepartment: List<Department>.from(
            json["lstDepartment"].map((x) => Department.fromMap(x))),
        statusCode: json["statusCode"],
        responseMessage: json["responseMessage"],
        errors: json["errors"],
      );

  Map<String, dynamic> toMap() => {
        "lstDepartment":
            List<dynamic>.from(lstDepartment.map((x) => x.toMap())),
        "statusCode": statusCode,
        "responseMessage": responseMessage,
        "errors": errors,
      };
}

class Department {
  int departmentId;
  int parentId;
  String departmentName;
  int serialNo;
  String subDepartmentLabel;
  int? minAgeAllow;
  DateTime? ageCompareDate;
  int eStatus;
  List<LstDepartmentLstSubDepartment>? lstSubDepartment;

  Department({
    required this.departmentId,
    required this.parentId,
    required this.departmentName,
    required this.serialNo,
    required this.subDepartmentLabel,
    required this.minAgeAllow,
    required this.ageCompareDate,
    required this.eStatus,
    required this.lstSubDepartment,
  });

  Department copyWith({
    int? departmentId,
    int? parentId,
    String? departmentName,
    int? serialNo,
    String? subDepartmentLabel,
    int? minAgeAllow,
    DateTime? ageCompareDate,
    int? eStatus,
    List<LstDepartmentLstSubDepartment>? lstSubDepartment,
  }) =>
      Department(
        departmentId: departmentId ?? this.departmentId,
        parentId: parentId ?? this.parentId,
        departmentName: departmentName ?? this.departmentName,
        serialNo: serialNo ?? this.serialNo,
        subDepartmentLabel: subDepartmentLabel ?? this.subDepartmentLabel,
        minAgeAllow: minAgeAllow ?? this.minAgeAllow,
        ageCompareDate: ageCompareDate ?? this.ageCompareDate,
        eStatus: eStatus ?? this.eStatus,
        lstSubDepartment: lstSubDepartment ?? this.lstSubDepartment,
      );

  factory Department.fromJson(String str) =>
      Department.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Department.fromMap(Map<String, dynamic> json) => Department(
        departmentId: json["departmentId"],
        parentId: json["parentId"],
        departmentName: json["departmentName"],
        serialNo: json["serialNo"],
        subDepartmentLabel: json["subDepartmentLabel"],
        minAgeAllow: json["minAgeAllow"],
        ageCompareDate: json["ageCompareDate"] == null
            ? null
            : DateTime.parse(json["ageCompareDate"]),
        eStatus: json["eStatus"],
        lstSubDepartment: json["lstSubDepartment"] == null
            ? []
            : List<LstDepartmentLstSubDepartment>.from(json["lstSubDepartment"]!
                .map((x) => LstDepartmentLstSubDepartment.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "departmentId": departmentId,
        "parentId": parentId,
        "departmentName": departmentName,
        "serialNo": serialNo,
        "subDepartmentLabel": subDepartmentLabel,
        "minAgeAllow": minAgeAllow,
        "ageCompareDate": ageCompareDate?.toIso8601String(),
        "eStatus": eStatus,
        "lstSubDepartment": lstSubDepartment == null
            ? []
            : List<dynamic>.from(lstSubDepartment!.map((x) => x.toMap())),
      };
}

class LstDepartmentLstSubDepartment {
  int departmentId;
  int parentId;
  String departmentName;
  int serialNo;
  String subDepartmentLabel;
  int? minAgeAllow;
  dynamic ageCompareDate;
  int eStatus;
  List<LstSubDepartmentLstSubDepartment>? lstSubDepartment;

  LstDepartmentLstSubDepartment({
    required this.departmentId,
    required this.parentId,
    required this.departmentName,
    required this.serialNo,
    required this.subDepartmentLabel,
    required this.minAgeAllow,
    required this.ageCompareDate,
    required this.eStatus,
    required this.lstSubDepartment,
  });

  LstDepartmentLstSubDepartment copyWith({
    int? departmentId,
    int? parentId,
    String? departmentName,
    int? serialNo,
    String? subDepartmentLabel,
    int? minAgeAllow,
    dynamic ageCompareDate,
    int? eStatus,
    List<LstSubDepartmentLstSubDepartment>? lstSubDepartment,
  }) =>
      LstDepartmentLstSubDepartment(
        departmentId: departmentId ?? this.departmentId,
        parentId: parentId ?? this.parentId,
        departmentName: departmentName ?? this.departmentName,
        serialNo: serialNo ?? this.serialNo,
        subDepartmentLabel: subDepartmentLabel ?? this.subDepartmentLabel,
        minAgeAllow: minAgeAllow ?? this.minAgeAllow,
        ageCompareDate: ageCompareDate ?? this.ageCompareDate,
        eStatus: eStatus ?? this.eStatus,
        lstSubDepartment: lstSubDepartment ?? this.lstSubDepartment,
      );

  factory LstDepartmentLstSubDepartment.fromJson(String str) =>
      LstDepartmentLstSubDepartment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LstDepartmentLstSubDepartment.fromMap(Map<String, dynamic> json) =>
      LstDepartmentLstSubDepartment(
        departmentId: json["departmentId"],
        parentId: json["parentId"],
        departmentName: json["departmentName"],
        serialNo: json["serialNo"],
        subDepartmentLabel: json["subDepartmentLabel"],
        minAgeAllow: json["minAgeAllow"],
        ageCompareDate: json["ageCompareDate"],
        eStatus: json["eStatus"],
        lstSubDepartment: json["lstSubDepartment"] == null
            ? []
            : List<LstSubDepartmentLstSubDepartment>.from(
                json["lstSubDepartment"]!
                    .map((x) => LstSubDepartmentLstSubDepartment.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "departmentId": departmentId,
        "parentId": parentId,
        "departmentName": departmentName,
        "serialNo": serialNo,
        "subDepartmentLabel": subDepartmentLabel,
        "minAgeAllow": minAgeAllow,
        "ageCompareDate": ageCompareDate,
        "eStatus": eStatus,
        "lstSubDepartment": lstSubDepartment == null
            ? []
            : List<dynamic>.from(lstSubDepartment!.map((x) => x.toMap())),
      };
}

class LstSubDepartmentLstSubDepartment {
  int departmentId;
  int parentId;
  String departmentName;
  int serialNo;
  String subDepartmentLabel;
  int? minAgeAllow;
  dynamic ageCompareDate;
  int eStatus;
  List<LstSubDepartmentLstSubDepartment>? lstSubDepartment;

  LstSubDepartmentLstSubDepartment({
    required this.departmentId,
    required this.parentId,
    required this.departmentName,
    required this.serialNo,
    required this.subDepartmentLabel,
    required this.minAgeAllow,
    required this.ageCompareDate,
    required this.eStatus,
    required this.lstSubDepartment,
  });

  LstSubDepartmentLstSubDepartment copyWith({
    int? departmentId,
    int? parentId,
    String? departmentName,
    int? serialNo,
    String? subDepartmentLabel,
    int? minAgeAllow,
    dynamic ageCompareDate,
    int? eStatus,
    List<LstSubDepartmentLstSubDepartment>? lstSubDepartment,
  }) =>
      LstSubDepartmentLstSubDepartment(
        departmentId: departmentId ?? this.departmentId,
        parentId: parentId ?? this.parentId,
        departmentName: departmentName ?? this.departmentName,
        serialNo: serialNo ?? this.serialNo,
        subDepartmentLabel: subDepartmentLabel ?? this.subDepartmentLabel,
        minAgeAllow: minAgeAllow ?? this.minAgeAllow,
        ageCompareDate: ageCompareDate ?? this.ageCompareDate,
        eStatus: eStatus ?? this.eStatus,
        lstSubDepartment: lstSubDepartment ?? this.lstSubDepartment,
      );

  factory LstSubDepartmentLstSubDepartment.fromJson(String str) =>
      LstSubDepartmentLstSubDepartment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LstSubDepartmentLstSubDepartment.fromMap(Map<String, dynamic> json) =>
      LstSubDepartmentLstSubDepartment(
        departmentId: json["departmentId"],
        parentId: json["parentId"],
        departmentName: json["departmentName"],
        serialNo: json["serialNo"],
        subDepartmentLabel: json["subDepartmentLabel"],
        minAgeAllow: json["minAgeAllow"],
        ageCompareDate: json["ageCompareDate"],
        eStatus: json["eStatus"],
        lstSubDepartment: json["lstSubDepartment"] == null
            ? []
            : List<LstSubDepartmentLstSubDepartment>.from(
                json["lstSubDepartment"]!
                    .map((x) => LstSubDepartmentLstSubDepartment.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "departmentId": departmentId,
        "parentId": parentId,
        "departmentName": departmentName,
        "serialNo": serialNo,
        "subDepartmentLabel": subDepartmentLabel,
        "minAgeAllow": minAgeAllow,
        "ageCompareDate": ageCompareDate,
        "eStatus": eStatus,
        "lstSubDepartment": lstSubDepartment == null
            ? []
            : List<dynamic>.from(lstSubDepartment!.map((x) => x.toMap())),
      };
}
