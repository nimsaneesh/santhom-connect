import 'package:auto_size_text/auto_size_text.dart';
import 'package:santhom_connect/presentation/vikars_messaage/models/vikars_model.dart';

import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';

import 'models/vikars_list_model.dart';

// ignore: must_be_immutable
class VikarsListItemWidget extends StatelessWidget {
  VikarsListItemWidget(
    this.item, {
    Key? key,
  }) : super(
          key: key,
        );

  VikarsListData item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => {
            // NavigatorService.pushNamed(AppRoutes.organizationDetailScreen,
            //     arguments: item.id)
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
            padding: EdgeInsets.only(left: 16, top: 10, bottom: 10),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: item.photo,
                  personName: item.name,
                  height: 50.adaptSize,
                  width: 50.adaptSize,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 150,
                  child: Padding(
                    padding: EdgeInsets.only(left: 17.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              item.title ?? "",
                              style: theme.textTheme.titleSmall,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              item.name ?? "",
                              style: theme.textTheme.titleSmall,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        AutoSizeText(
                          item.familyName ?? "",
                          style: theme.textTheme.bodySmall,
                          maxLines: 3,
                        ),
                        item.mobile != null
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 4,
                                  ),
                                  AutoSizeText(
                                    item.mobile ?? "",
                                    style: theme.textTheme.bodySmall,
                                    maxLines: 3,
                                  ),
                                ],
                              )
                            : SizedBox(),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "From",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  item.dateOfJoining ?? "",
                                  style: theme.textTheme.titleSmall,
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  "To",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  item.dateOfRelieving == ""
                                      ? "Present"
                                      : item.dateOfRelieving ?? "",
                                  style: theme.textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ],
                        )
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
