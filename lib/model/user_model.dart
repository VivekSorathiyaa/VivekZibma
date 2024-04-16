import 'dart:convert';

class UserModel {
  List<User> lstUser;
  dynamic totalRecords;
  dynamic statusCode;
  dynamic responseMessage;
  dynamic errors;

  UserModel({
    required this.lstUser,
    required this.totalRecords,
    required this.statusCode,
    required this.responseMessage,
    required this.errors,
  });

  UserModel copyWith({
    List<User>? lstUser,
    dynamic? totalRecords,
    dynamic? statusCode,
    dynamic responseMessage,
    dynamic errors,
  }) =>
      UserModel(
        lstUser: lstUser ?? this.lstUser,
        totalRecords: totalRecords ?? this.totalRecords,
        statusCode: statusCode ?? this.statusCode,
        responseMessage: responseMessage ?? this.responseMessage,
        errors: errors ?? this.errors,
      );

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        lstUser: List<User>.from(json["lstUser"].map((x) => User.fromMap(x))),
        totalRecords: json["totalRecords"],
        statusCode: json["statusCode"],
        responseMessage: json["responseMessage"],
        errors: json["errors"],
      );

  Map<String, dynamic> toMap() => {
        "lstUser": List<dynamic>.from(lstUser.map((x) => x.toMap())),
        "totalRecords": totalRecords,
        "statusCode": statusCode,
        "responseMessage": responseMessage,
        "errors": errors,
      };
}

class User {
  dynamic personId;
  dynamic userId;
  String shortName;
  String fullName;
  String firstName;
  String lastName;
  String fatherName;
  dynamic gender;
  String designationName;
  String roleName;
  String departmentName;
  String motherName;
  DateTime birthdate;
  dynamic maritalStatus;
  DateTime? anniversaryDate;
  String employeeNo;
  String aadharNo;
  DateTime admissionDate;
  DateTime? fatherBirthDate;
  DateTime? motherBirthDate;
  String registeredMobile;
  String email1;
  String email2;
  String address;
  String mobile1;
  String mobile2;
  String classTeacher;
  dynamic rollNo;
  String? grNo;
  DateTime? grRegistrationDate;
  String? examSeatNo;
  String? uid;
  String? boardSid;
  bool isPhysicalDisability;
  dynamic? ePhysicalDisabilityType;
  dynamic? physicalDisabilityPercentage;
  dynamic eRiligion;
  dynamic eCategory;
  String caste;
  String subCaste;
  String? userPhoto;
  String? userSign;
  String? fatherPhoto;
  String? fatherSign;
  String? motherPhoto;
  String? motherSign;
  String userName;

  User({
    required this.personId,
    required this.userId,
    required this.shortName,
    required this.fullName,
    required this.firstName,
    required this.lastName,
    required this.fatherName,
    required this.gender,
    required this.designationName,
    required this.roleName,
    required this.departmentName,
    required this.motherName,
    required this.birthdate,
    required this.maritalStatus,
    required this.anniversaryDate,
    required this.employeeNo,
    required this.aadharNo,
    required this.admissionDate,
    required this.fatherBirthDate,
    required this.motherBirthDate,
    required this.registeredMobile,
    required this.email1,
    required this.email2,
    required this.address,
    required this.mobile1,
    required this.mobile2,
    required this.classTeacher,
    required this.rollNo,
    required this.grNo,
    required this.grRegistrationDate,
    required this.examSeatNo,
    required this.uid,
    required this.boardSid,
    required this.isPhysicalDisability,
    required this.ePhysicalDisabilityType,
    required this.physicalDisabilityPercentage,
    required this.eRiligion,
    required this.eCategory,
    required this.caste,
    required this.subCaste,
    required this.userPhoto,
    required this.userSign,
    required this.fatherPhoto,
    required this.fatherSign,
    required this.motherPhoto,
    required this.motherSign,
    required this.userName,
  });

