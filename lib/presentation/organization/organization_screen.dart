import 'package:flutter/widgets.dart';
import 'package:santhom_connect/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/circular_loader.dart';
import 'models/organization_model.dart';
import 'provider/organization_provider.dart';
import 'organization_item_widget.dart';

class OrganizationScreen extends StatefulWidget {
  const OrganizationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  OrganizationScreenState createState() => OrganizationScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrganizationProvider(),
      child: OrganizationScreen(),
    );
  }
}

class OrganizationScreenState extends State<OrganizationScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OrganizationProvider>(context, listen: false)
          .getVikarsMessage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Consumer<OrganizationProvider>(
                builder: (context, provider, child) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          onChanged: (value) => {provider.getVikarsMessage()},
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: _buildMonday(context, provider.respo.data),
                    )
                  ],
                ),
              );
            }),
          ),
          Selector<OrganizationProvider, bool>(
            selector: (context, provider) => provider.isLoading,
            builder: (context, value, child) {
              return value ? CircularLoader() : SizedBox();
            },
          ),
        ],
      ),
      // bottomNavigationBar: _buildBottomBar(context),
    );
  }
}

Widget _buildMonday(BuildContext context, List<OrganizationData>? data) {
  if (data == null) {
    return SizedBox();
  }
  return ListView.builder(
    shrinkWrap: true,
    itemCount: data.length,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      OrganizationData item = data[index];
      return OrganizationItemWidget(item);
    },
  );
}

/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
      height: 52.v,
      leadingWidth: 51.h,
      leading: AppbarLeadingIconbutton(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.only(left: 25.h, top: 13.v, bottom: 13.v),
          onTap: () {
            onTapArrowLeft(context);
          }),
      title: AppbarTitle(
          text: "Organizations", margin: EdgeInsets.only(left: 14.h)),
      actions: [
        // AppbarSubtitleOne(
        //     text: "lbl_share".tr,
        //     margin: EdgeInsets.only(left: 22.h, top: 17.v, right: 16.h)),
        AppbarTrailingImage(
            imagePath: ImageConstant.imgSend,
            margin: EdgeInsets.only(left: 5.h, top: 17.v, right: 38.h))
      ]);
}

/// Navigates to the previous screen.
onTapArrowLeft(BuildContext context) {
  NavigatorService.goBack();
}
