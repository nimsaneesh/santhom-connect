import 'package:santhom_connect/widgets/custom_search_view.dart';
import 'package:santhom_connect/presentation/directory_search_results_page/directory_search_results_page.dart';
import 'models/directory_search_results_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';
import 'provider/directory_search_results_tab_container_provider.dart';

// ignore_for_file: must_be_immutable
class DirectorySearchResultsTabContainerPage extends StatefulWidget {
  const DirectorySearchResultsTabContainerPage({Key? key})
      : super(
          key: key,
        );

  @override
  DirectorySearchResultsTabContainerPageState createState() =>
      DirectorySearchResultsTabContainerPageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DirectorySearchResultsTabContainerProvider(),
      child: DirectorySearchResultsTabContainerPage(),
    );
  }
}

class DirectorySearchResultsTabContainerPageState
    extends State<DirectorySearchResultsTabContainerPage>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 9, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray,
          child: Column(
            children: [
              SizedBox(height: 16.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 25.h),
                  child: Text(
                    "lbl_directory".tr,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
              ),
              SizedBox(height: 5.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 24.h,
                  right: 21.h,
                ),
                child: Selector<DirectorySearchResultsTabContainerProvider,
                    TextEditingController?>(
                  selector: (
                    context,
                    provider,
                  ) =>
                      provider.searchController,
                  builder: (context, searchController, child) {
                    return CustomSearchView(
                      controller: searchController,
                      hintText: "lbl_ak".tr,
                    );
                  },
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
                      DirectorySearchResultsPage.builder(context),
                      DirectorySearchResultsPage.builder(context),
                      DirectorySearchResultsPage.builder(context),
                      DirectorySearchResultsPage.builder(context),
                      DirectorySearchResultsPage.builder(context),
                      DirectorySearchResultsPage.builder(context),
                      DirectorySearchResultsPage.builder(context),
                      DirectorySearchResultsPage.builder(context),
                      DirectorySearchResultsPage.builder(context),
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
              "lbl_all2".tr,
            ),
          ),
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
}
