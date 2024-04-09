import 'package:flutter/widgets.dart';
import 'package:santhom_connect/presentation/contribution_screen/models/contribution_model.dart';
import 'package:santhom_connect/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/circular_loader.dart';
import 'contribution_item_widget.dart';
import 'provider/contribution_provider.dart';

class ContributionScreen extends StatefulWidget {
  const ContributionScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ContributionScreenState createState() => ContributionScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContributionProvider(),
      child: ContributionScreen(),
    );
  }
}

class ContributionScreenState extends State<ContributionScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ContributionProvider>(context, listen: false)
          .getContribution();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Consumer<ContributionProvider>(
                    builder: (context, provider, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMonday(context, provider.respo.data?.payments)
                    ],
                  );
                }),
              ),
              Selector<ContributionProvider, bool>(
                selector: (context, provider) => provider.isLoading,
                builder: (context, value, child) {
                  return value ? CircularLoader() : SizedBox();
                },
              ),
            ],
          ),
        ),
        // bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }
}

Widget _buildMonday(BuildContext context, List<Payments>? data) {
  if (data == null) {
    return SizedBox();
  }
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: data.length,
    itemBuilder: (context, index) {
      Payments item = data[index];
      return ContributionItemWidget(item);
    },
  );
}

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
          text: "My Contributions", margin: EdgeInsets.only(left: 14.h)),
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
