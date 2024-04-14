import 'package:flutter/material.dart';
import '../presentation/bulletin_screen/bulletin_screen.dart';
import '../presentation/bulletin_tab_container_screen/bulletin_tab_container_screen.dart';
import '../presentation/contribution_screen/contribution_screen.dart';
import '../presentation/directory_family_profile_screen/directory_family_profile_screen.dart';
import '../presentation/directory_prayer_group_screen/directory_prayer_group_screen.dart';
import '../presentation/directory_search_results_page/directory_search_results_page.dart';
import '../presentation/downloads_screen/downloads_screen.dart';
import '../presentation/edit_profile_screen/edit_profile_screen.dart';
import '../presentation/home_container_screen/home_container_screen.dart';
import '../presentation/directory_profile_screen/directory_profile_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/profile_page/profile_page.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/updates_screen/update_screen.dart';
import '../presentation/updates_tab_container_page/updates_tab_container_page.dart';
import '../presentation/verify_email_screen/verify_email_screen.dart';
import '../presentation/vicars_screen/vicars_screen.dart';
import '../presentation/vikars_messaage/vikars_message_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

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
  static const String bulletinPage = '/bulletin_page';
  static const String profilePage = '/profile_page';
  static const String updatesPage = '/update_page';
  static const String bulletinDetails = '/bulletin_detail_page';
  static const String downloadsScreen = '/downloads_screen';
  static const String vikarsMessageScreen = '/VikarsMessageScreen';
  static const String contributionScreen = '/contribution_screen';
  static const String verifyEmailScreen = '/verify_email_screen';
  static const String updatesScreen = '/updates_screen';
  static const String vicarsScreen = '/vicars_creen';
  static const String directoryFamilyProfileScreen =
      '/directory_family_profile_screen';
  static const String directoryPrayerGroupScreen =
      '/directory_prayer_group_screen';
  static const String editProfileScreen = '/edit_profile_screen';
  static const String bulletinTabContainerScreen =
      '/bulletin_tab_container_screen';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: SplashScreen.builder,
        loginScreen: LoginScreen.builder,
        verifyEmailScreen: VerifyEmailScreen.builder,
        directoryPrayerGroupScreen: DirectoryPrayerGroupScreen.builder,
        editProfileScreen: EditProfileScreen.builder,
        initialRoute: SplashScreen.builder,
        homeContainerScreen: HomeContainerScreen.builder,
        directoryProfileScreen: DirectoryProfileScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        bulletinTabContainerScreen: BulletinTabContainerScreen.builder,
        profilePage: ProfilePage.builder,
        bulletinDetails: BulletinScreen.builder,
        updatesPage: UpdatesTabContainerPage.builder,
        downloadsScreen: DownloadsScreen.builder,
        updatesScreen: UpdatesScreen.builder,
        contributionScreen: ContributionScreen.builder,
        vikarsMessageScreen: VikarsMessageScreen.builder,
        directoryFamilyProfileScreen: DirectoryFamilyProfileScreen.builder,
        vicarsScreen: VicarsScreen.builder,
      };
}
