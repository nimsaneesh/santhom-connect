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
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: SizeUtils.width,
          child: Column(
            children: [
              SizedBox(height: 16.v),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(left: 23.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.v),
                      _buildFortyFive(context, list),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFortyFive(BuildContext context, List<ItemList>? list) {
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
          ItemList? model = list?[index];
          return InkWell(
            onTap: (() => {
                  NavigatorService.pushNamed(AppRoutes.updatesScreen,
                      arguments: model)
                }),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.h,
                vertical: 7.v,
              ),
              decoration: AppDecoration.fillWhiteA.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder16,
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 70.v,
                    width: 72.h,
                    child: CustomImageView(
                      imagePath: model?.image,
                      height: 70.v,
                      width: 72.h,
                      radius: BorderRadius.circular(
                        12.h,
                      ),
                      margin: EdgeInsets.symmetric(vertical: 3.v),
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
                                  style:
                                      CustomTextStyles.bodySmallBluegray600ab,
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
                                    style: CustomTextStyles
                                        .bodySmallPoppinsIndigo300,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.v),
                        Text(
                          model?.heading ?? "",
                          style:
                              CustomTextStyles.titleMediumBluegray90002Medium,
                        ),
                        SizedBox(height: 4.v),
                        SizedBox(
                          width: SizeUtils.width - 170,
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
        },
      ),
    );
  }
}
