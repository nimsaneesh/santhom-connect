import 'package:flutter/material.dart';

class TabBodyDetailsWidget extends StatelessWidget {
  TabBodyDetailsWidget(
    this.tabViewChildrenDir,
    this.tabviewController, {
    Key? key,
  }) : super(key: key);
  final List<Widget>? tabViewChildrenDir;
  final TabController? tabviewController;
  @override
  Widget build(BuildContext context) {
    if (tabViewChildrenDir == null || tabviewController == null) {
      return SizedBox();
    }
    return SizedBox(
      height: 430,
      child: TabBarView(
          controller: tabviewController, children: tabViewChildrenDir ?? []),
    );
  }
}
