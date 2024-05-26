import 'package:auto_size_text/auto_size_text.dart';
import 'package:santhom_connect/presentation/vikars_messaage/models/vikars_model.dart';

import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';

import 'models/organization_model.dart';

// ignore: must_be_immutable
class OrganizationItemWidget extends StatelessWidget {
  OrganizationItemWidget(
    this.item, {
    Key? key,
  }) : super(
          key: key,
        );

  OrganizationData item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => {
            NavigatorService.pushNamed(AppRoutes.organizationDetailScreen,
                arguments: item.id)
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
                  imagePath: null,
                  personName: item.organizationName,
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
                        Text(
                          item.organizationName ?? "",
                          style: theme.textTheme.titleSmall,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            AutoSizeText(
                              "Coordinator : ",
                              style: theme.textTheme.bodySmall,
                              maxLines: 3,
                            ),
                            AutoSizeText(
                              item.coordinator ?? "",
                              style: theme.textTheme.bodySmall,
                              maxLines: 3,
                            ),
                          ],
                        ),
                        item.coordinatorPhoneNumber != null
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 4,
                                  ),
                                  AutoSizeText(
                                    item.coordinatorPhoneNumber ?? "",
                                    style: theme.textTheme.bodySmall,
                                    maxLines: 3,
                                  ),
                                ],
                              )
                            : SizedBox(),
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
