import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:santhom_connect/presentation/home_page/update_page.dart';
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
                imagePath: ImageConstant.imgEllipse2851,
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
              children: [
                Text(
                  provider.familyName ?? "",
                  style: CustomTextStyles.titleMediumPoppinsWhiteA700,
                ),
                Text(
                  provider.familyHeadName ?? "",
                  style: CustomTextStyles.titleSmallPoppinsffffc885,
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
    return SafeArea(
      child: Consumer<HomeTabContainerProvider>(
          builder: (context, provider, child) {
        List<Widget>? tabViewChildren = [];
        List<Widget>? tabItem = [];
        tabItem = provider.bulletin_respo.data?.map((data) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Tab(
              child: Text(data.category ?? ""),
            ),
          );
        }).toList();

        tabViewChildren = provider.bulletin_respo.data?.map((data) {
          return BulletinPage(data.list);
        }).toList();

        List<Widget>? tabViewChildrenDir = [];
        List<Widget>? tabItemDir = [];
        tabItemDir = provider.directory_respo.data?.map((data) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Tab(
              child: Text(data.category ?? ""),
            ),
          );
        }).toList();

        tabViewChildrenDir = provider.directory_respo.data?.map((data) {
          return UpdatePage(data.list);
        }).toList();

        tabviewController = TabController(
            length: provider.directory_respo.data?.length ?? 0, vsync: this);

        tabviewControllerBulletin = TabController(
            length: provider.bulletin_respo.data?.length ?? 0, vsync: this);

        return Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
            elevation: 0,
            backgroundColor: Colors.white,
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    // Important: Remove any padding from the ListView.
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
                            left: 20.0, right: 20.0, top: 20, bottom: 16),
                        child: _buildOctober(context, provider),
                      ),
                      ListTile(
                        title: Container(
                            child: Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgTelephone,
                              height: 14.v,
                              width: 14.h,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Vicar’s Messages'),
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
                              imagePath: ImageConstant.imgTelephone,
                              height: 14.v,
                              width: 14.h,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Downloads'),
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
                              imagePath: ImageConstant.imgTelephone,
                              height: 14.v,
                              width: 14.h,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('My Contributions'),
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
                              imagePath: ImageConstant.imgTelephone,
                              height: 14.v,
                              width: 14.h,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Notifications'),
                          ],
                        )),
                        onTap: () {
                          _scaffoldKey.currentState?.closeDrawer();
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
                width: double.maxFinite,
                decoration: AppDecoration.fillGray,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          buildBackground(context),
                          _buildToolBar(context, provider.personName),
                          Column(
                            children: [
                              SizedBox(height: 10.v),
                              _buildTelevision(context, provider),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.v),
                      Padding(
                        padding: EdgeInsets.only(left: 20.h),
                        child: Text(
                          "lbl_updates".tr,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(height: 2.v),
                      _buildHomeUpdate(context, tabItemDir),
                      SizedBox(
                        height: 537.v,
                        child: TabBarView(
                            controller: tabviewController,
                            children: tabViewChildrenDir ?? []),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.h),
                        child: Text(
                          "lbl_bulletin".tr,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(height: 2.v),
                      _buildBulletin(context, tabItem),
                      SizedBox(
                        height: 337.v,
                        child: TabBarView(
                          controller: tabviewControllerBulletin,
                          children: tabViewChildren ?? [],
                        ),
                      ),
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
      }),
    );
  }

  Widget _buildBulletin(BuildContext context, List<Widget>? tabItem) {
    return Padding(
      padding: const EdgeInsets.only(left: 34.0),
      child: Container(
        height: 52.v,
        decoration: CurvedDecoration(color: Colors.white),
        child: TabBar(
          controller: tabviewControllerBulletin,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
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
          indicatorPadding: EdgeInsets.only(
              left: 0.0.h, right: 1.0.h, top: 3.0.h, bottom: 3.0.h),
          indicator: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(
              18.h,
            ),
          ),
          tabs: tabItem ?? [],
        ),
      ),
    );
  }

  /// Section Widget
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
                        children: [
                          SizedBox(height: 83.v),
                          Container(
                            width: 312.h,
                            margin: EdgeInsets.only(right: 2.h),
                            child: Text(
                              provider.directory_respo.dailyDigest?.heading ??
                                  "",
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
  Widget _buildToolBar(BuildContext context, String personName) {
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
                      imagePath: ImageConstant.imgEllipse2848,
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

  /// Section Widget
  Widget _buildHomeUpdate(BuildContext context, List<Widget>? tabItemDir) {
    return Padding(
      padding: EdgeInsets.only(left: 20.h),
      child: Container(
        height: 60.h,
        decoration: CurvedDecoration(color: Colors.white),
        child: TabBar(
            controller: tabviewController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            labelColor: appTheme.whiteA70001,
            indicatorWeight: 0,
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
            indicatorPadding: EdgeInsets.only(
                left: 0.0.h, right: 1.0.h, top: 3.0.h, bottom: 3.0.h),
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

class CurvedDecoration extends BoxDecoration {
  CurvedDecoration({Color? color})
      : super(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), // Adjust the radius as needed
            bottomLeft: Radius.circular(25), // Adjust the radius as needed
          ),
        );
}
