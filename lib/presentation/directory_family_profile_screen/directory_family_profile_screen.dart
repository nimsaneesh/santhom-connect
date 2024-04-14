import 'package:santhom_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:santhom_connect/widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../utils/utils.dart';
import '../../widgets/circular_loader.dart';
import 'models/directory_family_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';
import 'provider/directory_family_profile_provider.dart';

class DirectoryFamilyProfileScreen extends StatefulWidget {
  const DirectoryFamilyProfileScreen({Key? key}) : super(key: key);

  @override
  DirectoryFamilyProfileScreenState createState() =>
      DirectoryFamilyProfileScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DirectoryFamilyProfileProvider(),
        child: DirectoryFamilyProfileScreen());
  }
}

class DirectoryFamilyProfileScreenState
    extends State<DirectoryFamilyProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      String profile_id = ModalRoute.of(context)!.settings.arguments as String;
      print("profile_id");
      print(profile_id);
      Provider.of<DirectoryFamilyProfileProvider>(context, listen: false)
          .getProfile(profile_id);
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
                  child: Consumer<DirectoryFamilyProfileProvider>(
                      builder: (context, provider, child) {
                    return SingleChildScrollView(
                        child: Column(children: [
                      _buildArrowLeft(context, provider),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 21.h, vertical: 4.v),
                          child: Column(children: [
                            Text(
                                provider.bulletin_respo.data?.family
                                        ?.familyName ??
                                    "",
                                style:
                                    CustomTextStyles.titleLargeBluegray90001),
                            SizedBox(height: 3.v),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Family Code :",
                                      style: CustomTextStyles
                                          .titleMediumLightblue900
                                          .copyWith(
                                              decoration:
                                                  TextDecoration.underline)),
                                  Text(
                                      provider.bulletin_respo.data?.family
                                              ?.familyCode ??
                                          "",
                                      style: CustomTextStyles
                                          .titleMediumLightblue900
                                          .copyWith(
                                              decoration:
                                                  TextDecoration.underline)),
                                ]),
                            SizedBox(height: 16.v),
                            Container(
                                width: 368.h,
                                margin: EdgeInsets.only(left: 4.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 21.h, vertical: 18.v),
                                decoration: AppDecoration.fillWhiteA.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder16),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("msg_personal_details".tr,
                                          style: CustomTextStyles
                                              .titleMediumBlack900),
                                      SizedBox(height: 7.v),
                                      Padding(
                                          padding: EdgeInsets.only(left: 3.h),
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomImageView(
                                                    imagePath:
                                                        ImageConstant.imgClock,
                                                    height: 21.adaptSize,
                                                    width: 21.adaptSize,
                                                    margin: EdgeInsets.only(
                                                        bottom: 5.v)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 15.h, top: 5.v),
                                                    child: RichText(
                                                        text:
                                                            TextSpan(children: [
                                                          TextSpan(
                                                              text:
                                                                  "lbl_family_head2"
                                                                      .tr,
                                                              style: CustomTextStyles
                                                                  .bodyMediumManropeff767676),
                                                          TextSpan(
                                                              text: provider
                                                                      .bulletin_respo
                                                                      .data
                                                                      ?.family
                                                                      ?.familyHeadName ??
                                                                  "",
                                                              style: CustomTextStyles
                                                                  .titleSmallff1f6291)
                                                        ]),
                                                        textAlign:
                                                            TextAlign.left))
                                              ])),
                                      SizedBox(height: 3.v),
                                      Divider(endIndent: 10.h),
                                      Divider(endIndent: 10.h),
                                      SizedBox(height: 10.v),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 0.h),
                                            child: _buildListView(provider
                                                .bulletin_respo.data?.members),
                                          )),
                                      SizedBox(height: 11.v),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 5.h, right: 74.h),
                                          child: Row(children: [
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgTelephone,
                                                height: 19.v,
                                                width: 18.h),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 16.h),
                                                child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text:
                                                              "Prayer Group : "
                                                                  .tr,
                                                          style: CustomTextStyles
                                                              .bodyMediumManropeff767676),
                                                      TextSpan(
                                                          text: provider
                                                                  .bulletin_respo
                                                                  .data
                                                                  ?.family
                                                                  ?.prayerGroupName ??
                                                              "",
                                                          style: CustomTextStyles
                                                              .bodyMediumManropeff000000)
                                                    ]),
                                                    textAlign: TextAlign.left))
                                          ])),
                                      SizedBox(height: 7.v),
                                      Divider(endIndent: 10.h),
                                      Divider(endIndent: 10.h),
                                      SizedBox(height: 11.v),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 4.h, right: 92.h),
                                          child: Row(children: [
                                            CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgChristianity,
                                                height: 20.adaptSize,
                                                width: 20.adaptSize),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 15.h, top: 3.v),
                                                child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text:
                                                              "lbl_prayer_group2"
                                                                  .tr,
                                                          style: CustomTextStyles
                                                              .bodyMediumManropeff767676),
                                                      TextSpan(
                                                          text: provider
                                                                  .bulletin_respo
                                                                  .data
                                                                  ?.family
                                                                  ?.address1 ??
                                                              "",
                                                          style: CustomTextStyles
                                                              .bodyMediumManropeff000000)
                                                    ]),
                                                    textAlign: TextAlign.left))
                                          ])),
                                      SizedBox(height: 5.v),
                                      Divider(endIndent: 10.h),
                                      Divider(endIndent: 10.h),
                                      SizedBox(height: 10.v),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 4.h, right: 27.h),
                                          child: Row(children: [
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgHome,
                                                height: 20.adaptSize,
                                                width: 20.adaptSize,
                                                margin: EdgeInsets.only(
                                                    bottom: 1.v)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 15.h, top: 4.v),
                                                child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text:
                                                              "lbl_location".tr,
                                                          style: CustomTextStyles
                                                              .bodyMediumManropeff767676),
                                                      TextSpan(
                                                          text:
                                                              "msg_maps_google_com_fshusfsjfsn"
                                                                  .tr,
                                                          style: CustomTextStyles
                                                              .bodyMediumManropeff0095ff
                                                              .copyWith(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline))
                                                    ]),
                                                    textAlign: TextAlign.left))
                                          ]))
                                    ])),
                            SizedBox(height: 5.v)
                          ]))
                    ]));
                  }),
                ),
                Selector<DirectoryFamilyProfileProvider, bool>(
                  selector: (context, provider) => provider.isLoading,
                  builder: (context, value, child) {
                    return value ? CircularLoader() : SizedBox();
                  },
                ),
              ],
            )));
  }

  /// Section Widget
  Widget _buildArrowLeft(
      BuildContext context, DirectoryFamilyProfileProvider provider) {
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
                        height: 55.v,
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
                      color: Colors.white,
                      borderRadius: BorderRadiusStyle.roundedBorder60),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgRectangle25,
                      height: 110.adaptSize,
                      width: 110.adaptSize,
                      radius: BorderRadius.circular(55.h),
                      alignment: Alignment.center)))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}

Widget _buildListView(List<Members>? memebers) {
  List<Widget> rows = [];

  if (memebers != null) {
    for (int i = 0; i < memebers.length; i++) {
      Members? model = memebers[i];
      rows.add(
        Column(
          children: [
            SizedBox(height: 7.v),
            Row(
              children: [
                CustomImageView(
                  imagePath: getImage(model.relationshipName),
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(bottom: 3.v),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 15.h,
                    top: 4.v,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: model.name + " : " ?? "",
                          style: CustomTextStyles.titleSmallff1f6291,
                        ),
                        TextSpan(
                          text: model.relationshipName ?? "",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            SizedBox(height: 7.v),
            Divider(),
            Divider(),
          ],
        ),
      );
    }
  }

  return Column(children: rows);
}
