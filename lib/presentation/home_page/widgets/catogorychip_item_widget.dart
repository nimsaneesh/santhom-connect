import '../models/catogorychip_item_model.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';

// ignore: must_be_immutable
class CatogorychipItemWidget extends StatelessWidget {
  CatogorychipItemWidget(
    this.catogorychipItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  CatogorychipItemModel catogorychipItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46.h,
      margin: EdgeInsets.only(left: 10.h),
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 7.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Text(
        catogorychipItemModelObj.catogoryChip!,
        style: CustomTextStyles.bodyMediumWhiteA70001,
      ),
    );
  }
}
