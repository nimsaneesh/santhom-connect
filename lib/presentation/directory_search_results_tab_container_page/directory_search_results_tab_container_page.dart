import 'package:grouped_list/grouped_list.dart';
import 'package:santhom_connect/widgets/custom_search_view.dart';
import 'package:santhom_connect/presentation/directory_search_results_page/directory_search_results_page.dart';
import '../../widgets/circular_loader.dart';
import '../directory_search_results_page/models/monday_item_model.dart';
import '../directory_search_results_page/widgets/monday_item_widget.dart';
import '../home_page/model/directory_model.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DirectorySearchResultsTabContainerProvider>(context,
              listen: false)
          .getDirectory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              width: double.maxFinite,
              decoration: AppDecoration.fillGray,
              child: Consumer<DirectorySearchResultsTabContainerProvider>(
                  builder: (context, provider, child) {
                List<Widget>? tabViewChildren = [];
                List<Widget>? tabItem = [];
                tabItem = provider.directory_respo.data?.map((data) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Tab(
                      child: Text(data.category ?? ""),
                    ),
                  );
                }).toList();

                tabViewChildren = provider.directory_respo.data?.map((data) {
                  return DirectorySearchResultsPage(data.list);
                }).toList();

                tabviewController = TabController(
                    length: provider.directory_respo.data?.length ?? 0,
                    vsync: this);

                return Column(
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
                    SizedBox(height: 21.v),
                    Padding(
                        padding: EdgeInsets.only(
                          left: 24.h,
                          right: 21.h,
                        ),
                        child: CustomSearchView(
                          controller: provider.searchController,
                          onChanged: (value) => {provider.searchItem()},
                          hintText: "lbl_ak".tr,
                        )),
                    SizedBox(height: 10.v),
                    _buildTabview(context, tabItem),
                    Expanded(
                      child: SizedBox(
                        height: 622.v,
                        child: TabBarView(
                          controller: tabviewController,
                          children: tabViewChildren ?? [],
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            Selector<DirectorySearchResultsTabContainerProvider, bool>(
              selector: (context, provider) => provider.isLoading,
              builder: (context, value, child) {
                return value ? CircularLoader() : SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(
    BuildContext context,
    List<Widget>? tabItem,
  ) {
    return Container(
      height: 52.v,
      child: TabBar(
          controller: tabviewController,
          isScrollable: true,
                      tabAlignment: TabAlignment.start,
          labelColor: appTheme.whiteA70001,
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
          tabs: tabItem ?? []),
    );
  }
}
