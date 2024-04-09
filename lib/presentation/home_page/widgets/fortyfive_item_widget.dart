import '../model/bulletin_model.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';

// ignore: must_be_immutable
class FortyfiveItemWidget extends StatelessWidget {
  Lists? model;
  FortyfiveItemWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => {
            NavigatorService.pushNamed(AppRoutes.bulletinDetails,
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
                              model?.item ?? "",
                              style: CustomTextStyles.bodySmallPoppinsIndigo300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.v),
                  Text(
                    model?.subItem ?? "",
                    style: CustomTextStyles.titleMediumBluegray90002Medium,
                  ),
                  SizedBox(height: 4.v),
                  SizedBox(
                    width: SizeUtils.width - 170,
                    child: Text(
                      model?.details ?? "",
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
}
