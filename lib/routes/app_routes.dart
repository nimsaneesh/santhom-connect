import 'package:flutter/material.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/home_container_screen/home_container_screen.dart';
import '../presentation/directory_tab_container_screen/directory_tab_container_screen.dart';
import '../presentation/directory_profile_screen/directory_profile_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String loginScreen = '/login_screen';

  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String homeTabContainerPage = '/home_tab_container_page';

  static const String directoryPage = '/directory_page';

  static const String directoryTabContainerScreen =
      '/directory_tab_container_screen';

  static const String directorySearchResultsPage =
      '/directory_search_results_page';

  static const String directorySearchResultsTabContainerPage =
      '/directory_search_results_tab_container_page';

  static const String directoryProfileScreen = '/directory_profile_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        loginScreen: LoginScreen.builder,
        homeContainerScreen: HomeContainerScreen.builder,
        directoryTabContainerScreen: DirectoryTabContainerScreen.builder,
        directoryProfileScreen: DirectoryProfileScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: LoginScreen.builder
      };
}
