import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'models/edit_profile_model.dart';
import 'package:flutter/material.dart';
import 'provider/edit_family_profile_provider.dart';

class EditFamilyProfileScreen extends StatefulWidget {
  const EditFamilyProfileScreen({Key? key}) : super(key: key);

  @override
  EditProfileScreenState createState() => EditProfileScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => EditFamilyProfileProvider(),
        child: EditFamilyProfileScreen());
  }
}

class EditProfileScreenState extends State<EditFamilyProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
            width: SizeUtils.width,
            child: SingleChildScrollView(
                child: Container(
                    height: 864.v,
                    width: 368.h,
                    margin: EdgeInsets.symmetric(horizontal: 23.h),
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 23.h),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(left: 2.h),
                                        child: Text("lbl_name".tr,
                                            style: CustomTextStyles
                                                .titleSmallGray600)),
                                    SizedBox(height: 6.v),
                                    Selector<EditFamilyProfileProvider,
                                            TextEditingController?>(
                                        selector: (context, provider) =>
                                            provider.nameController,
                                        builder:
                                            (context, nameController, child) {
                                          return CustomTextFormField(
                                              controller: nameController,
                                              hintText: "lbl_basil_thomas".tr);
                                        }),
                                    SizedBox(height: 14.v),
                                    Padding(
                                        padding: EdgeInsets.only(left: 2.h),
                                        child: Text("lbl_family_status".tr,
                                            style: CustomTextStyles
                                                .titleSmallGray600)),
                                    SizedBox(height: 5.v),
                                    Selector<EditFamilyProfileProvider,
                                            EditProfileModel?>(
                                        selector: (context, provider) =>
                                            provider.editProfileModelObj,
                                        builder: (context, editProfileModelObj,
                                            child) {
                                          return CustomDropDown(
                                              hintText: "lbl_son".tr,
                                              items: editProfileModelObj
                                                      ?.dropdownItemList ??
                                                  [],
                                              onChanged: (value) {
                                                context
                                                    .read<
                                                        EditFamilyProfileProvider>()
                                                    .onSelected(value);
                                              });
                                        }),
                                    SizedBox(height: 12.v),
                                    Padding(
                                        padding: EdgeInsets.only(left: 2.h),
                                        child: Text("lbl_gender".tr,
                                            style: CustomTextStyles
                                                .titleSmallGray600)),
                                    SizedBox(height: 7.v),
                                    Selector<EditFamilyProfileProvider,
                                            EditProfileModel?>(
                                        selector: (context, provider) =>
                                            provider.editProfileModelObj,
                                        builder: (context, editProfileModelObj,
                                            child) {
                                          return CustomDropDown(
                                              hintText: "lbl_male".tr,
                                              items: editProfileModelObj
                                                      ?.dropdownItemList1 ??
                                                  [],
                                              onChanged: (value) {
                                                context
                                                    .read<
                                                        EditFamilyProfileProvider>()
                                                    .onSelected1(value);
                                              });
                                        }),
                                    SizedBox(height: 12.v),
                                    Padding(
                                        padding: EdgeInsets.only(left: 2.h),
                                        child: Text("lbl_dob".tr,
                                            style: CustomTextStyles
                                                .titleSmallGray600)),
                                    SizedBox(height: 7.v),
                                    _buildEight(context,
                                        dDMMYYYY: "lbl_dd_mm_yyyy".tr),
                                    SizedBox(height: 14.v),
                                    Padding(
                                        padding: EdgeInsets.only(left: 2.h),
                                        child: Text("lbl_blood_group".tr,
                                            style: CustomTextStyles
                                                .titleSmallGray600)),
                                    SizedBox(height: 5.v),
                                    Selector<EditFamilyProfileProvider,
                                            EditProfileModel?>(
                                        selector: (context, provider) =>
                                            provider.editProfileModelObj,
                                        builder: (context, editProfileModelObj,
                                            child) {
                                          return CustomDropDown(
                                              hintText: "lbl_a".tr,
                                              items: editProfileModelObj
                                                      ?.dropdownItemList2 ??
                                                  [],
                                              onChanged: (value) {
                                                context
                                                    .read<
                                                        EditFamilyProfileProvider>()
                                                    .onSelected2(value);
                                              });
                                        }),
                                    SizedBox(height: 14.v),
                                    Padding(
                                        padding: EdgeInsets.only(left: 2.h),
                                        child: Text("lbl_date_of_baptism".tr,
                                            style: CustomTextStyles
                                                .titleSmallGray600)),
                                    SizedBox(height: 5.v),
                                    _buildEight(context,
                                        dDMMYYYY: "lbl_dd_mm_yyyy".tr),
                                    SizedBox(height: 14.v),
                                    Padding(
                                        padding: EdgeInsets.only(left: 2.h),
                                        child: Text(
                                            "msg_relationship_status".tr,
                                            style: CustomTextStyles
                                                .titleSmallGray600)),
                                    SizedBox(height: 5.v),
                                    Selector<EditFamilyProfileProvider,
                                            EditProfileModel?>(
                                        selector: (context, provider) =>
                                            provider.editProfileModelObj,
                                        builder: (context, editProfileModelObj,
                                            child) {
                                          return CustomDropDown(
                                              hintText: "lbl_married".tr,
                                              items: editProfileModelObj
                                                      ?.dropdownItemList3 ??
                                                  [],
                                              onChanged: (value) {
                                                context
                                                    .read<
                                                        EditFamilyProfileProvider>()
                                                    .onSelected3(value);
                                              });
                                        }),
                                    SizedBox(height: 14.v),
                                    Padding(
                                        padding: EdgeInsets.only(left: 2.h),
                                        child: Text("msg_relationship_with".tr,
                                            style: CustomTextStyles
                                                .titleSmallGray600)),
                                    SizedBox(height: 5.v),
                                    Selector<EditFamilyProfileProvider,
                                            TextEditingController?>(
                                        selector: (context, provider) =>
                                            provider.cindiyaJacobController,
                                        builder: (context,
                                            cindiyaJacobController, child) {
                                          return CustomTextFormField(
                                              controller:
                                                  cindiyaJacobController,
                                              hintText: "lbl_cindiya_jacob".tr,
                                              textInputAction:
                                                  TextInputAction.done);
                                        }),
                                    SizedBox(height: 21.v),
                                    Row(children: [
                                      CustomImageView(
                                          imagePath: ImageConstant.imgMaximize,
                                          height: 21.adaptSize,
                                          width: 21.adaptSize,
                                          margin: EdgeInsets.only(bottom: 3.v)),
                                      Padding(
                                          padding: EdgeInsets.only(left: 9.h),
                                          child: Text(
                                              "msg_edit_family_members".tr,
                                              style: CustomTextStyles
                                                  .titleSmallIndigoA700))
                                    ]),
                                    SizedBox(height: 21.v),
                                  ])))
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 54.v,
        leadingWidth: 51.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 25.h, top: 13.v, bottom: 15.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarTitle(
            text: "msg_edit_family_member".tr,
            margin: EdgeInsets.only(left: 14.h)),
        actions: [
          AppbarSubtitle(
              text: "lbl_update_changes".tr,
              margin: EdgeInsets.fromLTRB(23.h, 15.v, 23.h, 18.v))
        ]);
  }

  /// Common widget
  Widget _buildEight(
    BuildContext context, {
    required String dDMMYYYY,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 10.v),
        decoration: AppDecoration.outlineGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Opacity(
              opacity: 0.8,
              child: Padding(
                  padding: EdgeInsets.only(top: 2.v),
                  child: Text(dDMMYYYY,
                      style: theme.textTheme.titleMedium!.copyWith(
                          color: appTheme.blueGray900.withOpacity(0.64))))),
          CustomImageView(
              imagePath: ImageConstant.imgCalendar2,
              height: 23.adaptSize,
              width: 23.adaptSize,
              margin: EdgeInsets.only(top: 1.v))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
