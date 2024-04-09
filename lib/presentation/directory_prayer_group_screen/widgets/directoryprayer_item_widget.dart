import 'package:santhom_connect/core/app_export.dart';
import 'package:santhom_connect/widgets/custom_image_view.dart';

import '../models/directoryprayer_item_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DirectoryprayerItemWidget extends StatelessWidget {
  DirectoryprayerItemWidget(
    this.directoryprayerItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  DirectoryprayerItemModel directoryprayerItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        children: [
          CustomImageView(
            imagePath: directoryprayerItemModelObj?.aakashMathew,
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
                  directoryprayerItemModelObj.aakashMathew1!,
                  style: theme.textTheme.titleSmall,
                ),
                Text(
                  directoryprayerItemModelObj.valiyaparambilHouse!,
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