import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:Zibma/model/desigination_model.dart';
import 'package:Zibma/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:Zibma/components/colors.dart';
import 'package:Zibma/components/common_methos.dart';

import 'package:Zibma/utils/app_constants.dart';
import 'package:Zibma/utils/network_dio/network_dio.dart';

import '../../model/department_model.dart';

NetworkRepository networkRepository = NetworkRepository();

class NetworkRepository {
  static final NetworkRepository _networkRepository =
      NetworkRepository._internal();
  static final dataStorage = GetStorage();
  static final userToken =
      "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJhZjdiZTY4YS0wMDBiLTRjZGItOGUzNy05NTliMTRmYzYxNWQiLCJsc3RVc2VyUHJvZHVjdCI6W3siZVByb2R1Y3RUeXBlIjowLCJQcm9kdWN0SWQiOjEsIlByb2R1Y3ROYW1lIjoiVXNlckFjY291bnQifSx7ImVQcm9kdWN0VHlwZSI6OCwiUHJvZHVjdElkIjoyLCJQcm9kdWN0TmFtZSI6IkRyaXZlIn0seyJlUHJvZHVjdFR5cGUiOjcsIlByb2R1Y3RJZCI6MywiUHJvZHVjdE5hbWUiOiJOb3RpZmllciJ9LHsiZVByb2R1Y3RUeXBlIjozLCJQcm9kdWN0SWQiOjQsIlByb2R1Y3ROYW1lIjoiRGlzcGxheSBTaXRlIn0seyJlUHJvZHVjdFR5cGUiOjEsIlByb2R1Y3RJZCI6NSwiUHJvZHVjdE5hbWUiOiJUYXNrIn0seyJlUHJvZHVjdFR5cGUiOjIsIlByb2R1Y3RJZCI6NiwiUHJvZHVjdE5hbWUiOiJUaWNrZXQifSx7ImVQcm9kdWN0VHlwZSI6OSwiUHJvZHVjdElkIjo3LCJQcm9kdWN0TmFtZSI6IlByb2plY3QifSx7ImVQcm9kdWN0VHlwZSI6NCwiUHJvZHVjdElkIjo4LCJQcm9kdWN0TmFtZSI6IkJpb21ldHJpYyJ9LHsiZVByb2R1Y3RUeXBlIjo1LCJQcm9kdWN0SWQiOjksIlByb2R1Y3ROYW1lIjoiQXR0ZW5kYW5jZSJ9LHsiZVByb2R1Y3RUeXBlIjo2LCJQcm9kdWN0SWQiOjEwLCJQcm9kdWN0TmFtZSI6IlJlcG9ydCJ9XSwibmJmIjoxNzEzMjQ4MDcwLCJleHAiOjE3MTMzMzQ0NzAsImlzcyI6Im1ZWGQ1NDdHcWdhY09LRVV6RzYxIiwiYXVkIjoiWmlibWFDYW1wdXMiLCJlUHJvZHVjdFR5cGUiOjAsInVzZXJJZCI6MSwib3JnYW5pemF0aW9uSWQiOjEsImNvbXBhbnlJZCI6MSwieWVhcklkIjoxLCJlQnVzaW5lc3NUeXBlIjoyLCJlVXNlckRlc2lnbmF0aW9uIjoxLCJsc3RBbGxvd0Rlc2lnbmF0aW9uIjpbMSwxMiwxOSwyMCwyNiwzNiwzNywzOCwzOSw0NSw0Niw0Nyw1MCw1Nyw1OF0sImxzdEFsbG93RGVwYXJ0bWVudCI6WzcsMTcsMjIsMjMsMjQsMjUsMjYsMzAsMzEsMzIsMzQsMzUsMzYsMzcsMzgsMzksNDAsNDEsNDgsNDksNTksNjUsNjYsNjgsNjksNzAsNzEsNzIsNzMsNzQsNzYsNzcsOTQsOTUsOTYsOTcsOTgsOTksMTAxXSwiY2xhaW1zIjpbXX0.jChPn5qv0DkVTutkiqINCazpXwSAAkIhByStm7foYqA";

  factory NetworkRepository() {
    return _networkRepository;
  }
  NetworkRepository._internal();

  FocusNode searchFocus = FocusNode();

  userGetAll(context, Map<String, dynamic> data) async {
    // Ensure data is Map<String, dynamic>
    final response = await NetworkDioHttp.postDioHttpMethod(
      context: context,
      header: {'Authorization': userToken, 'Content-Type': 'application/json'},
      url: ApiAppConstants.apiEndPoint + ApiAppConstants.userGetAll,
      data: data,
    );

    return UserModel.fromMap(
        response['body']); // Convert response body to UserModel
  }

  designationGetAll(context, Map<String, dynamic> data) async {
    // Ensure data is Map<String, dynamic>
    final response = await NetworkDioHttp.postDioHttpMethod(
      context: context,
      header: {'Authorization': userToken, 'Content-Type': 'application/json'},
      url: ApiAppConstants.apiEndPoint + ApiAppConstants.designationGetAll,
      data: data,
    );

    return DesignationModel.fromMap(
        response['body']); // Convert response body to UserModel
  }

  departmentGetAll(context, int data) async {
    // Ensure data is Map<String, dynamic>
    final response = await NetworkDioHttp.getDioHttpMethod(
      context: context,
      header: {'Authorization': userToken, 'Content-Type': 'application/json'},
      url: ApiAppConstants.apiEndPoint + "department/get?eStatus=$data",
    );

    return DepartMentModel.fromMap(
        response['body']); // Convert response body to UserModel
  }

  Future<void> checkResponse(
    response,
    modelResponse,
  ) async {
    log("response check------>${response}---->Checked");
    if ((response['body']['status'] == 401 ||
            response['body']['status'] == 410) &&
        dataStorage.read("token") != null) {}
    if (response["error_description"] == null ||
        response["error_description"] == 'null') {
      if (response['body']['status'] == 200 ||
          response['body']['status'] == "200") {
        return modelResponse;
        // } else {
        //   showErrorDialog(message: response['body']['message']);
        // }
      } else if (response['body']['status'] == 500 ||
          response['body']['status'] == "500") {
        return modelResponse;
      } else {
        showErrorDialog(message: response['body']['message']);
      }
    }
    // else {
    //   if (response['body']['status'] == 401 ||
    //       response['body']['status'] == '401') {
    //     showErrorDialog(message: response['body']['message']);
    //     Future.delayed(Duration(seconds: 2), () {
    //       // Get.to(LoginScreen());
    //     });
    // }
    else {
      if (dataStorage.read("token") != null) {
        showErrorDialog(message: response['body']['message']);
      }
    }
    // }
  }

  Future<void> checkResponse2(
    response,
  ) async {
    log("response check------>2${response['body']['message']}---->Checked");
    if ((response['body']['status'] == 401 ||
            response['body']['status'] == 410) &&
        dataStorage.read("token") != null) {}
    if (response["error_description"] == null ||
        response["error_description"] == 'null') {
      if (response['body']['status'] == 200 ||
          response['body']['status'] == "200") {
        log('${response['body']}');
        return response['body'];
      } else if (response['body']['status'] == 500 ||
          response['body']['status'] == "500") {
        showErrorDialog(message: response['body']['message']);
        return response['body'];
      } else {
        showErrorDialog(message: response['body']['message']);
      }
    } else {
      if (dataStorage.read("token") != null) {
        showErrorDialog(message: response['error_description']);
      }
    }
  }

  void showErrorDialog({required String message}) {
    CommonMethod().getXSnackBar("Error", message.toString(), red);
  }
}
