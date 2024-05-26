import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:santhom_connect/data/models/detail_model.dart';
import 'package:santhom_connect/utils/utils.dart';

import '../model/bulletin_model.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';

// ignore: must_be_immutable
class FortyfiveItemWidget extends StatelessWidget {
  Lists? model;
  String category;
  FortyfiveItemWidget(this.model, this.category);

  @override
  Widget build(BuildContext context) {
    DetailModelBulletin detail =
        DetailModelBulletin(title: category, model: model);

    return InkWell(
      onTap: (() => {
            NavigatorService.pushNamed(AppRoutes.bulletinDetails,
                arguments: detail)
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
                            child: AutoSizeText("#" + model?.type ?? "",
                                maxLines: 2,
                                style: TextStyle(
                                    color: getColor(model?.type),
                                    fontSize: 10)),
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
                    height: 30,
                    child: AutoSizeText(
                      model?.details ?? "",
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
}
