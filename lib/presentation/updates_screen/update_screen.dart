import 'package:flutter_html/flutter_html.dart';

import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_text_form_field.dart';
import '../home_page/model/bulletin_model.dart';
import '../home_tab_container_page/models/updates_model.dart';
import 'provider/updates_provider.dart';

class UpdatesScreen extends StatefulWidget {
  const UpdatesScreen({Key? key}) : super(key: key);

  @override
  UpdatesScreenState createState() => UpdatesScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => UpdatesProvider(), child: UpdatesScreen());
  }
}

class UpdatesScreenState extends State<UpdatesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ItemList? model = ModalRoute.of(context)!.settings.arguments as ItemList;

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context, model),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 4.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: model.image ?? ImageConstant.imgImage,
                          height: 325.v,
                          width: 367.h,
                          radius: BorderRadius.circular(8.h),
                          margin: EdgeInsets.only(left: 3.h)),
                      SizedBox(height: 26.v),
                      Padding(
                          padding: EdgeInsets.only(left: 3.h),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 9.adaptSize,
                                    width: 9.adaptSize,
                                    margin:
                                        EdgeInsets.only(top: 3.v, bottom: 5.v),
                                    decoration: BoxDecoration(
                                        color: appTheme.orangeA400)),
                                Opacity(
                                    opacity: 0.9,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.h, top: 1.v),
                                        child: Text(model.date ?? "",
                                            style: CustomTextStyles
                                                .bodyMediumBluegray600ab))),
                                Opacity(
                                    opacity: 0.9,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.h, bottom: 1.v),
                                        child: Text(model.heading ?? "",
                                            style: CustomTextStyles
                                                .bodyMediumOrangeA400)))
                              ])),
                      SizedBox(height: 8.v),
                      Padding(
                          padding: EdgeInsets.only(left: 2.h),
                          child:
                              Selector<UpdatesProvider, TextEditingController?>(
                                  selector: (context, provider) =>
                                      provider.thirtyTwoController,
                                  builder:
                                      (context, thirtyTwoController, child) {
                                    return Text(model.heading ?? "",
                                        maxLines: 8,
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyles
                                            .bodyMediumBluegray600
                                            .copyWith(height: 1.57));
                                  })),
                      SizedBox(height: 11.v),
                      Container(
                          width: 359.h,
                          margin: EdgeInsets.only(left: 3.h, right: 7.h),
                          child: Html(
                            data: model.subHeading ?? "",
                          )),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context, ItemList model) {
    return CustomAppBar(
        height: 52.v,
        leadingWidth: 51.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 25.h, top: 13.v, bottom: 13.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title:
            AppbarTitle(text: "Updates", margin: EdgeInsets.only(left: 14.h)),
        actions: [
          // AppbarSubtitleOne(
          //     text: "lbl_share".tr,
          //     margin: EdgeInsets.only(left: 22.h, top: 17.v, right: 16.h)),
          AppbarTrailingImage(
              imagePath: ImageConstant.imgSend,
              onTap: () =>
                  {shareToWhatsApp(model.heading ?? "", model.image ?? "")},
              margin: EdgeInsets.only(left: 5.h, top: 17.v, right: 38.h))
        ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
