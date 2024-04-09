import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';

class CustomBottomBar extends StatefulWidget {
  final Function(BottomBarEnum)? onChanged;

  CustomBottomBar({this.onChanged});

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;
  final List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavHome,
      activeIcon: ImageConstant.imgNavHome,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavDirectory,
      activeIcon: ImageConstant.imgNavDirectory,
      title: "lbl_directory".tr,
      type: BottomBarEnum.Directory,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavBulletin,
      activeIcon: ImageConstant.imgNavBulletin,
      title: "lbl_bulletin".tr,
      type: BottomBarEnum.Bulletin,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavUpdates,
      activeIcon: ImageConstant.imgNavUpdates,
      title: "Calender",
      type: BottomBarEnum.Updates,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavProfile,
      activeIcon: ImageConstant.imgNavProfile,
      title: "lbl_profile".tr,
      type: BottomBarEnum.Profile,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78.v,
      decoration: BoxDecoration(
        color: appTheme.whiteA70001,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.h),
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.03),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(0, -10),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: _buildIcon(
                bottomMenuList[index].icon, bottomMenuList[index].title),
            activeIcon: _buildIcon(
                bottomMenuList[index].activeIcon, bottomMenuList[index].title,
                isActive: true),
            label: '',
          );
        }),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          widget.onChanged?.call(bottomMenuList[index].type);
        },
      ),
    );
  }

  Widget _buildIcon(String imagePath, String? title, {bool isActive = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: imagePath,
          height: isActive ? 21.v : 19.v,
          width: isActive ? 23.h : 17.h,
          color: isActive ? appTheme.indigo400 : appTheme.gray400,
        ),
        Padding(
          padding: EdgeInsets.only(top: isActive ? 5.v : 7.v),
          child: Text(
            title ?? "",
            style: isActive
                ? CustomTextStyles.bodySmallGray60001
                    .copyWith(color: appTheme.blue700)
                : CustomTextStyles.bodySmallGray60001
                    .copyWith(color: appTheme.gray60001),
          ),
        ),
      ],
    );
  }
}

enum BottomBarEnum {
  Home,
  Directory,
  Bulletin,
  Updates,
  Profile,
}

class BottomMenuModel {
  final String icon;
  final String activeIcon;
  final String? title;
  final BottomBarEnum type;

  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
