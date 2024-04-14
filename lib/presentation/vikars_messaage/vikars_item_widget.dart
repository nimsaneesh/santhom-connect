import 'package:auto_size_text/auto_size_text.dart';
import 'package:santhom_connect/presentation/vikars_messaage/models/vikars_model.dart';

import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';

// ignore: must_be_immutable
class VikarsItemWidget extends StatelessWidget {
  VikarsItemWidget(
    this.item, {
    Key? key,
  }) : super(
          key: key,
        );

  VikarsData item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => {
            NavigatorService.pushNamed(
              AppRoutes.vicarsScreen,
              arguments: item
            )
          }),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: appTheme.whiteA70001,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                color: appTheme.black900.withOpacity(0.03),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 16, top: 00, bottom: 00),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: item.image,
                  height: 103.adaptSize,
                  width: 83.adaptSize,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 150,
                  child: Padding(
                    padding: EdgeInsets.only(left: 17.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.subject ?? "",
                          style: theme.textTheme.titleSmall,
                        ),
                        AutoSizeText(
                          item.messageBody ?? "",
                          style: theme.textTheme.bodySmall,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
