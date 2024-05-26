import 'package:santhom_connect/core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/circular_loader.dart';
import 'widgets/directoryprayer_item_widget.dart';
import 'models/directoryprayer_item_model.dart';
import 'models/directory_prayer_group_model.dart';
import 'package:flutter/material.dart';
import 'provider/directory_prayer_group_provider.dart';

class DirectoryPrayerGroupScreen extends StatefulWidget {
  const DirectoryPrayerGroupScreen({Key? key}) : super(key: key);

  @override
  DirectoryPrayerGroupScreenState createState() =>
      DirectoryPrayerGroupScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DirectoryPrayerGroupProvider(),
        child: DirectoryPrayerGroupScreen());
  }
}

class DirectoryPrayerGroupScreenState
    extends State<DirectoryPrayerGroupScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      String profile_id = ModalRoute.of(context)?.settings.arguments as String;
      print("profile_id");
      print(profile_id);
      Provider.of<DirectoryPrayerGroupProvider>(context, listen: false)
          .getPrayerGroup(profile_id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
    Container(
      child: Consumer<DirectoryPrayerGroupProvider>(
          builder: (context, provider, child) {
        return Column(children: [
          _buildSixty(context),
          SizedBox(height: 6.v),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(children: [
            Text(provider.respo.data?.prayerGroup?.groupName ?? "",
                style: CustomTextStyles.titleLargeBluegray90001),
            SizedBox(height: 1.v),
            RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Leader : ",
                      style: CustomTextStyles.bodyLargeff214d6c),
                  TextSpan(
                      text: provider.respo.data?.prayerGroup?.leader ?? "",
                      style: CustomTextStyles.titleMediumff214d6c)
                ]),
                textAlign: TextAlign.left),
            SizedBox(height: 16.v),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 21.h, vertical: 21.v),
              child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 21.h, vertical: 19.v),
                  decoration: AppDecoration.fillWhiteA.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Members".tr,
                          style: CustomTextStyles.titleMediumBlack900),
                      SizedBox(
                        height: 10,
                      ),
                      _buildDirectoryPrayer(
                          context, provider.respo.data?.members ?? []),
                    ],
                  )),
            ),
          ])))
        ]);
      }),
    ),
    Selector<DirectoryPrayerGroupProvider, bool>(
      selector: (context, provider) => provider.isLoading,
      builder: (context, value, child) {
        return value ? CircularLoader() : SizedBox();
      },
    ),
          ],
        ));
  }

  /// Section Widget
  Widget _buildSixty(BuildContext context) {
    return SizedBox(
        height: 236.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                  height: 200.v,
                  width: double.maxFinite,
                  child: Stack(alignment: Alignment.topCenter, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgRectangle9932,
                        height: 200.v,
                        width: 414.h,
                        alignment: Alignment.center),
                    CustomAppBar(
                        leadingWidth: double.maxFinite,
                        leading: AppbarLeadingIconbutton(
                            imagePath: ImageConstant.imgArrowLeft,
                            margin: EdgeInsets.only(left: 25.h, right: 363.h),
                            onTap: () {
                              onTapArrowLeft(context);
                            }))
                  ]))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 121.adaptSize,
                  width: 121.adaptSize,
                  padding: EdgeInsets.all(3.h),
                  decoration: AppDecoration.outlineWhiteA.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder60),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgRectangle25,
                      height: 110.adaptSize,
                      width: 110.adaptSize,
                      radius: BorderRadius.circular(55.h),
                      alignment: Alignment.center)))
        ]));
  }

  /// Section Widget
  Widget _buildDirectoryPrayer(BuildContext context, List<Members>? members) {
    if (members == null) {
      return SizedBox();
    }
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.only(bottom: 13.v),
            child: Consumer<DirectoryPrayerGroupProvider>(
                builder: (context, provider, child) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: provider.respo.data?.members?.length ?? 0,
                  itemBuilder: (context, index) {
                    Members model = members[index];
                    return DirectoryprayerItemWidget(model);
                  });
            })));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
