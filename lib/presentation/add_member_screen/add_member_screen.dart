import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../edit_family_profile_screen/provider/edit_family_profile_provider.dart';
import '../profile_page/models/my_family_model.dart';
import 'models/edit_profile_model.dart';
import 'provider/add_member_provider.dart';

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({Key? key}) : super(key: key);

  @override
  AddMemberScreenState createState() => AddMemberScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AddMemberProvider(), child: AddMemberScreen());
  }
}

class AddMemberScreenState extends State<AddMemberScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Data? model = ModalRoute.of(context)!.settings.arguments as Data;
      Provider.of<AddMemberProvider>(context, listen: false).setData(model);
    });
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
                                child: Text("Title".tr,
                                    style: CustomTextStyles.titleSmallGray600)),
                            SizedBox(height: 6.v),
                            Selector<AddMemberProvider, TextEditingController?>(
                                selector: (context, provider) =>
                                    provider.titleController,
                                builder: (context, titleController, child) {
                                  return CustomTextFormField(
                                      controller: titleController,
                                      hintText: "Title".tr);
                                }),
                            SizedBox(height: 14.v),

                            Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Text("Name".tr,
                                    style: CustomTextStyles.titleSmallGray600)),
                            SizedBox(height: 6.v),
                            Selector<AddMemberProvider, TextEditingController?>(
                                selector: (context, provider) =>
                                    provider.headOfFamilyController,
                                builder: (context, nameController, child) {
                                  return CustomTextFormField(
                                      controller: nameController,
                                      hintText: "Name".tr);
                                }),
                            SizedBox(height: 14.v),

                            // Padding(
                            //     padding: EdgeInsets.only(left: 2.h),
                            //     child: Text("Email of Head of the Family".tr,
                            //         style: CustomTextStyles.titleSmallGray600)),
                            // SizedBox(height: 6.v),
                            // Selector<EditProfileProvider,
                            //         TextEditingController?>(
                            //     selector: (context, provider) =>
                            //         provider.emailController,
                            //     builder: (context, nameController, child) {
                            //       return CustomTextFormField(
                            //           controller: nameController,
                            //           hintText:
                            //               "Email of Head of the Family".tr);
                            //     }),
                            // SizedBox(height: 14.v),
                            Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Text("Address 1".tr,
                                    style: CustomTextStyles.titleSmallGray600)),
                            SizedBox(height: 6.v),
                            Selector<AddMemberProvider, TextEditingController?>(
                                selector: (context, provider) =>
                                    provider.addressController,
                                builder: (context, nameController, child) {
                                  return CustomTextFormField(
                                      controller: nameController,
                                      hintText: "Address".tr);
                                }),
                            SizedBox(height: 14.v),
                            Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Text("Address 2".tr,
                                    style: CustomTextStyles.titleSmallGray600)),
                            SizedBox(height: 6.v),
                            Selector<AddMemberProvider, TextEditingController?>(
                                selector: (context, provider) =>
                                    provider.address2Controller,
                                builder: (context, nameController, child) {
                                  return CustomTextFormField(
                                      controller: nameController,
                                      hintText: "Address".tr);
                                }),
                            SizedBox(height: 14.v),
                            SizedBox(height: 14.v),
                            Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Text("Post office".tr,
                                    style: CustomTextStyles.titleSmallGray600)),
                            SizedBox(height: 6.v),
                            Selector<AddMemberProvider, TextEditingController?>(
                                selector: (context, provider) =>
                                    provider.postOfficeController,
                                builder: (context, nameController, child) {
                                  return CustomTextFormField(
                                      controller: nameController,
                                      hintText: "Post Office".tr);
                                }),
                            SizedBox(height: 14.v),
                            Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Text("Pincode".tr,
                                    style: CustomTextStyles.titleSmallGray600)),
                            SizedBox(height: 6.v),
                            Selector<AddMemberProvider, TextEditingController?>(
                                selector: (context, provider) =>
                                    provider.pincodeController,
                                builder: (context, nameController, child) {
                                  return CustomTextFormField(
                                      controller: nameController,
                                      hintText: "Pincode".tr);
                                }),
                            SizedBox(height: 14.v),
                            Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Text("Payer Group".tr,
                                    style: CustomTextStyles.titleSmallGray600)),
                            SizedBox(height: 6.v),
                            Selector<AddMemberProvider,
                                    List<SelectionPopupModel>?>(
                                selector: (context, provider) =>
                                    provider.prayerGroupItems,
                                builder: (context, prayerGroupItems, child) {
                                  return CustomDropDown(
                                      hintText: "Prayer Group".tr,
                                      items: prayerGroupItems ?? [],
                                      onChanged: (value) {
                                        context
                                            .read<AddMemberProvider>()
                                            .onSelected1(value);
                                      });
                                }),
                            SizedBox(height: 14.v),
                            // Padding(
                            //     padding: EdgeInsets.only(left: 2.h),
                            //     child: Text("Map Location".tr,
                            //         style: CustomTextStyles.titleSmallGray600)),
                            // SizedBox(height: 6.v),
                            // Selector<EditProfileProvider,
                            //         TextEditingController?>(
                            //     selector: (context, provider) =>
                            //         provider.mapLocationGroupController,
                            //     builder: (context, nameController, child) {
                            //       return CustomTextFormField(
                            //           controller: nameController,
                            //           hintText: "Map Location".tr);
                            //     }),
                            // SizedBox(height: 14.v),
                            Row(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgMaximize,
                                  height: 21.adaptSize,
                                  width: 21.adaptSize,
                                  margin: EdgeInsets.only(bottom: 3.v)),
                              Padding(
                                  padding: EdgeInsets.only(left: 9.h),
                                  child: Text("msg_edit_family_members".tr,
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
            margin: EdgeInsets.only(left: 25.h, top: 13.v, bottom: 13.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarTitle(
            text: "Edit Profile", margin: EdgeInsets.only(left: 14.h)),
        actions: [
          AppbarSubtitle(
              onTap: () => {
                    Provider.of<AddMemberProvider>(context, listen: false)
                        .saveData()
                  },
              text: "Update Changes",
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
