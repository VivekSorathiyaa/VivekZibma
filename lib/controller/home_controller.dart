import 'dart:developer';

import 'package:Zibma/model/desigination_model.dart';
import 'package:Zibma/utils/repository/network_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../model/department_model.dart';
import '../model/user_model.dart';

class HomeController extends GetxController {
  int pageNo = 1;
  int desiginationPageNo = 1;
  int maxItem = 20;
  NetworkRepository networkRepository = NetworkRepository();
  TextEditingController searchController = TextEditingController();
  var status = true.obs;
  RxList<User> userList = <User>[].obs;
  RxList<Designation> designationList = <Designation>[].obs;
  RxList<Department> departmentList = <Department>[].obs;
  final MultiSelectController<Designation> controllerDesignation =
      MultiSelectController();
  final MultiSelectController<Department> controllerDepartment =
      MultiSelectController();

  final List<ValueItem> selectedOptionsDesignation = [];
  final List<ValueItem> selectedOptionsDepartment = [];

  Future refreshPage(BuildContext context) async {
    userList.value.clear();
    userList.refresh();
    pageNo = 1;
    userGetAll(context);
    designationGetAll(context);
    departmentGetAll(context);
  }

  void setStatus(bool value) {
    status.value = value;
    departmentGetAll(null);
  }

  Future userGetAll(BuildContext? context) async {
    var lstDesignationId = [0];
    var lstDepartmentId = [0];
    var lstRoleId = [0];
    for (ValueItem data in selectedOptionsDesignation) {
      Designation designation = data.value as Designation;
      lstDesignationId.add(designation.designationId);
      // lstRoleId.add(designation.lstRole[0].roleId);
    }

    for (ValueItem data in selectedOptionsDepartment) {
      Department department = data.value as Department;
      lstDepartmentId.add(department.departmentId);
    }
    var data = {
      "masterSearch": searchController.text,
      "lstDesignationId": lstDesignationId,
      "lstRoleId": lstRoleId,
      "lstDepartmentId": lstDepartmentId,
      "eStatus": status.value ? 1 : 2,
      "maxItem": maxItem,
      "pageNo": pageNo
    };
    UserModel response = await networkRepository.userGetAll(context, data);

// Filter out duplicates
    List<User> newUsers = response.lstUser
        .where((newUser) => !userList.value
            .any((existingUser) => newUser.userId == existingUser.userId))
        .toList();

// Add filtered new users to userList
    userList.value.addAll(newUsers);
    userList.refresh();
    update();
  }

  Future designationGetAll(BuildContext context) async {
    var data = {
      "masterSearch": searchController.text,
      "maxItem": 50,
      "pageNo": desiginationPageNo
    };
    DesignationModel response =
        await networkRepository.designationGetAll(context, data);
    designationList.value.addAll(response.lstDesignation);
    designationList.refresh();
    update();
  }

  Future departmentGetAll(BuildContext? context) async {
    departmentList.value.clear();
    departmentList.refresh();
    DepartMentModel response =
        await networkRepository.departmentGetAll(context, status.value ? 1 : 2);
    departmentList.value.addAll(response.lstDepartment);
    departmentList.refresh();
    update();
  }
}
