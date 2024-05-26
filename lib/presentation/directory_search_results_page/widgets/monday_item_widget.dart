import '../../home_page/model/directory_model.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';

// ignore: must_be_immutable
class MondayItemWidget extends StatelessWidget {
  MondayItemWidget(
    this.item, {
    Key? key,
  }) : super(
          key: key,
        );

  Lists item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => {
            if (item.type == "Families")
              {
                NavigatorService.pushNamed(
                    AppRoutes.directoryFamilyProfileScreen,
                    arguments: item.id.toString()),
              }
            else if (item.type == "Prayer Groups")
              {
                NavigatorService.pushNamed(AppRoutes.directoryPrayerGroupScreen,
                    arguments: item.id.toString()),
              }
            else if (item.type == "Organizations")
              {
                // NavigatorService.pushNamed(AppRoutes.organizationDetailScreen,
                //     arguments: item.id),
              }
            else
              {
                NavigatorService.pushNamed(AppRoutes.directoryProfileScreen,
                    arguments: item.id.toString())
              }
          }),
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 20, top: 0, bottom: 10),
          child: Column(
            children: [
              Row(
                children: [
                  CustomImageView(
                    imagePath: item.image ?? ImageConstant.imageNotFound,
                    height: 40.adaptSize,
                    width: 40.adaptSize,
                    radius: BorderRadius.circular(
                      50.h,
                    ),
                    margin: EdgeInsets.symmetric(vertical: 2.v),
                    personName: item.item,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 17.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.item ?? "",
                          style: theme.textTheme.titleSmall,
                        ),
                        Text(
                          item.subItem?.toString() ?? "",
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 20),
                child: Column(
                  children: [
                    Divider(
                      height: 2,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
