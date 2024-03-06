import 'package:santhom_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:santhom_connect/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:santhom_connect/widgets/custom_text_form_field.dart';
import 'models/directory_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';
import 'provider/directory_profile_provider.dart';

class DirectoryProfileScreen extends StatefulWidget {
  const DirectoryProfileScreen({Key? key}) : super(key: key);

  @override
  DirectoryProfileScreenState createState() => DirectoryProfileScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DirectoryProfileProvider(),
        child: DirectoryProfileScreen());
  }
}

class DirectoryProfileScreenState extends State<DirectoryProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildArrowLeft(context),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 21.h, vertical: 4.v),
                      child: Column(children: [
                        Text("msg_abhishek_thomas".tr,
                            style: CustomTextStyles.titleLargeBluegray90001),
                        SizedBox(height: 3.v),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("msg_valiyaparambil_house".tr,
                                  style: CustomTextStyles
                                      .titleMediumLightblue900
                                      .copyWith(
                                          decoration:
                                              TextDecoration.underline)),
                              CustomImageView(
                                  imagePath: ImageConstant.imgArrowRight,
                                  height: 12.v,
                                  width: 7.h,
                                  margin: EdgeInsets.only(
                                      left: 8.h, top: 2.v, bottom: 7.v))
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("msg_personal_details".tr,
                                      style:
                                          CustomTextStyles.titleMediumBlack900),
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
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text:
                                                              "lbl_family_head2"
                                                                  .tr,
                                                          style: CustomTextStyles
                                                              .bodyMediumManropeff767676),
                                                      TextSpan(
                                                          text:
                                                              "lbl_thomas_kurian"
                                                                  .tr,
                                                          style: CustomTextStyles
                                                              .titleSmallff1f6291)
                                                    ]),
                                                    textAlign: TextAlign.left))
                                          ])),
                                  SizedBox(height: 3.v),
                                  Divider(endIndent: 10.h),
                                  SizedBox(height: 10.v),
                                  Padding(
                                      padding: EdgeInsets.only(left: 5.h),
                                      child: Row(children: [
                                        CustomImageView(
                                            imagePath: ImageConstant.imgGender,
                                            height: 19.v,
                                            width: 18.h,
                                            margin: EdgeInsets.only(top: 1.v)),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 16.h),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "lbl_gender".tr,
                                                      style: CustomTextStyles
                                                          .bodyMediumManropeff767676),
                                                  TextSpan(
                                                      text: "lbl_male".tr,
                                                      style: CustomTextStyles
                                                          .bodyMediumManropeff000000)
                                                ]),
                                                textAlign: TextAlign.left))
                                      ])),
                                  SizedBox(height: 5.v),
                                  Divider(endIndent: 10.h),
                                  Divider(endIndent: 10.h),
                                  SizedBox(height: 11.v),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 5.h, right: 80.h),
                                      child: Row(children: [
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgCalendar,
                                            height: 18.adaptSize,
                                            width: 18.adaptSize),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 15.h),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "lbl_date_of_birth"
                                                          .tr,
                                                      style: CustomTextStyles
                                                          .bodyMediumManropeff767676),
                                                  TextSpan(
                                                      text:
                                                          "msg_12_december_1993"
                                                              .tr,
                                                      style: CustomTextStyles
                                                          .bodyMediumManropeff000000)
                                                ]),
                                                textAlign: TextAlign.left))
                                      ])),
                                  SizedBox(height: 8.v),
                                  Divider(endIndent: 10.h),
                                  Divider(endIndent: 10.h),
                                  SizedBox(height: 11.v),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 6.h, right: 62.h),
                                      child: Row(children: [
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgThumbsUp,
                                            height: 19.v,
                                            width: 15.h),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 17.h, top: 3.v),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text:
                                                          "msg_date_of_baptism2"
                                                              .tr,
                                                      style: CustomTextStyles
                                                          .bodyMediumManropeff767676),
                                                  TextSpan(
                                                      text:
                                                          "msg_12_december_1997"
                                                              .tr,
                                                      style: CustomTextStyles
                                                          .bodyMediumManropeff000000)
                                                ]),
                                                textAlign: TextAlign.left))
                                      ])),
                                  SizedBox(height: 4.v),
                                  Divider(endIndent: 10.h),
                                  Divider(endIndent: 10.h),
                                  SizedBox(height: 8.v),
                                  Row(children: [
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.imgRelationship1,
                                        height: 25.adaptSize,
                                        width: 25.adaptSize),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 12.h, top: 4.v),
                                        child: RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text:
                                                      "msg_relationship_status2"
                                                          .tr,
                                                  style: CustomTextStyles
                                                      .bodyMediumManropeff767676),
                                              TextSpan(
                                                  text: "lbl_single".tr,
                                                  style: CustomTextStyles
                                                      .bodyMediumManropeff000000)
                                            ]),
                                            textAlign: TextAlign.left))
                                  ]),
                                  SizedBox(height: 2.v),
                                  Divider(endIndent: 10.h),
                                  Divider(endIndent: 10.h),
                                  SizedBox(height: 9.v),
                                  Padding(
                                      padding: EdgeInsets.only(left: 7.h),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgMenu,
                                                height: 20.v,
                                                width: 13.h,
                                                margin: EdgeInsets.only(
                                                    bottom: 2.v)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 18.h, top: 5.v),
                                                child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text:
                                                              "lbl_family_status"
                                                                  .tr,
                                                          style: CustomTextStyles
                                                              .bodyMediumManropeff767676),
                                                      TextSpan(
                                                          text: "lbl_son".tr,
                                                          style: CustomTextStyles
                                                              .bodyMediumManropeff000000)
                                                    ]),
                                                    textAlign: TextAlign.left))
                                          ])),
                                  SizedBox(height: 10.v),
                                  Divider(endIndent: 10.h),
                                  SizedBox(height: 8.v),
                                  Padding(
                                      padding: EdgeInsets.only(right: 10.h),
                                      child: Selector<DirectoryProfileProvider,
                                              TextEditingController?>(
                                          selector: (context, provider) =>
                                              provider.teachingController,
                                          builder: (context, teachingController,
                                              child) {
                                            return CustomTextFormField(
                                                controller: teachingController,
                                                hintText:
                                                    "msg_qualification_b_tech"
                                                        .tr,
                                                textInputAction:
                                                    TextInputAction.done,
                                                prefix: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 3.h,
                                                        right: 14.h,
                                                        bottom: 6.v),
                                                    child: CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgTeaching,
                                                        height: 23.v,
                                                        width: 22.h)),
                                                prefixConstraints:
                                                    BoxConstraints(
                                                        maxHeight: 29.v),
                                                contentPadding: EdgeInsets.only(
                                                    top: 3.v,
                                                    right: 9.h,
                                                    bottom: 3.v),
                                                borderDecoration:
                                                    TextFormFieldStyleHelper
                                                        .underLineGray,
                                                filled: false);
                                          })),
                                  SizedBox(height: 8.v),
                                  Padding(
                                      padding: EdgeInsets.only(left: 4.h),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgUser,
                                                height: 18.v,
                                                width: 20.h,
                                                margin: EdgeInsets.only(
                                                    bottom: 6.v)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 15.h, top: 4.v),
                                                child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text:
                                                              "lbl_company_name"
                                                                  .tr,
                                                          style: CustomTextStyles
                                                              .bodyMediumManropeff767676),
                                                      TextSpan(
                                                          text:
                                                              "lbl_infosys".tr,
                                                          style: CustomTextStyles
                                                              .bodyMediumManropeff000000)
                                                    ]),
                                                    textAlign: TextAlign.left))
                                          ])),
                                  SizedBox(height: 2.v),
                                  Divider(endIndent: 10.h),
                                  Divider(endIndent: 10.h),
                                  SizedBox(height: 8.v),
                                  Row(children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.imgBloodType,
                                        height: 24.adaptSize,
                                        width: 24.adaptSize),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 13.h, top: 6.v),
                                        child: RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text: "lbl_blood_group".tr,
                                                  style: CustomTextStyles
                                                      .bodyMediumManropeff767676),
                                              TextSpan(
                                                  text: "lbl_o".tr,
                                                  style: CustomTextStyles
                                                      .bodyMediumManropeff000000)
                                            ]),
                                            textAlign: TextAlign.left))
                                  ]),
                                  SizedBox(height: 10.v),
                                  Divider(endIndent: 10.h),
                                  Divider(endIndent: 10.h),
                                  SizedBox(height: 11.v),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 4.h, right: 56.h),
                                      child: Row(children: [
                                        CustomImageView(
                                            imagePath: ImageConstant.imgMail,
                                            height: 19.v,
                                            width: 20.h,
                                            margin:
                                                EdgeInsets.only(bottom: 1.v)),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 15.h, top: 3.v),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "lbl_email2".tr,
                                                      style: CustomTextStyles
                                                          .bodyMediumManropeff767676),
                                                  TextSpan(
                                                      text:
                                                          "msg_abhishekthomas_gmail_com"
                                                              .tr,
                                                      style: CustomTextStyles
                                                          .bodyMediumManropeff000000)
                                                ]),
                                                textAlign: TextAlign.left))
                                      ])),
                                  SizedBox(height: 5.v),
                                  Divider(endIndent: 10.h),
                                  Divider(endIndent: 10.h),
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
                                                      text: "lbl_mobile_number"
                                                          .tr,
                                                      style: CustomTextStyles
                                                          .bodyMediumManropeff767676),
                                                  TextSpan(
                                                      text: "lbl_91_8876542526"
                                                          .tr,
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
                                            imagePath:
                                                ImageConstant.imgChristianity,
                                            height: 20.adaptSize,
                                            width: 20.adaptSize),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 15.h, top: 3.v),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "lbl_prayer_group2"
                                                          .tr,
                                                      style: CustomTextStyles
                                                          .bodyMediumManropeff767676),
                                                  TextSpan(
                                                      text: "lbl_santhom_group"
                                                          .tr,
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
                                            imagePath: ImageConstant.imgHome,
                                            height: 20.adaptSize,
                                            width: 20.adaptSize,
                                            margin:
                                                EdgeInsets.only(bottom: 1.v)),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 15.h, top: 4.v),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "lbl_location".tr,
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
                ]))));
  }

  /// Section Widget
  Widget _buildArrowLeft(BuildContext context) {
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
