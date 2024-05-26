import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:santhom_connect/core/app_export.dart';
import 'package:santhom_connect/data/models/detail_model.dart';
import 'package:santhom_connect/presentation/home_tab_container_page/models/updates_model.dart';
import 'package:santhom_connect/utils/utils.dart';

import 'widgets/fortyfive_item_widget.dart';

// ignore_for_file: must_be_immutable
class UpdatePage extends StatelessWidget {
  List<ItemList>? list;
  String? category;
  UpdatePage(this.list, this.category);

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
            // if (model?.type == "True") {
            //   return eventWidget(context, model, category);
            // } else {
              return eventOnlyWidget(context, model, category);
            // }
          }
        },
      ),
    );
  }
}

Widget dailyScheduleWidget(BuildContext context, ItemList? model) {
  DetailModel items = DetailModel(title: "Daily Schedule" ?? "", model: model);

  return InkWell(
    onTap: (() => {
          NavigatorService.pushNamed(AppRoutes.updatesScreen, arguments: items)
        }),
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 7.v,
      ),
      margin: EdgeInsets.only(bottom: 4),
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

Widget eventWidget(BuildContext context, ItemList? model, String? category) {
  DetailModel items = DetailModel(title: category ?? "", model: model);

  return InkWell(
    onTap: (() => {
          NavigatorService.pushNamed(AppRoutes.updatesScreen, arguments: items)
        }),
    child: Container(
      height: 92,
      margin: EdgeInsets.only(bottom: 4),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomImageView(
                            imagePath: getImage(category),
                            height: 10.v,
                            width: 10.h,
                            margin: EdgeInsets.only(bottom: 2.v)),
                        Opacity(
                          opacity: 0.9,
                          child: Padding(
                            padding: EdgeInsets.only(left: 9.h),
                            child: Text(
                              model?.type ?? "",
                              style: CustomTextStyles.titleMediumGray14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.v),
                    Text(
                      model?.heading ?? "",
                      style: CustomTextStyles.titleMediumBlackMed15,
                    ),
                    SizedBox(height: 4.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.oval_copy,
                          height: 10.v,
                          width: 10.h,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          model?.date ?? "",
                          style:
                              CustomTextStyles.titleMediumBluegray90002Medium,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget eventOnlyWidget(
    BuildContext context, ItemList? model, String? category) {
  DetailModel items = DetailModel(title: category ?? "", model: model);

  return InkWell(
    onTap: (() => {
          NavigatorService.pushNamed(AppRoutes.updatesScreen, arguments: items)
        }),
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 7.v,
      ),
      margin: EdgeInsets.only(bottom: 5),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: CustomImageView(
              imagePath: model?.image,
              height: 70.v,
              width: 72.h,
              fit: BoxFit.fitHeight,
            ),
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
                    CustomImageView(
                        imagePath: ImageConstant.oval_download,
                        height: 10.v,
                        width: 10.h,
                        color: getColor(model?.type),
                        margin: EdgeInsets.only(bottom: 2.v)),
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
                          width: SizeUtils.width / 3.5,
                          child: AutoSizeText("#" + model!.type!.toString(),
                              maxLines: 2,
                              style: TextStyle(
                                  color: getColor(model.type), fontSize: 10)),
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
                SizedBox(height: 4.v),
                SizedBox(
                  width: SizeUtils.width - 170,
                  height: 30,
                  child: AutoSizeText(
                    model?.subHeading ?? "",
                    maxLines: 2,
                    style: CustomTextStyles.bodyMediumManropeBluegray600_1,
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
