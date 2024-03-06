import '../models/fortynine_item_model.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';

// ignore: must_be_immutable
class FortynineItemWidget extends StatelessWidget {
  FortynineItemWidget(
    this.fortynineItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FortynineItemModel fortynineItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.gradientLightBlueToOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: fortynineItemModelObj?.widget,
                  height: 14.adaptSize,
                  width: 14.adaptSize,
                  margin: EdgeInsets.only(
                    top: 4.v,
                    bottom: 2.v,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7.h),
                  child: Text(
                    fortynineItemModelObj.brainstormWith!,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
          Text(
            fortynineItemModelObj.defineTheProblem!,
            style: CustomTextStyles.bodyMediumManropeBluegray600,
          ),
          SizedBox(height: 26.v),
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: fortynineItemModelObj?.widget1,
                  height: 15.adaptSize,
                  width: 15.adaptSize,
                  margin: EdgeInsets.only(
                    top: 4.v,
                    bottom: 1.v,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Text(
                    fortynineItemModelObj.brainstormWith1!,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 1.v),
          Text(
            fortynineItemModelObj.defineTheProblem1!,
            style: CustomTextStyles.bodyMediumManropeBluegray600,
          ),
        ],
      ),
    );
  }
}
