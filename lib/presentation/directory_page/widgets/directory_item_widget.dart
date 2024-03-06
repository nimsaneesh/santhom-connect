import '../models/directory_item_model.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';

// ignore: must_be_immutable
class DirectoryItemWidget extends StatelessWidget {
  DirectoryItemWidget(
    this.directoryItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  DirectoryItemModel directoryItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomImageView(
          imagePath: directoryItemModelObj?.aakashMathew,
          height: 33.adaptSize,
          width: 33.adaptSize,
          radius: BorderRadius.circular(
            16.h,
          ),
          margin: EdgeInsets.symmetric(vertical: 2.v),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 17.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  directoryItemModelObj.aakashMathew1!,
                  style: theme.textTheme.titleSmall,
                ),
                Text(
                  directoryItemModelObj.valiyaparambilHouse!,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
