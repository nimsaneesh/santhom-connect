import '../models/monday_item_model.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';

// ignore: must_be_immutable
class MondayItemWidget extends StatelessWidget {
  MondayItemWidget(
    this.mondayItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  MondayItemModel mondayItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 198.h),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse6,
            height: 33.adaptSize,
            width: 33.adaptSize,
            radius: BorderRadius.circular(
              16.h,
            ),
            margin: EdgeInsets.symmetric(vertical: 2.v),
          ),
          Padding(
            padding: EdgeInsets.only(left: 17.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_akash_mathew".tr,
                  style: theme.textTheme.titleSmall,
                ),
                Text(
                  "msg_valiyaparambil_house".tr,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
