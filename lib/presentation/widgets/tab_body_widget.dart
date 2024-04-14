import 'package:flutter/material.dart';
import 'package:santhom_connect/core/utils/size_utils.dart';

import '../../theme/theme_helper.dart';
import '../home_tab_container_page/home_tab_container_page.dart';
import 'curved_decoration.dart';

class TabBodyWidget extends StatelessWidget {
  TabBodyWidget(
    this.tabItemDir,
    this.tabviewController, {
    Key? key,
  }) : super(key: key);
  List<Widget>? tabItemDir;
  TabController? tabviewController;
  @override
  Widget build(BuildContext context) {
    if (tabItemDir == null || tabviewController == null) {
      return SizedBox();
    }
    return Padding(
      padding: EdgeInsets.only(left: 20.h),
      child: Container(
        height: 52.h,
        decoration: CurvedDecoration(color: Colors.white),
        child: TabBar(
            controller: tabviewController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            labelColor: appTheme.whiteA70001,
            dividerColor: Colors.transparent,
            labelStyle: TextStyle(
              fontSize: 14.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
            unselectedLabelColor: theme.colorScheme.secondaryContainer,
            unselectedLabelStyle: TextStyle(
              fontSize: 14.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
            indicatorPadding: EdgeInsets.only(top: 3.0.h, bottom: 3.0.h),
            indicator: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(
                100,
              ),
            ),
            tabs: tabItemDir ?? []),
      ),
    );
  }
}
