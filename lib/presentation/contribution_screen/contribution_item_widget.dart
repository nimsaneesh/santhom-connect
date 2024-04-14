import 'package:santhom_connect/presentation/contribution_screen/models/contribution_model.dart';
import 'package:santhom_connect/presentation/vikars_messaage/models/vikars_model.dart';

import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';

// ignore: must_be_immutable
class ContributionItemWidget extends StatelessWidget {
  ContributionItemWidget(
    this.item, {
    Key? key,
  }) : super(
          key: key,
        );

  Payments item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => {
            // NavigatorService.pushNamed(
            //   AppRoutes.directoryProfileScreen,
            // )
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
            padding:
                EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 20.0),
            child: Row(
              children: [
                CustomImageView(
                    imagePath: ImageConstant.oval_copy,
                    height: 9.v,
                    width: 9.h,
                    margin: EdgeInsets.only(bottom: 2.v)),
                SizedBox(
                  width: 18,
                ),
                Text(
                  item.date ?? "",
                  style: TextStyle(
                    color: Color(0XFF565656),
                    fontSize: 13.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  item.purpose ?? "",
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 15.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(
                  "₹" + item.amount.toString() ?? "",
                  style: TextStyle(
                    color: Color(0XFF0095FF),
                    fontSize: 16.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w800,
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