  User copyWith({
    dynamic? personId,
    dynamic? userId,
    String? shortName,
    String? fullName,
    String? firstName,
    String? lastName,
    String? fatherName,
    dynamic? gender,
    String? designationName,
    String? roleName,
    String? departmentName,
    String? motherName,
    DateTime? birthdate,
    dynamic? maritalStatus,
    DateTime? anniversaryDate,
    String? employeeNo,
    String? aadharNo,
    DateTime? admissionDate,
    DateTime? fatherBirthDate,
    DateTime? motherBirthDate,
    String? registeredMobile,
    String? email1,
    String? email2,
    String? address,
    String? mobile1,
    String? mobile2,
    String? classTeacher,
    dynamic? rollNo,
    String? grNo,
    DateTime? grRegistrationDate,
    String? examSeatNo,
    String? uid,
    String? boardSid,
    bool? isPhysicalDisability,
    dynamic? ePhysicalDisabilityType,
    dynamic? physicalDisabilityPercentage,
    dynamic? eRiligion,
    dynamic? eCategory,
    String? caste,
    String? subCaste,
    String? userPhoto,
    String? userSign,
    String? fatherPhoto,
    String? fatherSign,
    String? motherPhoto,
    String? motherSign,
    String? userName,
  }) =>
      User(
        personId: personId ?? this.personId,
        userId: userId ?? this.userId,
        shortName: shortName ?? this.shortName,
        fullName: fullName ?? this.fullName,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        fatherName: fatherName ?? this.fatherName,
        gender: gender ?? this.gender,
        designationName: designationName ?? this.designationName,
        roleName: roleName ?? this.roleName,
        departmentName: departmentName ?? this.departmentName,
        motherName: motherName ?? this.motherName,
        birthdate: birthdate ?? this.birthdate,
        maritalStatus: maritalStatus ?? this.maritalStatus,
        anniversaryDate: anniversaryDate ?? this.anniversaryDate,
        employeeNo: employeeNo ?? this.employeeNo,
        aadharNo: aadharNo ?? this.aadharNo,
        admissionDate: admissionDate ?? this.admissionDate,
        fatherBirthDate: fatherBirthDate ?? this.fatherBirthDate,
        motherBirthDate: motherBirthDate ?? this.motherBirthDate,
        registeredMobile: registeredMobile ?? this.registeredMobile,
        email1: email1 ?? this.email1,
        email2: email2 ?? this.email2,
        address: address ?? this.address,
        mobile1: mobile1 ?? this.mobile1,
        mobile2: mobile2 ?? this.mobile2,
        classTeacher: classTeacher ?? this.classTeacher,
        rollNo: rollNo ?? this.rollNo,
        grNo: grNo ?? this.grNo,
        grRegistrationDate: grRegistrationDate ?? this.grRegistrationDate,
        examSeatNo: examSeatNo ?? this.examSeatNo,
        uid: uid ?? this.uid,
        boardSid: boardSid ?? this.boardSid,
        isPhysicalDisability: isPhysicalDisability ?? this.isPhysicalDisability,
        ePhysicalDisabilityType:
            ePhysicalDisabilityType ?? this.ePhysicalDisabilityType,
        physicalDisabilityPercentage:
            physicalDisabilityPercentage ?? this.physicalDisabilityPercentage,
        eRiligion: eRiligion ?? this.eRiligion,
        eCategory: eCategory ?? this.eCategory,
        caste: caste ?? this.caste,
        subCaste: subCaste ?? this.subCaste,
        userPhoto: userPhoto ?? this.userPhoto,
        userSign: userSign ?? this.userSign,
        fatherPhoto: fatherPhoto ?? this.fatherPhoto,
        fatherSign: fatherSign ?? this.fatherSign,
        motherPhoto: motherPhoto ?? this.motherPhoto,
        motherSign: motherSign ?? this.motherSign,
        userName: userName ?? this.userName,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        personId: json["personId"],
        userId: json["userId"],
        shortName: json["shortName"],
        fullName: json["fullName"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        fatherName: json["fatherName"],
        gender: json["gender"],
        designationName: json["designationName"],
        roleName: json["roleName"],
        departmentName: json["departmentName"],
        motherName: json["motherName"],
        birthdate: DateTime.parse(json["birthdate"]),
        maritalStatus: json["maritalStatus"],
        anniversaryDate: json["anniversaryDate"] == null
            ? null
            : DateTime.parse(json["anniversaryDate"]),
        employeeNo: json["employeeNo"],
        aadharNo: json["aadharNo"],
        admissionDate: DateTime.parse(json["admissionDate"]),
        fatherBirthDate: json["fatherBirthDate"] == null
            ? null
            : DateTime.parse(json["fatherBirthDate"]),
        motherBirthDate: json["motherBirthDate"] == null
            ? null
            : DateTime.parse(json["motherBirthDate"]),
        registeredMobile: json["registeredMobile"],
        email1: json["email1"],
        email2: json["email2"],
        address: json["address"]!,
        mobile1: json["mobile1"]!,
        mobile2: json["mobile2"]!,
        classTeacher: json["classTeacher"],
        rollNo: json["rollNo"],
        grNo: json["grNo"],
        grRegistrationDate: json["grRegistrationDate"] == null
            ? null
            : DateTime.parse(json["grRegistrationDate"]),
        examSeatNo: json["examSeatNo"],
        uid: json["uid"],
        boardSid: json["boardSID"],
        isPhysicalDisability: json["isPhysicalDisability"],
        ePhysicalDisabilityType: json["ePhysicalDisabilityType"],
        physicalDisabilityPercentage: json["physicalDisabilityPercentage"],
        eRiligion: json["eRiligion"],
        eCategory: json["eCategory"],
        caste: json["caste"],
        subCaste: json["subCaste"],
        userPhoto: json["userPhoto"],
        userSign: json["userSign"],
        fatherPhoto: json["fatherPhoto"],
        fatherSign: json["fatherSign"],
        motherPhoto: json["motherPhoto"],
        motherSign: json["motherSign"],
        userName: json["userName"],
      );

  Map<String, dynamic> toMap() => {
        "personId": personId,
        "userId": userId,
        "shortName": shortName,
        "fullName": fullName,
        "firstName": firstName,
        "lastName": lastName,
        "fatherName": fatherName,
        "gender": gender,
        "designationName": designationName,
        "roleName": roleName,
        "departmentName": departmentName,
        "motherName": motherName,
        "birthdate": birthdate.toIso8601String(),
        "maritalStatus": maritalStatus,
        "anniversaryDate": anniversaryDate?.toIso8601String(),
        "employeeNo": employeeNo,
        "aadharNo": aadharNo,
        "admissionDate": admissionDate.toIso8601String(),
        "fatherBirthDate": fatherBirthDate?.toIso8601String(),
        "motherBirthDate": motherBirthDate?.toIso8601String(),
        "registeredMobile": registeredMobile,
        "email1": email1,
        "email2": email2,
        "address": address,
        "mobile1": mobile1,
        "mobile2": mobile2,
        "classTeacher": classTeacher,
        "rollNo": rollNo,
        "grNo": grNo,
        "grRegistrationDate": grRegistrationDate?.toIso8601String(),
        "examSeatNo": examSeatNo,
        "uid": uid,
        "boardSID": boardSid,
        "isPhysicalDisability": isPhysicalDisability,
        "ePhysicalDisabilityType": ePhysicalDisabilityType,
        "physicalDisabilityPercentage": physicalDisabilityPercentage,
        "eRiligion": eRiligion,
        "eCategory": eCategory,
        "caste": caste,
        "subCaste": subCaste,
        "userPhoto": userPhoto,
        "userSign": userSign,
        "fatherPhoto": fatherPhoto,
        "fatherSign": fatherSign,
        "motherPhoto": motherPhoto,
        "motherSign": motherSign,
        "userName": userName,
      };
}
