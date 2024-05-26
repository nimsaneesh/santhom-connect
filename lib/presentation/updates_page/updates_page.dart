import 'package:auto_size_text/auto_size_text.dart';
import 'package:santhom_connect/presentation/updates_tab_container_page/models/updates_tab_container_model.dart';
import 'package:santhom_connect/utils/utils.dart';

import '../../core/app_export.dart';
import 'models/updates_model.dart';
import 'package:flutter/material.dart';
import 'provider/updates_provider.dart';

// ignore_for_file: must_be_immutable
class UpdatesPage extends StatelessWidget {
  List<EventList>? list;
  String? type;

  UpdatesPage(this.list, String? type);
  @override
  Widget build(BuildContext context) {
    return _buildScrollView(context, list, type);
  }

  /// Section Widget
  Widget _buildScrollView(
      BuildContext context, List<EventList>? list, String? type) {
    return _buildFortyFive(context, list, type);
  }
}

Widget _buildFortyFive(
    BuildContext context, List<EventList>? list, String? type) {
  return Padding(
    padding: EdgeInsets.only(
      left: 22.h,
      right: 22.h,
    ),
    child: ListView.separated(
      // physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return SizedBox(
          height: 10.v,
        );
      },
      itemCount: list?.length ?? 0,
      itemBuilder: (context, index) {
        EventList? model = list?[index];
        return InkWell(
          onTap: (() => {
                // NavigatorService.pushNamed(AppRoutes.bulletinDetails,
                //     arguments: detail)
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
                              color: getColor(model?.heading),
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
                          style:
                              CustomTextStyles.bodyMediumManropeBluegray600_1,
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
