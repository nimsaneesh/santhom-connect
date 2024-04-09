import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/circular_loader.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'models/my_family_model.dart';
import 'provider/profile_provider.dart';

// ignore_for_file: must_be_immutable

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key})
      : super(
          key: key,
        );

  @override
  ProfilePageState createState() => ProfilePageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: ProfilePage(),
    );
  }
}

class ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileProvider>(context, listen: false).getMyFamily();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Consumer<ProfileProvider>(
                    builder: (context, provider, child) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 5.v),
                    padding: EdgeInsets.symmetric(horizontal: 22.h),
                    child: Column(
                      children: [
                        SizedBox(height: 14.v),
                        _buildOctober(context, provider),
                        SizedBox(height: 18.v),
                        Container(
                          margin: EdgeInsets.only(left: 1.h),
                          padding: EdgeInsets.symmetric(vertical: 14.v),
                          decoration: AppDecoration.fillWhiteA.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder16,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 6.v),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 25.h,
                                  right: 15.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 5.v,
                                        bottom: 2.v,
                                      ),
                                      child: Text(
                                        "msg_family_information".tr,
                                        style: CustomTextStyles
                                            .titleMediumBlack900,
                                      ),
                                    ),
                                    CustomElevatedButton(
                                      onPressed: () => {
                                        NavigatorService.pushNamed(
                                            AppRoutes.editProfileScreen,
                                            arguments:
                                                provider.family_respo.data)
                                      },
                                      width: 117.h,
                                      height: 40.h,
                                      text: "lbl_edit_profile".tr,
                                      rightIcon: Container(
                                        margin: EdgeInsets.only(left: 2.h),
                                        child: CustomImageView(
                                          imagePath:
                                              ImageConstant.imgClockWhiteA700,
                                          height: 18.adaptSize,
                                          width: 18.adaptSize,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 9.v),
                              Divider(),
                              SizedBox(height: 8.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 25.h),
                                    child: _buildListView(
                                        provider.family_respo.data?.memebers),
                                  )),
                              SizedBox(height: 12.v),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomImageView(
                                      imagePath: ImageConstant.imgAddress1,
                                      height: 18.adaptSize,
                                      width: 18.adaptSize,
                                      margin: EdgeInsets.only(bottom: 22.v),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 280.h,
                                        margin: EdgeInsets.only(left: 16.h),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "lbl_address".tr,
                                                style: CustomTextStyles
                                                    .bodyMediumff767676,
                                              ),
                                              TextSpan(
                                                text: provider.family_respo.data
                                                        ?.family?.address1 ??
                                                    "",
                                                style:
                                                    theme.textTheme.bodyMedium,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 4.v),
                              Divider(
                                indent: 25.h,
                                endIndent: 27.h,
                              ),
                              Divider(
                                indent: 25.h,
                                endIndent: 27.h,
                              ),
                              SizedBox(height: 9.v),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 25.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                        imagePath:
                                            ImageConstant.imgChristianity,
                                        height: 20.adaptSize,
                                        width: 20.adaptSize,
                                        margin: EdgeInsets.only(bottom: 2.v),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 15.h,
                                          top: 5.v,
                                        ),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "lbl_prayer_group".tr,
                                                style: CustomTextStyles
                                                    .bodyMediumff767676,
                                              ),
                                              TextSpan(
                                                text: provider
                                                        .family_respo
                                                        .data
                                                        ?.family
                                                        ?.prayerGroupName ??
                                                    "",
                                                style:
                                                    theme.textTheme.bodyMedium,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.v),
                              Divider(
                                indent: 25.h,
                                endIndent: 27.h,
                              ),
                              Divider(
                                indent: 25.h,
                                endIndent: 27.h,
                              ),
                              SizedBox(height: 12.v),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 25.h),
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.homeAddress,
                                        height: 19.v,
                                        width: 18.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 16.h),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "location : ",
                                                style: CustomTextStyles
                                                    .bodyMediumff767676,
                                              ),
                                              TextSpan(
                                                text: provider.family_respo.data
                                                        ?.family?.mapLocation ??
                                                    "",
                                                style:
                                                    theme.textTheme.bodyMedium,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.v),
                              Divider(
                                indent: 25.h,
                                endIndent: 27.h,
                              ),
                              Divider(
                                indent: 25.h,
                                endIndent: 27.h,
                              ),
                              SizedBox(height: 12.v),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 25.h),
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.imgTelephone,
                                        height: 19.v,
                                        width: 18.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 16.h),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "lbl_mobile_number".tr,
                                                style: CustomTextStyles
                                                    .bodyMediumff767676,
                                              ),
                                              TextSpan(
                                                text: provider.family_respo.data
                                                        ?.family?.address2 ??
                                                    "",
                                                style:
                                                    theme.textTheme.bodyMedium,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 18.v),
                              Divider(),
                              SizedBox(height: 13.v),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 25.h),
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.imgG10368,
                                        height: 15.adaptSize,
                                        width: 15.adaptSize,
                                        margin: EdgeInsets.only(
                                          top: 1.v,
                                          bottom: 3.v,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.h),
                                        child: Text(
                                          "lbl_add_member".tr,
                                          style: CustomTextStyles
                                              .titleSmallIndigoA700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              Selector<ProfileProvider, bool>(
                selector: (context, provider) => provider.isLoading,
                builder: (context, value, child) {
                  return value ? CircularLoader() : SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "lbl_my_profile".tr,
        margin: EdgeInsets.only(left: 25.h, top: 15.v),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgClock,
          margin: EdgeInsets.fromLTRB(0.h, 25.h, 15.h, 15.v),
          text: "Logout",
          // onTap: Provider.of<ProfileProvider>(context, listen: false).logout(),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildOctober(
    BuildContext context,
    ProfileProvider provider,
  ) {
    return Container(
      width: 368.h,
      margin: EdgeInsets.symmetric(horizontal: 1.h),
      padding: EdgeInsets.symmetric(
        horizontal: 58.h,
        vertical: 19.v,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: fs.Svg(
            ImageConstant.imgGroup162496,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6.v),
          Container(
            height: 86.adaptSize,
            width: 86.adaptSize,
            margin: EdgeInsets.only(left: 78.h),
            padding: EdgeInsets.all(3.h),
            decoration: AppDecoration.outline.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder43,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgEllipse2851,
              height: 76.adaptSize,
              width: 76.adaptSize,
              radius: BorderRadius.circular(
                38.h,
              ),
              alignment: Alignment.center,
            ),
          ),
          SizedBox(height: 7.v),
          Align(
            alignment: Alignment.center,
            child: Text(
              provider.family_respo.data?.family?.familyName ?? "",
              style: CustomTextStyles.titleMediumPoppinsWhiteA700,
            ),
          ),
          SizedBox(height: 7.v),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "msg_head_of_the_family2".tr,
                  style: CustomTextStyles.bodyMediumPoppinsffffffff,
                ),
                TextSpan(
                  text:
                      provider.family_respo.data?.family?.familyHeadName ?? "",
                  style: CustomTextStyles.titleSmallPoppinsffffc885,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 7.v),
          Align(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "lbl_family_code".tr,
                    style: CustomTextStyles.bodyMediumPoppinsffffffff,
                  ),
                  TextSpan(
                    text: provider.family_respo.data?.family?.familyCode ?? "",
                    style: CustomTextStyles.titleSmallPoppinsffffffff,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

// Widget _buildListView(List<Memebers>? memebers) {
//   return ListView.builder(
//     shrinkWrap: true,
//     physics: NeverScrollableScrollPhysics(),
//     itemCount: memebers?.length, // Example itemCount
//     itemBuilder: (context, index) {
//       Memebers? model = memebers?[index];
//       return Row(
//         children: [
//           CustomImageView(
//             imagePath: ImageConstant.imgClockBlack900,
//             height: 21.adaptSize,
//             width: 21.adaptSize,
//             margin: EdgeInsets.only(bottom: 3.v),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               left: 15.h,
//               top: 4.v,
//             ),
//             child: RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: model?.name ?? "",
//                     style: CustomTextStyles.titleSmallff1f6291,
//                   ),
//                   TextSpan(
//                     text: model?.relationshipName ?? "",
//                     style: theme.textTheme.bodyMedium,
//                   ),
//                 ],
//               ),
//               textAlign: TextAlign.left,
//             ),
//           ),
//         ],
//       );

//       // return Text(model?.relationshipName ?? "");
//     },
//   );
// }

Widget _buildListView(List<Memebers>? memebers) {
  List<Widget> rows = [];

  if (memebers != null) {
    for (int i = 0; i < memebers.length; i++) {
      Memebers? model = memebers[i];
      rows.add(
        Column(
          children: [
            Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgNavProfile,
                  height: 21.adaptSize,
                  width: 21.adaptSize,
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
                          text: model.name ?? "",
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
          ],
        ),
      );
    }
  }

  return Column(children: rows);
}
