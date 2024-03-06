import 'package:santhom_connect/presentation/home_tab_container_page/home_tab_container_page.dart';
import 'package:santhom_connect/presentation/directory_search_results_tab_container_page/directory_search_results_tab_container_page.dart';
import 'package:santhom_connect/widgets/custom_search_view.dart';
import 'package:santhom_connect/presentation/directory_page/directory_page.dart';
import 'package:santhom_connect/widgets/custom_bottom_bar.dart';
import 'models/directory_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';
import 'provider/directory_tab_container_provider.dart';

class DirectoryTabContainerScreen extends StatefulWidget {
  const DirectoryTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  DirectoryTabContainerScreenState createState() =>
      DirectoryTabContainerScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DirectoryTabContainerProvider(),
      child: DirectoryTabContainerScreen(),
    );
  }
}

class DirectoryTabContainerScreenState
    extends State<DirectoryTabContainerScreen> with TickerProviderStateMixin {
  late TabController tabviewController;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 8, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.v),
              Padding(
                padding: EdgeInsets.only(left: 25.h),
                child: Text(
                  "lbl_directory".tr,
                  style: theme.textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 5.v),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 24.h,
                    right: 21.h,
                  ),
                  child: Selector<DirectoryTabContainerProvider,
                      TextEditingController?>(
                    selector: (
                      context,
                      provider,
                    ) =>
                        provider.searchController,
                    builder: (context, searchController, child) {
                      return CustomSearchView(
                        controller: searchController,
                        hintText: "lbl_search_here".tr,
                        alignment: Alignment.center,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 21.v),
              _buildTabview(context),
              Expanded(
                child: SizedBox(
                  height: 622.v,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      DirectoryPage.builder(context),
                      DirectoryPage.builder(context),
                      DirectoryPage.builder(context),
                      DirectoryPage.builder(context),
                      DirectoryPage.builder(context),
                      DirectoryPage.builder(context),
                      DirectoryPage.builder(context),
                      DirectoryPage.builder(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 36.v,
      width: 389.h,
      child: TabBar(
        controller: tabviewController,
        isScrollable: true,
        labelColor: appTheme.whiteA70001,
        unselectedLabelColor: theme.colorScheme.secondaryContainer,
        tabs: [
          Tab(
            child: Text(
              "lbl_family_head".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_people".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_family".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_prayer_group".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_organization".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_entertainment".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_science".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_business".tr,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeTabContainerPage;
      case BottomBarEnum.Directory:
        return AppRoutes.directorySearchResultsTabContainerPage;
      case BottomBarEnum.Bulletin:
        return "/";
      case BottomBarEnum.Updates:
        return "/";
      case BottomBarEnum.Profile:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.homeTabContainerPage:
        return HomeTabContainerPage.builder(context);
      case AppRoutes.directorySearchResultsTabContainerPage:
        return DirectorySearchResultsTabContainerPage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
