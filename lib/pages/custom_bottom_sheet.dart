import 'package:Zibma/components/app_text_style.dart';
import 'package:Zibma/components/buttons/text_button.dart';
import 'package:Zibma/components/colors.dart';
import 'package:Zibma/components/static_decoration.dart';
import 'package:Zibma/model/department_model.dart';
import 'package:Zibma/model/desigination_model.dart';
import 'package:Zibma/widget/text_widgets/input_text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/enum/app_enums.dart';
import 'package:multi_dropdown/models/chip_config.dart';
import 'package:multi_dropdown/models/network_config.dart';
import 'package:multi_dropdown/models/value_item.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:multi_dropdown/widgets/hint_text.dart';
import 'package:multi_dropdown/widgets/selection_chip.dart';
import 'package:multi_dropdown/widgets/single_selected_item.dart';

import '../controller/home_controller.dart';

class CustomBottomSheet extends StatefulWidget {
  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: primaryWhite,
      ),
      height: Get.height - 100,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                height20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: lightGrey,
                        child: Icon(
                          Icons.delete_outline_rounded,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text("Search",
                              style: AppTextStyle.normalRegular16.copyWith(
                                  fontWeight: FontWeight.w700, height: 0)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: CircleAvatar(
                          backgroundColor: lightGrey,
                          child: Icon(
                            Icons.close,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                height10,
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          color: dividerColor, width: 3), // Top border color
                      bottom: BorderSide(
                          color: dividerColor), // Bottom border color
                    ),
                  ),
                  child: Theme(
                    data: ThemeData(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Search :',
                            style: AppTextStyle.normalRegular12
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            controller.searchController.text,
                            style: AppTextStyle.normalRegular12
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  8.0), // Set rounded corner radius
                              border: Border.all(
                                color: borderGrey, // Set border color
                                width: 1.0, // Set border width
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: controller.searchController,
                                autofocus: true,
                                onChanged: (val) {
                                  setState(() {
                                    // controller.refresh();
                                    // controller.userGetAll(context);
                                  });
                                },
                                style: AppTextStyle.normalRegular12.copyWith(
                                    color: hintGrey), // Decrease font size
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  hintStyle: AppTextStyle.normalRegular12.copyWith(
                                      color:
                                          hintGrey), // Decrease hint font size
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal:
                                          8.0), // Adjust content padding
                                  border:
                                      InputBorder.none, // Remove default border
                                  // Center the text
                                  alignLabelWithHint: true,
                                  hintMaxLines: 1,
                                  isDense: true,
                                ),
                                // textAlign: TextAlign.center, // Center the text
                              ),
                            ),
                          ),
                        )
                      ],
                      // tilePadding: EdgeInsets.zero, // remove the default padding
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          color: dividerColor, width: 2), // Top border color
                      bottom: BorderSide(
                          color: dividerColor), // Bottom border color
                    ),
                  ),
                  child: Theme(
                    data: ThemeData(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Role & Permission :',
                            style: AppTextStyle.normalRegular12
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            controller.controllerDesignation.selectedOptions
                                    .isEmpty
                                ? "All"
                                : controller
                                    .controllerDesignation.selectedOptions
                                    .map((e) {
                                    return e
                                        .value!.designationName.capitalizeFirst;
                                  }).toString(),
                            style: AppTextStyle.normalRegular12
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Obx(
                            () => MultiSelectDropDown<Designation>(
                              controller: controller.controllerDesignation,
                              clearIcon: const Icon(Icons.close),
                              onOptionSelected: (options) {
                                setState(() {});
                              },
                              options: <ValueItem<Designation>>[
                                ...controller.designationList
                                    .map((element) => ValueItem(
                                        label: element.designationName,
                                        value: element))
                                    .toList()
                              ],
                              // maxItems: 4,
                              singleSelectItemStyle: AppTextStyle.normalBold12,

                              chipConfig: const ChipConfig(
                                  spacing: 4,
                                  autoScroll: true,
                                  wrapType: WrapType.wrap,
                                  backgroundColor: appColor),
                              optionTextStyle: AppTextStyle.normalBold14,
                              selectedOptionIcon: const Icon(
                                Icons.check_circle,
                                color: primaryBlack,
                              ),
                              selectedOptionBackgroundColor:
                                  Colors.grey.shade300,
                              selectedOptionTextColor: Colors.blue,
                              dropdownMargin: 1,
                              onOptionRemoved: (index, option) {
                                setState(() {});
                              },
                              optionBuilder: (context, valueItem, isSelected) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(child: Text(valueItem.label)),
                                      isSelected
                                          ? const Icon(Icons.check_circle)
                                          : const Icon(
                                              Icons.radio_button_unchecked)
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          color: dividerColor, width: 2), // Top border color
                      bottom: BorderSide(
                          color: dividerColor, width: 3), // Bottom border color
                    ),
                  ),
                  child: Theme(
                    data: ThemeData(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Department :',
                            style: AppTextStyle.normalRegular12
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            controller.controllerDepartment.selectedOptions
                                    .isEmpty
                                ? "All"
                                : controller
                                    .controllerDepartment.selectedOptions
                                    .map((e) {
                                    return e
                                        .value!.departmentName.capitalizeFirst;
                                  }).toString(),
                            style: AppTextStyle.normalRegular12
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Obx(
                            () => MultiSelectDropDown<Department>(
                              controller: controller.controllerDepartment,
                              clearIcon: const Icon(Icons.close),
                              onOptionSelected: (options) {
                                setState(() {});
                              },
                              options: <ValueItem<Department>>[
                                ...controller.departmentList.value
                                    .map((element) => ValueItem(
                                        label: element.departmentName,
                                        value: element))
                                    .toList()
                              ],
                              singleSelectItemStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              chipConfig: const ChipConfig(
                                  spacing: 4,
                                  autoScroll: true,
                                  wrapType: WrapType.wrap,
                                  backgroundColor: appColor),
                              optionTextStyle: const TextStyle(fontSize: 16),
                              selectedOptionIcon: const Icon(
                                Icons.check_circle,
                                color: primaryBlack,
                              ),
                              selectedOptionBackgroundColor:
                                  Colors.grey.shade300,
                              selectedOptionTextColor: Colors.blue,
                              dropdownMargin: 2,
                              onOptionRemoved: (index, option) {
                                setState(() {});
                              },
                              optionBuilder: (context, valueItem, isSelected) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(child: Text(valueItem.label)),
                                      isSelected
                                          ? const Icon(Icons.check_circle)
                                          : const Icon(
                                              Icons.radio_button_unchecked)
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                      // tilePadding: EdgeInsets.zero, // remove the default padding
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Status :',
                        style: AppTextStyle.normalRegular12
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      // Active Radio Button
                      Expanded(
                        child: Row(
                          children: [
                            Obx(
                              () => Radio<bool>(
                                value: true,
                                groupValue: controller.status.value,
                                onChanged: (value) {
                                  controller.setStatus(value!);
                                },
                                activeColor: appColor, // Set active color
                              ),
                            ),
                            Text(
                              'Active',
                              style: AppTextStyle.normalRegular12
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            Obx(
                              () => Radio<bool>(
                                value: false,
                                groupValue: controller.status.value,
                                onChanged: (value) {
                                  controller.setStatus(value!);
                                },
                                activeColor: appColor, // Set active color
                              ),
                            ),
                            Text(
                              'Deactive',
                              style: AppTextStyle.normalRegular12
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          PrimaryTextButton(
              title: "Search",
              onPressed: () {
                Get.back();
                controller.refreshPage(context);
                controller.selectedOptionsDepartment
                    .addAll(controller.controllerDepartment.selectedOptions);
                controller.selectedOptionsDesignation
                    .addAll(controller.controllerDesignation.selectedOptions);

                controller.userGetAll(context);
              }),
          height20,
        ],
      ),
    );
  }
}
