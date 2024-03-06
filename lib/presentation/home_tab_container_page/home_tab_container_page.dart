import 'package:santhom_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:santhom_connect/widgets/app_bar/appbar_leading_image.dart';
import 'package:santhom_connect/widgets/app_bar/appbar_title_circleimage.dart';
import 'package:santhom_connect/widgets/app_bar/appbar_subtitle.dart';
import 'package:santhom_connect/widgets/app_bar/appbar_title.dart';
import 'package:santhom_connect/widgets/app_bar/appbar_trailing_image.dart';
import 'package:santhom_connect/presentation/home_page/home_page.dart';
import 'models/home_tab_container_model.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';
import 'provider/home_tab_container_provider.dart';

// ignore_for_file: must_be_immutable
class HomeTabContainerPage extends StatefulWidget {
  const HomeTabContainerPage({Key? key})
      : super(
          key: key,
        );

  @override
  HomeTabContainerPageState createState() => HomeTabContainerPageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeTabContainerProvider(),
      child: HomeTabContainerPage(),
    );
  }
}

class HomeTabContainerPageState extends State<HomeTabContainerPage>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray,
          child: Column(
            children: [
              _buildTelevision(context),
              SizedBox(height: 23.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 23.h),
                        child: Text(
                          "lbl_updates".tr,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(height: 2.v),
                      _buildTabview(context),
                      SizedBox(
                        height: 1137.v,
                        child: TabBarView(
                          controller: tabviewController,
                          children: [
                            HomePage.builder(context),
                            HomePage.builder(context),
                            HomePage.builder(context),
                            HomePage.builder(context),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTelevision(BuildContext context) {
    return SizedBox(
      height: 268.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.v),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: fs.Svg(
                    ImageConstant.imgGroup6,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: CustomAppBar(
                leadingWidth: 48.h,
                leading: AppbarLeadingImage(
                  imagePath: ImageConstant.imgTelevision,
                  margin: EdgeInsets.only(
                    left: 24.h,
                    top: 10.v,
                    bottom: 8.v,
                  ),
                ),
                title: Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Row(
                    children: [
                      AppbarTitleCircleimage(
                        imagePath: ImageConstant.imgEllipse2848,
                      ),
                      Container(
                        height: 36.059998.v,
                        width: 100.h,
                        margin: EdgeInsets.only(
                          left: 7.h,
                          top: 1.v,
                        ),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            AppbarSubtitle(
                              text: "lbl_welcome".tr,
                              margin: EdgeInsets.only(
                                left: 1.h,
                                right: 48.h,
                                bottom: 19.v,
                              ),
                            ),
                            AppbarTitle(
                              text: "lbl_basil_thomas".tr,
                              margin: EdgeInsets.only(top: 14.v),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  AppbarTrailingImage(
                    imagePath: ImageConstant.imgDownload11,
                    margin: EdgeInsets.only(
                      left: 20.h,
                      top: 6.v,
                      right: 2.h,
                    ),
                  ),
                  Container(
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    margin: EdgeInsets.fromLTRB(13.h, 7.v, 22.h, 4.v),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgNotification1,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          alignment: Alignment.center,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 8.adaptSize,
                            width: 8.adaptSize,
                            margin: EdgeInsets.fromLTRB(14.h, 2.v, 1.h, 13.v),
                            decoration: BoxDecoration(
                              color: appTheme.pinkA400,
                              borderRadius: BorderRadius.circular(
                                4.h,
                              ),
                              border: Border.all(
                                color: appTheme.whiteA70001,
                                width: 1.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 200.v,
              width: 368.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle9550,
                    height: 200.v,
                    width: 368.h,
                    radius: BorderRadius.circular(
                      10.h,
                    ),
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 26.h,
                        vertical: 17.v,
                      ),
                      decoration: AppDecoration.gradientBlackToBlack.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderBL10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 83.v),
                          Container(
                            width: 312.h,
                            margin: EdgeInsets.only(right: 2.h),
                            child: Text(
                              "msg9".tr,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style:
                                  CustomTextStyles.titleSmallPoppinsWhiteA70001,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 52.v,
      width: 390.h,
      child: TabBar(
        controller: tabviewController,
        isScrollable: true,
        labelColor: appTheme.whiteA70001,
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
        indicatorPadding: EdgeInsets.all(
          8.0.h,
        ),
        indicator: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(
            18.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "lbl_daily_schedule".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_vicar_s_message".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_birthday".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_daily_reading".tr,
            ),
          ),
        ],
      ),
    );
  }
}
