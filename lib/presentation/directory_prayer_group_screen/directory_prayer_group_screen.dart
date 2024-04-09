import 'package:santhom_connect/core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildSixty(context),
                  SizedBox(height: 6.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Column(children: [
                    Text("msg_santhom_prayer_group".tr,
                        style: CustomTextStyles.titleLargeBluegray90001),
                    SizedBox(height: 1.v),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "lbl_leader".tr,
                              style: CustomTextStyles.bodyLargeff214d6c),
                          TextSpan(
                              text: "lbl_joseph_chandy".tr,
                              style: CustomTextStyles.titleMediumff214d6c)
                        ]),
                        textAlign: TextAlign.left),
                    SizedBox(height: 16.v),
                    Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                            height: 687.v,
                            width: 389.h,
                            child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                          margin: EdgeInsets.only(right: 21.h),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 21.h, vertical: 19.v),
                                          decoration: AppDecoration.fillWhiteA
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder16),
                                          child: Text("lbl_members".tr,
                                              style: CustomTextStyles
                                                  .titleMediumBlack900))),
                                  Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 22.h),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                    height: 578.v,
                                                    width: 367.h,
                                                    child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Align(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              child: Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left: 50
                                                                              .h),
                                                                  child: Text(
                                                                      "lbl_kombara_house"
                                                                          .tr,
                                                                      style: CustomTextStyles
                                                                          .bodySmallPoppins))),
                                                          Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: SizedBox(
                                                                  height: 575.v,
                                                                  width: 367.h,
                                                                  child: Stack(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      children: [
                                                                        CustomImageView(
                                                                            imagePath:
                                                                                ImageConstant.imgEllipse40,
                                                                            height: 33.adaptSize,
                                                                            width: 33.adaptSize,
                                                                            radius: BorderRadius.circular(16.h),
                                                                            alignment: Alignment.bottomLeft),
                                                                        _buildDirectoryPrayer(
                                                                            context)
                                                                      ])))
                                                        ])),
                                                SizedBox(height: 22.v),
                                                Row(children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgEllipse47,
                                                      height: 33.adaptSize,
                                                      width: 33.adaptSize,
                                                      radius:
                                                          BorderRadius.circular(
                                                              16.h)),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 17.h, top: 8.v),
                                                      child: Text(
                                                          "msg_gejo_royce_akkara"
                                                              .tr,
                                                          style: CustomTextStyles
                                                              .titleSmallPoppins))
                                                ])
                                              ])))
                                ])))
                  ])))
                ]))));
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
  Widget _buildDirectoryPrayer(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.only(bottom: 13.v),
            child: Consumer<DirectoryPrayerGroupProvider>(
                builder: (context, provider, child) {
              return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.5.v),
                        child: SizedBox(
                            width: 324.h,
                            child: Divider(
                                height: 1.v,
                                thickness: 1.v,
                                color: appTheme.gray200)));
                  },
                  itemCount: provider.directoryPrayerGroupModelObj
                      .directoryprayerItemList.length,
                  itemBuilder: (context, index) {
                    DirectoryprayerItemModel model = provider
                        .directoryPrayerGroupModelObj
                        .directoryprayerItemList[index];
                    return DirectoryprayerItemWidget(model);
                  });
            })));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
