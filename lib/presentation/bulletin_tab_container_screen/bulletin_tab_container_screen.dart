import 'package:flutter/widgets.dart';
import 'package:santhom_connect/presentation/home_tab_container_page/home_tab_container_page.dart';
import 'package:santhom_connect/presentation/directory_search_results_tab_container_page/directory_search_results_tab_container_page.dart';
import 'package:santhom_connect/widgets/custom_search_view.dart';
import 'package:santhom_connect/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';
import '../../widgets/circular_loader.dart';
import '../home_page/bulletin_page.dart';
import 'provider/bulletin_tab_container_provider.dart';

class BulletinTabContainerScreen extends StatefulWidget {
  const BulletinTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  BulletinTabContainerScreenState createState() =>
      BulletinTabContainerScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BulletinTabContainerProvider(),
      child: BulletinTabContainerScreen(),
    );
  }
}

class BulletinTabContainerScreenState extends State<BulletinTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BulletinTabContainerProvider>(context, listen: false)
          .getBulletin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Consumer<BulletinTabContainerProvider>(
                  builder: (context, provider, child) {
                print("Consumer");
                print(provider.bulletin_respo.data.toString());
                print(provider.bulletin_respo.data?.length);
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

                tabviewController = TabController(
                    length: provider.bulletin_respo.data?.length ?? 0,
                    vsync: this);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.v),
                    Padding(
                      padding: EdgeInsets.only(left: 25.h),
                      child: Text(
                        "lbl_bulletin".tr,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(height: 21.v),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 24.h,
                          right: 21.h,
                        ),
                        child: CustomSearchView(
                          controller: provider.searchController,
                          hintText: "lbl_search_here".tr,
                          onChanged: (value) => {provider.getBulletin()},
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 21.v),
                    _buildBulletin(context, tabItem),
                    Expanded(
                      child: TabBarView(
                        controller: tabviewController,
                        children: tabViewChildren ?? [],
                      ),
                    ),
                  ],
                );
              }),
            ),
            Selector<BulletinTabContainerProvider, bool>(
              selector: (context, provider) => provider.isLoading,
              builder: (context, value, child) {
                return value ? CircularLoader() : SizedBox();
              },
            ),
          ],
        ),
        // bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildBulletin(BuildContext context, List<Widget>? tabItem) {
    return Container(
      height: 60.h,
      child: TabBar(
        controller: tabviewController,
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
    );
  }
}
