import 'package:santhom_connect/presentation/updates_tab_container_page/models/updates_tab_container_model.dart';

import '../../core/app_export.dart';
import 'models/updates_model.dart';
import 'package:flutter/material.dart';
import 'provider/updates_provider.dart';

// ignore_for_file: must_be_immutable
class UpdatesPage extends StatelessWidget {
  List<Lists>? list;

  UpdatesPage(this.list);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildScrollView(context, list),
      ),
    );
  }

  /// Section Widget
  Widget _buildScrollView(BuildContext context, List<Lists>? list) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 16.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.h),
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "lbl_birthday".tr,
                //       style: CustomTextStyles.titleMediumBluegray900,
                //     ),
                //     Text(
                //       "lbl_31_1_24".tr,
                //       style: CustomTextStyles.titleSmallIndigo40001,
                //     ),
                //   ],
                // ),
                _buildFortyFive(context, list)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildFortyFive(BuildContext context, List<Lists>? list) {
  return Padding(
    padding: EdgeInsets.only(
      left: 1.h,
      right: 22.h,
    ),
    child: ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return SizedBox(
          height: 12.v,
        );
      },
      itemCount: list?.length ?? 0,
      itemBuilder: (context, index) {
        Lists? model = list?[index];
        return Container(
          width: 368.h,
          margin: EdgeInsets.symmetric(horizontal: 1.h),
          padding: EdgeInsets.symmetric(
            horizontal: 14.h,
            vertical: 12.v,
          ),
          decoration: AppDecoration.fillWhiteA.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 2.v),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgLocationPin1,
                    height: 12.adaptSize,
                    width: 12.adaptSize,
                    margin: EdgeInsets.only(
                      top: 2.v,
                      bottom: 5.v,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6.h),
                    child: Text(
                      "msg_valiyaparambil_house".tr,
                      style: CustomTextStyles.bodyMediumBluegray600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.v),
              Text(
                "msg_thomas_jacob_s_birthday".tr,
                style: theme.textTheme.titleSmall,
              ),
            ],
          ),
        );
      },
    ),
  );
}
