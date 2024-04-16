import 'dart:developer';

import 'package:Zibma/components/app_text_style.dart';
import 'package:Zibma/components/colors.dart';
import 'package:Zibma/components/image/image_widget.dart';
import 'package:Zibma/components/static_decoration.dart';
import 'package:Zibma/controller/home_controller.dart';
import 'package:Zibma/pages/custom_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final ScrollController _scrollController = ScrollController();

  var controller = Get.put(HomeController());
  @override
  void initState() {
    controller.refreshPage(context);
    _scrollController.addListener(_onScroll);
    controller.controllerDesignation.clearAllSelection();
    controller.controllerDepartment.clearAllSelection();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    log("---_onScroll---");
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMoreItems();
    }
  }

  void _loadMoreItems() {
    controller.pageNo++;
    controller.userGetAll(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("User",
            style: AppTextStyle.normalRegular15
                .copyWith(fontWeight: FontWeight.w600, height: 0)),
        actions: [
          InkWell(
            radius: 90,
            onTap: () {
              controller.designationGetAll(context);
              controller.departmentGetAll(context);
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled:
                    true, // Set to true to allow content to exceed screen height
                builder: (context) => SingleChildScrollView(
                  child: CustomBottomSheet(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CircleAvatar(
                backgroundColor: lightGrey,
                child: Icon(
                  Icons.search_rounded,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: appColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        foregroundColor: Colors.white,
        splashColor: Colors.white.withOpacity(0.5),
        hoverColor: Colors.white.withOpacity(0.2),
        focusColor: Colors.white.withOpacity(0.2),
        highlightElevation: 0,
        hoverElevation: 0,
        // splashElevation: 10,
        disabledElevation: 0,
        tooltip: 'Button',
      ),
      body: Obx(
        () => ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          controller: _scrollController,
          itemCount: controller.userList.length,
          itemBuilder: (context, index) {
            var data = controller.userList.value[index];
            return Column(
              children: [
                Divider(
                  color: hintGrey,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      NetworkImageWidget(
                        imageUrl:
                            "https://images.unsplash.com/photo-1633332755192-727a05c4013d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
                        height: 36,
                        width: 36,
                        borderRadius: BorderRadius.circular(36),
                      ),
                      width15,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Row(
                                  children: [
                                    Text("${data.firstName} ${data.lastName}",
                                        style: AppTextStyle.normalRegular15
                                            .copyWith(
                                                fontWeight: FontWeight.w600)),
                                    Text(
                                        " ( ${data.gender == 1 ? "Male" : "Female"} )",
                                        style: AppTextStyle.normalRegular11
                                            .copyWith(
                                                fontWeight: FontWeight.w500)),
                                  ],
                                )),
                                Icon(
                                  Icons.more_vert,
                                  size: 20,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(data.roleName,
                                      style: AppTextStyle.normalRegular13
                                          .copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: greyColor)),
                                ),
                                Icon(
                                  Icons.phone_iphone_rounded,
                                  size: 15,
                                  color: greyColor,
                                ),
                                width05,
                                Text(
                                  data.registeredMobile,
                                  style: AppTextStyle.normalRegular13.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: greyColor),
                                ),
                                width15,
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
