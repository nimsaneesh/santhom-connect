import 'package:santhom_connect/presentation/bulletin_tab_container_screen/bulletin_tab_container_screen.dart';
import 'package:santhom_connect/presentation/home_tab_container_page/home_tab_container_page.dart';
import 'package:santhom_connect/presentation/directory_search_results_tab_container_page/directory_search_results_tab_container_page.dart';
import 'package:santhom_connect/presentation/profile_page/profile_page.dart';
import 'package:santhom_connect/presentation/updates_tab_container_page/updates_tab_container_page.dart';
import 'package:santhom_connect/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';
import '../directory_profile_screen/directory_profile_screen.dart';
import '../directory_search_results_page/directory_search_results_page.dart';
import 'provider/home_container_provider.dart';

class HomeContainerScreen extends StatefulWidget {
  const HomeContainerScreen({Key? key}) : super(key: key);

  @override
  HomeContainerScreenState createState() => HomeContainerScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeContainerProvider(),
        child: HomeContainerScreen());
  }
}

// ignore_for_file: must_be_immutable
class HomeContainerScreenState extends State<HomeContainerScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          
          body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.homeTabContainerPage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(context, routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeTabContainerPage;
      case BottomBarEnum.Directory:
        return AppRoutes.directorySearchResultsTabContainerPage;
      case BottomBarEnum.Bulletin:
        return AppRoutes.bulletinTabContainerScreen;
      case BottomBarEnum.Updates:
        return AppRoutes.updatesPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profilePage;
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
      case AppRoutes.bulletinTabContainerScreen:
        return BulletinTabContainerScreen.builder(context);
      case AppRoutes.updatesPage:
        return UpdatesTabContainerPage.builder(context);
      case AppRoutes.profilePage:
        return ProfilePage.builder(context);

      default:
        return DefaultWidget();
    }
  }
}
