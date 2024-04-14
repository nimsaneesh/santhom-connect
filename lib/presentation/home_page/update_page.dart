import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:santhom_connect/core/app_export.dart';
import 'package:santhom_connect/presentation/home_tab_container_page/models/updates_model.dart';

import 'widgets/fortyfive_item_widget.dart';

// ignore_for_file: must_be_immutable
class UpdatePage extends StatelessWidget {
  List<ItemList>? list;
  UpdatePage(this.list);

  @override
  Widget build(BuildContext context) {
    return _buildFortyFive(context, list);
  }

  Widget _buildFortyFive(BuildContext context, List<ItemList>? list) {
    int itemCount = list?.length ?? 0;
    if (itemCount > 4) {
      itemCount = 4;
    }
    return Padding(
      padding: EdgeInsets.only(
        left: 22.h,
        right: 22.h,
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: false,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          ItemList? model = list?[index];
          if (model?.color == "True") {
            return dailyScheduleWidget(context, model);
          } else {
            return eventWidget(context, model);
          }
        },
      ),
    );
  }
}

Widget dailyScheduleWidget(BuildContext context, ItemList? model) {
  return InkWell(
    onTap: (() => {
          NavigatorService.pushNamed(AppRoutes.updatesScreen, arguments: model)
        }),
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 7.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
        gradient: LinearGradient(
          colors: [
            Color(0xFFCEEBFF), // CEEBFF
            Color(0xFFDCDCF7), // DCDCF7
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 15.h,
              top: 10.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model?.heading ?? "",
                  style: CustomTextStyles.titleMediumBluegray90002Medium,
                ),
                SizedBox(height: 3.v),
                SizedBox(
                  width: SizeUtils.width - 170,
                  height: 20,
                  child: Text(
                    model?.subHeading ?? "",
                  ),
                ),
                Row(
                  children: [
                    Opacity(
                      opacity: 0.9,
                      child: Padding(
                        padding: EdgeInsets.only(left: 0.h),
                        child: Text(
                          model?.date ?? "",
                          style: CustomTextStyles.bodySmallBluegray600ab,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.9,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: SizedBox(
                          width: SizeUtils.width / 3,
                          child: Text(
                            model?.heading ?? "",
                            style: CustomTextStyles.bodySmallPoppinsIndigo300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.v),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget eventWidget(BuildContext context, ItemList? model) {
  return InkWell(
    onTap: (() => {
          NavigatorService.pushNamed(AppRoutes.updatesScreen, arguments: model)
        }),
    child: Container(
      height: 80,
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
      ),
      margin: EdgeInsets.only(bottom: 4),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: model?.image,
            height: 70.v,
            width: 72.h,
            radius: BorderRadius.circular(
              12.h,
            ),
            margin: EdgeInsets.symmetric(vertical: 3.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 15.h,
              top: 10.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 9.adaptSize,
                      width: 9.adaptSize,
                      margin: EdgeInsets.only(
                        top: 2.v,
                        bottom: 6.v,
                      ),
                      decoration: BoxDecoration(
                        color: appTheme.indigo300,
                      ),
                    ),
                    Opacity(
                      opacity: 0.9,
                      child: Padding(
                        padding: EdgeInsets.only(left: 9.h),
                        child: Text(
                          model?.date ?? "",
                          style: CustomTextStyles.bodySmallBluegray600ab,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.9,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: SizedBox(
                          width: SizeUtils.width / 3,
                          child: Text(
                            model?.type ?? "",
                            style: CustomTextStyles.bodySmallPoppinsIndigo300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.v),
                Text(
                  model?.heading ?? "",
                  style: CustomTextStyles.titleMediumBluegray90002Medium,
                ),
                SizedBox(
                  width: SizeUtils.width - 170,
                  height: 30,
                  child: Html(
                    data: model?.subHeading ?? "",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
