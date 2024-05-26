import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:santhom_connect/presentation/home_page/update_page.dart';
import 'package:santhom_connect/presentation/widgets/tab_body_widget.dart';
import 'package:santhom_connect/utils/extensions.dart';
import 'package:santhom_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:santhom_connect/widgets/app_bar/appbar_leading_image.dart';
import 'package:santhom_connect/widgets/app_bar/appbar_title_circleimage.dart';
import 'package:santhom_connect/widgets/app_bar/appbar_subtitle.dart';
import 'package:santhom_connect/widgets/app_bar/appbar_title.dart';
import 'package:santhom_connect/widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/circular_loader.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';
import '../home_page/bulletin_page.dart';
import '../widgets/tab_body_details_widget.dart';
import '../widgets/tab_item_widget.dart';
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
  late TabController tabviewControllerBulletin;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeTabContainerProvider>(context, listen: false).getHome();
    });
  }

  Widget _buildOctober(
    BuildContext context,
    HomeTabContainerProvider provider,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: fs.Svg(
              ImageConstant.imgGroup162496,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 46.adaptSize,
              width: 46.adaptSize,
              decoration: AppDecoration.outline.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder43,
              ),
              child: CustomImageView(
                imagePath: provider.image,
                height: 46.adaptSize,
                width: 46.adaptSize,
                border: Border.all(color: Colors.white, width: 1),
                radius: BorderRadius.circular(
                  38.h,
                ),
                alignment: Alignment.center,
              ),
            ),
            SizedBox(width: 7.v),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  provider.familyName.capitalize() ?? "",
                  style: CustomTextStyles.titleMediumPoppinsWhiteA700,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Family Head : ",
                      style: CustomTextStyles.bodyPoppinsffffc885,
                    ),
                    Text(
                      provider.familyHeadName.capitalize() ?? "",
                      style: CustomTextStyles.titleSmallPoppinsffffc885,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  onTapArrowLeft(BuildContext context) {
    _scaffoldKey.currentState?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeTabContainerProvider>(
        builder: (context, provider, child) {
      List<Widget>? tabViewChildren = [];
      List<Widget>? tabItem = [];
      List<Widget>? tabViewChildrenDir = [];
      List<Widget>? tabItemDir = [];

      tabItemDir = provider.directory_respo.data?.map((data) {
        return TabItemWidget(data.category ?? "");
      }).toList();

      tabViewChildrenDir = provider.directory_respo.data?.map((data) {
        return UpdatePage(data.list, data.category);
      }).toList();

      tabItem = provider.bulletin_respo.data?.map((data) {
        return TabItemWidget(data.category ?? "");
      }).toList();
      tabViewChildren = provider.bulletin_respo.data?.map((data) {
        return BulletinPage(data.list, data.category);
      }).toList();

      tabviewController = TabController(
          length: provider.directory_respo.data?.length ?? 0, vsync: this);
      tabviewControllerBulletin = TabController(
          length: provider.bulletin_respo.data?.length ?? 0, vsync: this);
      return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: true,
        drawer: Drawer(
          elevation: 0,
          clipBehavior: Clip.hardEdge,
          backgroundColor: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppbarLeadingIconbutton(
                                imagePath: ImageConstant.imgArrowLeft,
                                onTap: () {
                                  onTapArrowLeft(context);
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            AppbarTitle(
                              text: "Menu",
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20, bottom: 1),
                      child: _buildOctober(context, provider),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Container(
                          child: Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.vicars_message,
                            height: 24.v,
                            width: 24.h,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Vicar’s Messages',
                            style: CustomTextStyles.sideNavText,
                          ),
                        ],
                      )),
                      onTap: () {
                        _scaffoldKey.currentState?.closeDrawer();
                        NavigatorService.pushNamed(
                            AppRoutes.vikarsMessageScreen);
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: Container(
                          child: Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.contributions,
                            height: 24.v,
                            width: 24.h,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Organization',
                            style: CustomTextStyles.sideNavText,
                          ),
                        ],
                      )),
                      onTap: () {
                        _scaffoldKey.currentState?.closeDrawer();
                        NavigatorService.pushNamed(
                            AppRoutes.organizationScreen);
                      },
                    ),
                    ListTile(
                      title: Container(
                          child: Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.priest,
                            height: 24.v,
                            width: 24.h,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Vicar’s List',
                            style: CustomTextStyles.sideNavText,
                          ),
                        ],
                      )),
                      onTap: () {
                        _scaffoldKey.currentState?.closeDrawer();

                        NavigatorService.pushNamed(AppRoutes.vikarsListScreen);
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: Container(
                          child: Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.Download,
                            height: 24.v,
                            width: 24.h,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Downloads',
                            style: CustomTextStyles.sideNavText,
                          ),
                        ],
                      )),
                      onTap: () {
                        _scaffoldKey.currentState?.closeDrawer();
                        NavigatorService.pushNamed(AppRoutes.downloadsScreen);
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: Container(
                          child: Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.contributions,
                            height: 24.v,
                            width: 24.h,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'My Contributions',
                            style: CustomTextStyles.sideNavText,
                          ),
                        ],
                      )),
                      onTap: () {
                        _scaffoldKey.currentState?.closeDrawer();
                        NavigatorService.pushNamed(
                            AppRoutes.contributionScreen);
                      },
                    ),
                    ListTile(
                      title: Container(
                          child: Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.notification,
                            height: 24.v,
                            width: 24.h,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Notifications',
                            style: CustomTextStyles.sideNavText,
                          ),
                        ],
                      )),
                      onTap: () {
                        _scaffoldKey.currentState?.closeDrawer();
                        NavigatorService.pushNamed(
                            AppRoutes.notificationScreen);

                        // Update the state of the app.
                        // ...
                      },
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset(ImageConstant.logo_drawer)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Santhom Connect',
                      style: TextStyle(
                        color: Color(0XFF000000),
                        fontSize: 16.fSize,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'App version 1.0.12',
                      style: TextStyle(
                        color: Color(0XFF000000),
                        fontSize: 12.fSize,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: AppDecoration.fillGray,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        buildBackground(context),
                        _buildToolBar(
                            context, provider.personName, provider.image),
                        Column(
                          children: [
                            SizedBox(height: 40.v),
                            _buildTelevision(context, provider),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.v),
                    TabBodyWidget(tabItemDir, tabviewController),
                    TabBodyDetailsWidget(tabViewChildrenDir, tabviewController),
                    TabBodyWidget(tabItem, tabviewControllerBulletin),
                    TabBodyDetailsWidget(
                        tabViewChildren, tabviewControllerBulletin),
                  ],
                ),
              ),
            ),
            Selector<HomeTabContainerProvider, bool>(
              selector: (context, provider) => provider.isLoading,
              builder: (context, value, child) {
                return value ? CircularLoader() : SizedBox();
              },
            ),
          ],
        ),
      );
    });
  }

  Widget _buildTelevision(
      BuildContext context, HomeTabContainerProvider provider) {
    return SizedBox(
      height: 268.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
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
                      // padding: EdgeInsets.symmetric(
                      //   horizontal: 26.h,
                      //   vertical: 17.v,
                      // ),
                      height: 200.v,
                      width: 368.h,
                      decoration: AppDecoration.gradientBlackToBlack.copyWith(
                        borderRadius: BorderRadius.circular(
                          10.h,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 312.h,
                            margin: EdgeInsets.only(right: 2.h),
                            child: Column(
                              children: [
                                Text(
                                  provider.directory_respo.dailyDigest
                                          ?.heading ??
                                      "",
                                  maxLines: 8,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyles
                                      .titleSmallPoppinsWhiteA70001,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  provider.directory_respo.dailyDigest
                                          ?.subHeading ??
                                      "",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyles
                                      .titleSmallPoppinsWhiteA700012,
                                ),
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
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildToolBar(BuildContext context, String personName, String image) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.v),
            child: CustomAppBar(
              leadingWidth: 48.h,
              leading: AppbarLeadingImage(
                onTap: () => {_scaffoldKey.currentState?.openDrawer()},
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
                      imagePath: image,
                    ),
                    Container(
                      height: 36.059998.v,
                      margin: EdgeInsets.only(
                        left: 7.h,
                        top: 1.v,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_welcome".tr,
                            style: CustomTextStyles.titleSmallPoppinsffffffff12,
                          ),
                          Text(
                            personName.capitalize(),
                            style: CustomTextStyles.titleSmallPoppinsffffffff16,
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
                  onTap: () => onTapScreenTitle(AppRoutes.downloadsScreen),
                  margin: EdgeInsets.only(
                    left: 20.h,
                    top: 6.v,
                  ),
                ),
                Container(
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.fromLTRB(0, 7.v, 22.h, 4.v),
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
      ],
    );
  }

  Widget buildBackground(BuildContext context) {
    return SizedBox(
      height: 218.v,
      width: double.maxFinite,
      child: Align(
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
        ),
      ),
    );
  }

  void onTapScreenTitle(String routeName) {
    print("object");
    print(routeName);
    NavigatorService.pushNamed(routeName);
  }
}
